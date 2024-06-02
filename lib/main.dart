// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:micro_room_automation/firebase_options.dart';
import 'package:micro_room_automation/screens/edit_curtain.dart';
import 'package:micro_room_automation/screens/edit_fan.dart';
import 'package:micro_room_automation/screens/home.dart';
import 'package:micro_room_automation/screens/light/edit_balcony.dart';
import 'package:micro_room_automation/screens/light/edit_bed.dart';
import 'package:micro_room_automation/screens/light/edit_main.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: FToastBuilder(),
      title: 'Personel Room Automation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/edit/fan': (context) => const EditFan(),
        '/edit/curtain': (context) => const EditCurtain(),
        '/edit/main': (context) => const EditMainLight(),
        '/edit/bed': (context) => const EditBedLight(),
        '/edit/balcony': (context) => const EditBalconyLight(),
      },
      home: const PersonalRoomAutomation(title: 'Personal Room Automation'),
    );
  }
}

class PersonalRoomAutomation extends StatefulWidget {
  const PersonalRoomAutomation({super.key, required this.title});
  final String title;

  @override
  State<PersonalRoomAutomation> createState() => _PersonalRoomAutomationState();
}

class _PersonalRoomAutomationState extends State<PersonalRoomAutomation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        body: SingleChildScrollView(child: HomeScreen()),
      ),
    );
  }
}
