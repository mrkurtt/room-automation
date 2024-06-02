import 'package:firebase_database/firebase_database.dart';

class SensorReadingsService {
  DatabaseReference tempRef = FirebaseDatabase.instance.ref("sreadings/temp");

  Future<double?> getTemp() async {
    final snapshot = await tempRef.get();

    if (snapshot.exists) {
      return double.parse(snapshot.value.toString());
    } else {
      return null;
    }
  }
}
