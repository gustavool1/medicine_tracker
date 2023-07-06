import 'package:medicine_tracker/helpers/extensions.dart';
import 'package:medicine_tracker/models/models.dart';

class PillModel {
  final String id;
  final String timeToTake;
  final String name;
  final int amount;
  bool isTakeit;

  PillModel({
    required this.id,
    required this.timeToTake,
    required this.name,
    required this.amount,
    this.isTakeit = false,
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
    isTakeit = true;
  }

  String get amountLabel {
    if (amount > 1) {
      return '$amount Pilulas';
    }
    return '$amount Pilula';
  }
}
