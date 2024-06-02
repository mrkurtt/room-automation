import 'package:flutter/material.dart';
import 'package:micro_room_automation/components/light_schedule.dart';
import 'package:micro_room_automation/components/preferences.dart';
import 'package:micro_room_automation/components/sensor_readings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      'Hey, Kurt',
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
          const Row(
            children: [
              Text('Manage your room'),
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
          const LightSchedule(),
          const SizedBox(
            height: 10.0,
          ),
          // const ControlPanel()
        ],
      ),
    );
  }
}
