import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  final Function(TimeOfDay)? onTimeSelected;

  const TimePicker({
    Key? key,
    required this.label,
    required this.controller,
    this.icon = Icons.schedule,
    this.onTimeSelected,
  }) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay? selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
        widget.controller.text = pickedTime.format(context);
      });

      if (widget.onTimeSelected != null) {
        widget.onTimeSelected!(pickedTime);
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
          onPressed: () => _selectTime(context),
          icon: Icon(widget.icon),
          label: Text('Select ${widget.label}'),
        ),
      ],
    );
  }
}

