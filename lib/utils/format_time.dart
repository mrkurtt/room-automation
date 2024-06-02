String formatTime(String time) {
  List splitTime = time.split(":");

  String hour = splitTime[0];
  String minute = splitTime[1];

  int? eqHour = int.tryParse(hour);
  String? indicator = "am";

  if (eqHour == 0) {
    eqHour = 12;
  }

  if (eqHour! > 12) {
    eqHour = eqHour - 12;
    indicator = "pm";
  }

  return '$eqHour:$minute $indicator';
}
