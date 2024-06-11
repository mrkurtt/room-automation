import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SensorReadings extends StatefulWidget {
  const SensorReadings({super.key});

  @override
  State<SensorReadings> createState() => _SensorReadingsState();
}

class _SensorReadingsState extends State<SensorReadings> {
  DatabaseReference tempRef = FirebaseDatabase.instance.ref("sreadings/temp");
  DatabaseReference humRef =
      FirebaseDatabase.instance.ref("sreadings/humidity");
  DatabaseReference lightRef = FirebaseDatabase.instance.ref("sreadings/light");

  double? tempValue = 0.0;
  double? humValue = 0.0;
  String? lightValue = "";

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    tempRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;

      if (mounted) {
        setState(() {
          tempValue = double.parse(data.toString());
        });
      }
    });

    humRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;

      if (mounted) {
        setState(() {
          humValue = double.parse(data.toString());
        });
      }
    });

    lightRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;

      if (mounted) {
        setState(() {
          lightValue = data.toString();
        });
      }
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
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                children: [
                  Text(
                    'Sensor Readings',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/temp-icon.png',
                        width: 30.0,
                        height: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Temperature',
                          ),
                          Text(
                            '$tempValue',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 75, 75, 75),
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/hum-icon.png',
                        width: 40.0,
                        height: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Humidity',
                          ),
                          Text(
                            '$humValue',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 75, 75, 75),
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/light-icon.png',
                        width: 40.0,
                        height: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Light',
                          ),
                          Text(
                            '$lightValue',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 75, 75, 75),
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
