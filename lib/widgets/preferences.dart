import 'package:flutter/material.dart';

class Preferences extends StatefulWidget {
  const Preferences({super.key});

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
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
                    'Preferences',
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
                      const Text('21',
                          style: TextStyle(
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
                      const Text('28',
                          style: TextStyle(
                              color: Color.fromARGB(255, 75, 75, 75),
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0)),
                      // const SizedBox(
                      //   width: 25.0,
                      // ),
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
                      const Text('6:00am',
                          style: TextStyle(
                              color: Color.fromARGB(255, 75, 75, 75),
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0)),
                      const SizedBox(
                        width: 20.0,
                      ),
                      const Text(
                        'Close',
                        style:
                            TextStyle(color: Color.fromARGB(255, 76, 76, 76)),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      const Text('10:30pm',
                          style: TextStyle(
                              color: Color.fromARGB(255, 75, 75, 75),
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0)),
                      // const SizedBox(
                      //   width: 13.0,
                      // ),
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
