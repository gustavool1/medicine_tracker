import 'package:flutter/material.dart';

class Medicine {
  String? name;
  DateTime? startTakingPill;
  DateTime? endTakingPill;
  List<TimeOfDay>? reminders;
  int? frequencyInHours;
  int? pillsAmount;

  Medicine({
    this.name,
    this.startTakingPill,
    this.endTakingPill,
    this.reminders,
    this.frequencyInHours,
    this.pillsAmount,
  });

  Medicine copyWith({
    String? name,
    String? frequency,
    DateTime? startTakingPill,
    DateTime? endTakingPill,
    List<TimeOfDay>? reminders,
    int? frequencyInHours,
    int? pillsAmount,
  }) {
    return Medicine(
      name: name,
      startTakingPill: startTakingPill,
      endTakingPill: endTakingPill,
      reminders: reminders,
      frequencyInHours: frequencyInHours,
      pillsAmount: pillsAmount,
    );
  }
}
