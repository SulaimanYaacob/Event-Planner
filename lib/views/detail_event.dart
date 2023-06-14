import 'package:event_planner/models/events_model.dart';
import 'package:event_planner/utils/gap_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailEvent extends StatelessWidget {
  const DetailEvent({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    final String eventDate = DateFormat('dd-MM-yyyy').format(event.date);
    final String startTime = DateFormat.jm().format(event.timeStart);
    final String endTime = DateFormat.jm().format(event.timeEnd);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(event.title),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 5),
                      image: DecorationImage(
                        image: NetworkImage(event.image ?? ''),
                        fit: BoxFit.cover,
                      )),
                  height: 300),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      event.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 20,
                      thickness: 2,
                      indent: 125,
                      endIndent: 125,
                    ),
                    Text(event.description ?? '', textAlign: TextAlign.center),
                  ].withSpaceBetween(height: 10),
                ),
                Table(
                  border: TableBorder.all(color: Colors.black, width: 2),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                  },
                  children: [
                    tableRow('Venue', event.venue ?? ''),
                    tableRow('Date', eventDate),
                    tableRow('Time', startTime, endTime),
                    tableRow('Recurring', event.recurring ? 'Yes' : 'No'),
                  ],
                ),
                const SizedBox(height: 20),
              ].withSpaceBetween(height: 20),
            ),
          ),
        ],
      ),
    );
  }
}

TableRow tableRow(String title, String value, [String? value2]) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        value2 != null ? "$value - $value2" : value,
      ),
    ),
  ]);
}
