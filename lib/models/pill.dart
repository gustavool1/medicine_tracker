import 'dart:math';

import 'package:alarm/alarm.dart';
import 'package:medicine_tracker/helpers/extensions.dart';
import 'package:medicine_tracker/models/models.dart';

import '../styles/styles.dart';

class PillModel {
  final int id;
  final String timeToTake;
  final DateTime takePillDay;
  final String name;
  final int amount;
  bool isTaken;

  PillModel({
    required this.id,
    required this.timeToTake,
    required this.takePillDay,
    required this.name,
    required this.amount,
    this.isTaken = false,
  });

  factory PillModel.fromMedicineModelToPillModel(Medicine medicine) {
    return PillModel(
      amount: medicine.pillsAmount ?? 1,
      id: 0,
      name: medicine.name ?? '',
      timeToTake: medicine.reminders?[0]?.toHoursMinutes ?? '',
      takePillDay: DateTime.now(),
    );
  }

  void takePill() {
    isTaken = true;
  }

  String get amountLabel {
    if (amount > 1) {
      return '$amount Pilulas';
    }
    return '$amount Pilula';
  }

  factory PillModel.fromMap(Map<String, dynamic> map) {
    return PillModel(
      id: map['id'],
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

  int generateRandomNumber() {
    final random = Random();
    return random.nextInt(10000) + 1;
  }
}
