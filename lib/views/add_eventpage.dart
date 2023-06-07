import 'package:event_planner/models/events_model.dart';
import 'package:event_planner/utils/gap_extension.dart';
import 'package:flutter/material.dart';
import '../services/myevents.service.dart';
import 'package:event_planner/widgets/shared/build_text_form.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerSubtitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerVenue = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();
  final TextEditingController _controllerTimeStart = TextEditingController();
  final TextEditingController _controllerTimeEnd = TextEditingController();
  final TextEditingController _controllerImage = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Event"),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    children: [
                      BuildTextForm(
                          config: TextFieldConfig(
                        label: 'Title',
                        controller: _controllerTitle,
                        borderRadius: 20,
                      )),
                      const SizedBox(
                        height: 25,
                      ),
                      BuildTextForm(
                          config: TextFieldConfig(
                              label: 'Subtitle',
                              controller: _controllerSubtitle,
                              borderRadius: 20)),
                      const SizedBox(
                        height: 25,
                      ),
                      BuildTextForm(
                          config: TextFieldConfig(
                              label: 'Description',
                              controller: _controllerDescription,
                              borderRadius: 20)),
                      const SizedBox(
                        height: 25,
                      ),
                      BuildTextForm(
                          config: TextFieldConfig(
                              label: 'Venue',
                              controller: _controllerVenue,
                              borderRadius: 20)),
                      const SizedBox(
                        height: 25,
                      ),
                      BuildTextForm(
                          config: TextFieldConfig(
                              label: 'Date',
                              controller: _controllerDate,
                              borderRadius: 20)),
                      const SizedBox(
                        height: 25,
                      ),
                      BuildTextForm(
                          config: TextFieldConfig(
                              label: 'Time Start',
                              controller: _controllerTimeStart,
                              borderRadius: 20)),
                      const SizedBox(
                        height: 25,
                      ),
                      BuildTextForm(
                          config: TextFieldConfig(
                              label: 'Time End',
                              controller: _controllerTimeEnd,
                              borderRadius: 20)),
                      const SizedBox(
                        height: 25,
                      ),
                      BuildTextForm(
                          config: TextFieldConfig(
                              label: 'Image',
                              controller: _controllerImage,
                              borderRadius: 20)),
                    ],
                  ),
                ),
              ].withSpaceBetween(height: 25),
            ),
          ),
        ));
  }
}
