import 'package:firebase_database/firebase_database.dart';

class PrefServices {
  DatabaseReference tempRef = FirebaseDatabase.instance.ref("preferences/temp");

  tempInit(int min, int max) {
    tempRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;
      min = int.parse(data["min"].toString());
      max = int.parse(data["max"].toString());
    });
  }

  updateTempPref(String newMin, String newMax) async {
    await tempRef.update({
      "min": int.tryParse(newMin),
      "max": int.tryParse(newMax),
    });
  }
}
