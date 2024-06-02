import 'package:flutter/material.dart';

class LightSchedule extends StatefulWidget {
  const LightSchedule({super.key});

  @override
  State<LightSchedule> createState() => _LightScheduleState();
}

class _LightScheduleState extends State<LightSchedule> {
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
                    'Light Schedule',
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
                      const Text('MAIN'),
                      const SizedBox(
                        width: 8.0,
                      ),
                      const Text(
                        'ON',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        '5:30pm',
                        style: TextStyle(
                            color: Color.fromARGB(255, 75, 75, 75),
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      const Text(
                        'OFF',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        '5:30pm',
                        style: TextStyle(
                            color: Color.fromARGB(255, 75, 75, 75),
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/edit/main');
                          },
                          icon: const Icon(Icons.edit))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('BED'),
                      const SizedBox(
                        width: 15.0,
                      ),
                      const Text(
                        'ON',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        '5:30pm',
                        style: TextStyle(
                            color: Color.fromARGB(255, 75, 75, 75),
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      const Text(
                        'OFF',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        '5:30pm',
                        style: TextStyle(
                            color: Color.fromARGB(255, 75, 75, 75),
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/edit/bed');
                          },
                          icon: const Icon(Icons.edit))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('BLCN'),
                      const SizedBox(
                        width: 8.0,
                      ),
                      const Text(
                        'ON',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        '5:30pm',
                        style: TextStyle(
                            color: Color.fromARGB(255, 75, 75, 75),
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      const Text(
                        'OFF',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        '5:30pm',
                        style: TextStyle(
                            color: Color.fromARGB(255, 75, 75, 75),
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/edit/balcony');
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
