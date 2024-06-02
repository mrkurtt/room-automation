import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditFan extends StatefulWidget {
  const EditFan({super.key});

  @override
  State<EditFan> createState() => _EditFanState();
}

class _EditFanState extends State<EditFan> {
  DatabaseReference tempRef = FirebaseDatabase.instance.ref("preferences/temp");

  final TextEditingController newMinTemp = TextEditingController();
  final TextEditingController newMaxTemp = TextEditingController();

  int? minTemp;
  int? maxTemp;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    tempRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;

      if (mounted) {
        setState(() {
          minTemp = int.parse(data["min"].toString());
          maxTemp = int.parse(data["max"].toString());
        });
      }
    });
  }

  void saveUpdate() async {
    if (newMinTemp.text != '' || newMaxTemp.text != '') {
      await tempRef.update({
        "min": int.tryParse(newMinTemp.text) ?? minTemp,
        "max": int.tryParse(newMaxTemp.text) ?? maxTemp,
      }).then((value) {
        newMaxTemp.clear();
        newMinTemp.clear();
        Fluttertoast.showToast(
            msg: 'Preference saved.',
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    minTemp.toString(),
                    style: const TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  Text(
                    maxTemp.toString(),
                    style: const TextStyle(
                        fontSize: 25.0,
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
                controller: newMinTemp,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText:
                      'Enter Minimum Temperature (C)', // Optional label text
                  hintText: minTemp.toString(), // Optional hint text
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(16.0), // Set rounded corners
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextField(
                controller: newMaxTemp,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText:
                      'Enter Maximum Temperature (C)', // Optional label text
                  hintText: maxTemp.toString(), // Optional hint text
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(16.0), // Set rounded corners
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextButton(
                onPressed: saveUpdate,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green, // Button background color
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0), // Add padding around text
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
