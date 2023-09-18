import 'package:alarm/alarm.dart';

import '../styles/styles.dart';

class PillModel {
  final int id;
  final String medicineId;
  final DateTime takePillDay;
  final String name;
  final int amount;
  String timeToTake;
  bool isTaken;

  PillModel({
    required this.id,
    required this.medicineId,
    required this.timeToTake,
    required this.takePillDay,
    required this.name,
    required this.amount,
    this.isTaken = false,
  });

  void takePill() => isTaken = true;

  String get amountLabel {
    if (amount > 1) {
      return '$amount Pilulas';
    }
    return '$amount Pilula';
  }

  factory PillModel.fromMap(Map<String, dynamic> map) {
    return PillModel(
      id: map['id'],
      medicineId: map['medicineId'],
      timeToTake: map['takePillHour'],
      takePillDay: DateTime.parse(map['takePillDay']),
      name: map['name'],
      amount: 2,
      isTaken: map['isTaken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timeToTake': timeToTake,
      'takePillDay': takePillDay.toIso8601String(),
      'name': name,
      'amount': amount,
      'isTaken': isTaken,
    };
  }

  void setAlarm() {
    final hoursAndMinutes = timeToTake.split(":");

    final hourToRing = DateTime(
      takePillDay.year,
      takePillDay.month,
      takePillDay.day,
      int.parse(hoursAndMinutes[0]),
      int.parse(hoursAndMinutes[1]),
    );

    final alarmSettings = AlarmSettings(
      id: id,
      dateTime: hourToRing,
      assetAudioPath: Audios.dendenmushi,
    );
    Alarm.set(alarmSettings: alarmSettings);
  }
}
