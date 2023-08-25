import 'package:medicine_tracker/helpers/extensions.dart';
import 'package:medicine_tracker/models/models.dart';

class PillModel {
  final String id;
  final String timeToTake;
  final String name;
  final int amount;
  bool isTaken;

  PillModel({
    required this.id,
    required this.timeToTake,
    required this.name,
    required this.amount,
    this.isTaken = false,
  });

  factory PillModel.fromCreatePillToPillModel(CreatePill createPill) {
    return PillModel(
      amount: createPill.pillsAmount ?? 1,
      id: createPill.name ?? '',
      name: createPill.name ?? '',
      timeToTake: createPill.reminderEveryDay?.toHoursMinutes ?? '',
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
        timeToTake: DateTime.parse(map['takePillDay']).toHoursMinutes,
        name: map['name'],
        amount: 2,
        isTaken: map['isTaken']);
  }
}
