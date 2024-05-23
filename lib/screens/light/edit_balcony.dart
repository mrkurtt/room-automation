import 'package:flutter/material.dart';
import 'package:micro_room_automation/widgets/time_picker.dart';

class EditBalconyLight extends StatefulWidget {
  const EditBalconyLight({super.key});

  @override
  State<EditBalconyLight> createState() => _EditBalconyLightState();
}

class _EditBalconyLightState extends State<EditBalconyLight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          'Edit Balcony Light Schedule',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  'Current',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Time ON'),
                Text('Time OFF'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '6:00am',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                Text(
                  '10:30pm',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ],
            ),
            const Divider(
              height: 30.0,
            ),
            const Row(
              children: [
                Text(
                  'Update',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Time ON: ',
                  style: TextStyle(fontSize: 16.0),
                ),
                TimePickerWidget(
                  label: 'Select Time ON',
                  initialTime: TimeOfDay.now().replacing(hour: 0, minute: 0),
                  onTimeSelected: (time) {
                    print('Selected time: $time');
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Time OFF: ',
                  style: TextStyle(fontSize: 16.0),
                ),
                TimePickerWidget(
                  label: 'Select Time OFF',
                  initialTime: TimeOfDay.now().replacing(hour: 0, minute: 0),
                  onTimeSelected: (time) {
                    print('Selected time: $time');
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () {
                print('You pressed the button!');
              },
              child: const Text(
                'Save Changes',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.green, // Button background color
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 16.0), // Add padding around text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
