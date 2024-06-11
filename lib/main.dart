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
import 'package:micro_room_automation/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<int> checkLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  int? loggedIn = prefs.getInt('loggedIn') ?? 0;
  return loggedIn;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  int loggedIn = await checkLoggedIn();
  print(loggedIn);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp(
    isLoggedIn: loggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final int isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

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
        '/login': (context) => const Login(),
        '/home': (context) => const HomeScreen(),
        '/edit/fan': (context) => const EditFan(),
        '/edit/curtain': (context) => const EditCurtain(),
        '/edit/main': (context) => const EditMainLight(),
        '/edit/bed': (context) => const EditBedLight(),
        '/edit/balcony': (context) => const EditBalconyLight(),
      },
      initialRoute: isLoggedIn.toInt() == 1 ? '/home' : '/login',
      // home: const PersonalRoomAutomation(title: 'Personal Room Automation'),
    );
  }
}
