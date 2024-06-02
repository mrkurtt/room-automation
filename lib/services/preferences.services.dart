import 'package:firebase_database/firebase_database.dart';

class PrefServices {
  Future<bool> updateTempPref(
      DatabaseReference ref, Map<String, int> updates) async {
    bool success = false;

    await ref.update(updates).then((value) {
      success = true;
    }).catchError((err) {
      success = false;
    });

    return success;
  }

  Future<bool> updateLightSchedule(
      DatabaseReference ref, Map<String, String> updates) async {
    bool success = false;

    await ref.update(updates).then((value) {
      success = true;
    }).catchError((err) {
      success = false;
    });

    return success;
  }
}
