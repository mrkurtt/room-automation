import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:micro_room_automation/utils/format_time.dart';
import 'package:micro_room_automation/widgets/time_picker.dart';

class EditCurtain extends StatefulWidget {
  const EditCurtain({super.key});

  @override
  State<EditCurtain> createState() => _EditCurtainState();
}

class _EditCurtainState extends State<EditCurtain> {
  DatabaseReference curtainRef =
      FirebaseDatabase.instance.ref('preferences/curtain');

  String? openTime;
  String? closeTime;
  Map<String, Object?> updates = {};

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    curtainRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;
      if (mounted) {
        setState(() {
          openTime = formatTime(data["open"].toString());
          closeTime = formatTime(data["close"].toString());
        });
      }

      updates["open"] = data["open"];
      updates["close"] = data["close"];
    });
  }

  void saveUpdate() async {
    if (updates.isNotEmpty) {
      await curtainRef.update(updates).then((value) {
        Fluttertoast.showToast(
            msg: 'Preference saved.',
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color.fromARGB(255, 77, 77, 77),
            textColor: Colors.white,
            fontSize: 16.0);
        updates.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text(
            'Edit Curtain Preferences',
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
                  Text('Time to Open'),
                  Text('Time to Close'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    openTime.toString(),
                    style: const TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  Text(
                    closeTime.toString(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Open Time: ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  TimePickerWidget(
                    label: 'Select Open Time',
                    initialTime: TimeOfDay.now().replacing(hour: 0, minute: 0),
                    onTimeSelected: (time) {
                      updates["open"] =
                          "${time?.hour}:${time!.minute < 10 ? '0${time.minute}' : time.minute}";

                      print(updates);
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
                    'Close Time: ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  TimePickerWidget(
                    label: 'Select Close Time',
                    initialTime: TimeOfDay.now().replacing(hour: 0, minute: 0),
                    onTimeSelected: (time) {
                      updates["close"] =
                          "${time?.hour}:${time!.minute < 10 ? '0${time.minute}' : time.minute}";
                      print(updates);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
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
