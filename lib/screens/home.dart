import 'package:flutter/material.dart';
import 'package:micro_room_automation/components/control_panel.dart';
import 'package:micro_room_automation/components/preferences.dart';
import 'package:micro_room_automation/components/sensor_readings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setInt('loggedIn', 0);
    Navigator.popAndPushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 249, 249, 249),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Row(
                        children: [
                          const Text(
                            'My Room',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 10.0),
                          Image.asset(
                            'assets/wave-icon.png',
                            width: 30.0,
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/profile-icon.png',
                      width: 40.0,
                      height: 40.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const SensorReadings(),
                const SizedBox(
                  height: 10.0,
                ),
                const Preferences(),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(
                        'Lights Control',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(133, 240, 1, 1)),
                      ),
                    ],
                  ),
                ),
                const ControlPanel(),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 223, 22, 18),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                        ),
                        onPressed: logout,
                        child: Text(
                          'Logout',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
