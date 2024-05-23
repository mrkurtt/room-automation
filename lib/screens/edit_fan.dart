import 'package:flutter/material.dart';

class EditFan extends StatefulWidget {
  const EditFan({super.key});

  @override
  State<EditFan> createState() => _EditFanState();
}

class _EditFanState extends State<EditFan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text(
            'Edit Temp Preferences',
            style: TextStyle(fontWeight: FontWeight.bold),
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
                  Text('Min. Temperature'),
                  Text('Max. Temperature'),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '18',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  Text(
                    '22',
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
              const SizedBox(
                height: 16.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText:
                      'Enter Minimum Temperature (C)', // Optional label text
                  hintText: '18', // Optional hint text
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(16.0), // Set rounded corners
                  ),
                ),
                onChanged: (text) {
                  // Function called when the text changes
                  print('You entered: $text');
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText:
                      'Enter Maximum Temperature (C)', // Optional label text
                  hintText: '18', // Optional hint text
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(16.0), // Set rounded corners
                  ),
                ),
                onChanged: (text) {
                  // Function called when the text changes
                  print('You entered: $text');
                },
              ),
              const SizedBox(
                height: 16.0,
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
                      vertical: 8.0,
                      horizontal: 16.0), // Add padding around text
                ),
              ),
            ],
          ),
        ));
  }
}
