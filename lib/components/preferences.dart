import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:micro_room_automation/utils/format_time.dart';

class Preferences extends StatefulWidget {
  const Preferences({super.key});

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  DatabaseReference pref = FirebaseDatabase.instance.ref("preferences");
  Map prefVals = {};

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    pref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      setState(() {
        prefVals = data as Map;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                children: [
                  Text(
                    'Preferences',
                    style: TextStyle(
                        color: Color.fromARGB(133, 240, 1, 1),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/fan-icon.png',
                        width: 20.0,
                      ),
                      const SizedBox(
                        width: 25.0,
                      ),
                      const Text(
                        'Min. Temp',
                        style:
                            TextStyle(color: Color.fromARGB(255, 76, 76, 76)),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Text(
                          prefVals.isNotEmpty
                              ? prefVals["temp"]["min"].toString()
                              : " ",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 75, 75, 75),
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0)),
                      const SizedBox(
                        width: 16.0,
                      ),
                      const Text(
                        'Max. Temp',
                        style:
                            TextStyle(color: Color.fromARGB(255, 76, 76, 76)),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Text(
                          prefVals.isNotEmpty
                              ? prefVals["temp"]["max"].toString()
                              : " ",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 75, 75, 75),
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0)),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/edit/fan');
                          },
                          icon: const Icon(Icons.edit))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/curtain-icon.png',
                        width: 20.0,
                      ),
                      const SizedBox(
                        width: 25.0,
                      ),
                      const Text(
                        'Open',
                        style:
                            TextStyle(color: Color.fromARGB(255, 76, 76, 76)),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                          prefVals.isNotEmpty
                              ? formatTime(
                                  prefVals["curtain"]["open"].toString())
                              : " ",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 75, 75, 75),
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0)),
                      const SizedBox(
                        width: 7.0,
                      ),
                      const Text(
                        'Close',
                        style:
                            TextStyle(color: Color.fromARGB(255, 76, 76, 76)),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                          prefVals.isNotEmpty
                              ? formatTime(
                                  prefVals["curtain"]["close"].toString())
                              : " ",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 75, 75, 75),
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0)),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/edit/curtain');
                          },
                          icon: const Icon(Icons.edit))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
