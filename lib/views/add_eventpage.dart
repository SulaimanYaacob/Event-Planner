import 'package:event_planner/models/events_model.dart';
import 'package:event_planner/services/auth.dart';
import 'package:event_planner/services/events.service.dart';
import 'package:event_planner/utils/gap_extension.dart';
import 'package:event_planner/widgets/shared/build_date_picker.dart';
import 'package:event_planner/widgets/shared/build_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:event_planner/widgets/shared/build_text_form.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key, Event? event}) : super(key: key);

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
  DateTime date = DateTime(2023, 6, 15);
  final DateFormat _dateFormat = DateFormat('dd/MM/yy');
  XFile? image;
  final ImagePicker picker = ImagePicker();
  DateTime selectedDate = DateTime.now();
  TimeOfDay? selectedTimeStart;
  TimeOfDay? selectedTimeEnd;

  // Event event = Event(
  //   title: '',
  //   subtitle: '123',
  //   description: '123',
  //   venue: '123',
  //   date: DateTime.now(),
  //   timeStart: DateTime.now(),
  //   timeEnd: DateTime.now(),
  //   image: '123',
  //   recurring: false,
  // );

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: 125,
          title: Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.white.withOpacity(0.8),
                //   ),
                //   height: 100,
                //   width: 100,
                //   padding: const EdgeInsets.all(10),
                //   child: Image.asset('images/UTM.png'),
                // ),
                // const Expanded(
                Expanded(
                  child: Center(
                    child: Image.network(
                      'https://i.ibb.co/X8WD4Vy/Helena-Paquet.png',
                      width: 200,
                      height: 200,
                    ),
                    // Text(
                    //   'Add Event',
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.white,
                    //   ),
                    // ),
                  ),
                ),
              ],
            ),
          ),
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
                      //TITLE FIELD
                      BuildTextForm(
                          config: TextFieldConfig(
                        label: 'Title',
                        controller: _controllerTitle,
                        borderRadius: 20,
                      )),
                      // SUBTITLE FIELD
                      BuildTextForm(
                          config: TextFieldConfig(
                              label: 'Subtitle',
                              controller: _controllerSubtitle,
                              borderRadius: 20)),
                      // DESCRIPTION FIELD
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 5,
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: const TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0,
                            ),
                          ),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                      // VENUE FIELD
                      BuildTextForm(
                          config: TextFieldConfig(
                              label: 'Venue',
                              controller: _controllerVenue,
                              borderRadius: 20)),
                      // DATE FIELD
                      DateTimeWidget(
                        label: 'Date',
                        controller: _controllerDate,
                        dateFormat: _dateFormat,
                        icon: Icons.calendar_today,
                        onDateSelected: (date) {
                          setState(() {
                            selectedDate = date;
                          });
                        },
                      ),
                      TimePicker(
                        label: 'Time Start',
                        controller: _controllerTimeStart,
                        icon: Icons.schedule,
                        onTimeSelected: (time) {
                          setState(() {
                            selectedTimeStart = time;
                          });
                        },
                      ),
                      TimePicker(
                        label: 'Time End',
                        controller: _controllerTimeEnd,
                        icon: Icons.schedule,
                        onTimeSelected: (time) {
                          setState(() {
                            selectedTimeEnd = time;
                          });
                        },
                      ),

                      // IMAGE FIELD (NOT WORKING ON CHROME DISPLAY)
                      BuildTextForm(
                          config: TextFieldConfig(
                              label: 'Image',
                              controller: _controllerImage,
                              borderRadius: 20)),
                      ElevatedButton.icon(
                          icon: const Icon(Icons.image),
                          label: const Text('Select Image'),
                          onPressed: () {
                            myAlert();
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      image != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  //to show image, you type like this.
                                  File(image!.path),
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: 300,
                                ),
                              ),
                            )
                          : const Text(
                              "No Image",
                              style: TextStyle(fontSize: 20),
                            ),
                      // Convert date to Timestamp

                      // ADD EVENT BUTTON
                      OutlinedButton(
                          onPressed: () async {
                            try {
                              Event event = Event(
                                title: _controllerTitle.text,
                                subtitle: _controllerSubtitle.text,
                                description: _controllerDescription.text,
                                venue: _controllerVenue.text,
                                date: selectedDate,
                                timeStart: DateTime(
                                    selectedDate.year,
                                    selectedDate.month,
                                    selectedDate.day,
                                    selectedTimeStart!.hour,
                                    selectedTimeStart!.minute),
                                timeEnd: DateTime(
                                    selectedDate.year,
                                    selectedDate.month,
                                    selectedDate.day,
                                    selectedTimeEnd!.hour,
                                    selectedTimeEnd!.minute),
                                image: _controllerImage.text,
                                recurring: false,
                              );
                              await EventService().addEvent(event);
                            } catch (e) {
                              debugPrint(e as String?);
                            }
                          },
                          child: const Text('Add Event'))
                    ].withSpaceBetween(height: 25),
                  ),
                ),
              ].withSpaceBetween(height: 25),
            ),
          ),
        ));
  }
}
