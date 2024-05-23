import 'package:flutter/material.dart';

class SensorReadings extends StatefulWidget {
  const SensorReadings({super.key});

  @override
  State<SensorReadings> createState() => _SensorReadingsState();
}

class _SensorReadingsState extends State<SensorReadings> {
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
                        fontSize: 15.0,
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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Temperature',
                          ),
                          Text(
                            '32.0',
                            style: TextStyle(
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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Humidity',
                          ),
                          Text(
                            '50%',
                            style: TextStyle(
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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Light',
                          ),
                          Text(
                            'Low',
                            style: TextStyle(
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
