import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  final String label;
  final TimeOfDay? initialTime;
  final void Function(TimeOfDay? time) onTimeSelected;

  const TimePickerWidget({
    required this.label,
    this.initialTime,
    required this.onTimeSelected,
  });

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = widget.initialTime;
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
        widget.onTimeSelected(selectedTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _selectTime,
      child: Text(
        selectedTime?.format(context) ?? widget.label,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
    );
  }
}
