import 'package:flutter/material.dart';

class CreatePill {
  String? name;
  DateTime? startTakingPill;
  DateTime? endTakingPill;
  TimeOfDay? reminderEveryDay;
  int? frequencyInHours;
  int? pillsAmount;

  CreatePill({
    this.name,
    this.startTakingPill,
    this.endTakingPill,
    this.reminderEveryDay,
    this.frequencyInHours,
    this.pillsAmount,
  });

  CreatePill copyWith({
    String? name,
    String? frequency,
    DateTime? startTakingPill,
    DateTime? endTakingPill,
    TimeOfDay? reminderEveryDay,
    int? frequencyInHours,
    int? pillsAmount,
  }) {
    return CreatePill(
      name: name,
      startTakingPill: startTakingPill,
      endTakingPill: endTakingPill,
      reminderEveryDay: reminderEveryDay,
      frequencyInHours: frequencyInHours,
      pillsAmount: pillsAmount,
    );
  }
}
