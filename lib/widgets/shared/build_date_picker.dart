import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final DateFormat dateFormat;
  final IconData icon;
  final Function(DateTime)? onDateSelected;

  const DateTimeWidget({
    Key? key,
    required this.label,
    required this.controller,
    required this.dateFormat,
    this.icon = Icons.calendar_today,
    this.onDateSelected,
  }) : super(key: key);

  @override
  _DateTimeWidgetState createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        widget.controller.text = widget.dateFormat.format(selectedDate!);
      });

      if (widget.onDateSelected != null) {
        widget.onDateSelected!(pickedDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            readOnly: true,
            decoration: InputDecoration(
              labelText: widget.label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        ElevatedButton.icon(
          onPressed: () => _selectDate(context),
          icon: Icon(widget.icon),
          label: Text('Select ${widget.label}'),
        ),
      ],
    );
  }
}

