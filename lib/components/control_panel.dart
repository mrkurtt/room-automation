import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:micro_room_automation/components/light_switch.dart';
import 'package:micro_room_automation/services/preferences.services.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({super.key});

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  DatabaseReference mainRef =
      FirebaseDatabase.instance.ref('preferences/light/main');
  DatabaseReference bedRef =
      FirebaseDatabase.instance.ref('preferences/light/bed');
  DatabaseReference crRef =
      FirebaseDatabase.instance.ref('preferences/light/cr');

  PrefServices ps = PrefServices();

  bool? mainLight = false;
  bool? bedLight = false;
  bool? crLight = false;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    mainRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;

      if (mounted) {
        mainLight = bool.tryParse(data["state"].toString());
      }

      print(mainLight);
    });

    bedRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;

      if (mounted) {
        bedLight = bool.tryParse(data["state"].toString());
      }

      print(bedLight);
    });

    crRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;

      if (mounted) {
        crLight = bool.tryParse(data["state"].toString());
      }

      print(crLight);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LightSwitch(
            label: "Main",
            initialValue: mainLight ?? false,
            onChanged: (isOn) async {
              print('Light is now: $isOn');
              await ps
                  .updateLightState(mainRef, {"state": isOn ? true : false});
            }),
        LightSwitch(
            label: "Bed",
            initialValue: bedLight ?? false,
            onChanged: (isOn) async {
              await ps.updateLightState(bedRef, {"state": isOn ? true : false});
            }),
        LightSwitch(
            label: "Comfort Room",
            initialValue: crLight ?? false,
            onChanged: (isOn) async {
              await ps.updateLightState(crRef, {"state": isOn ? true : false});
            }),
      ],
    );
  }
}
