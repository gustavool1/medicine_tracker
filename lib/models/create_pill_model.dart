import 'package:flutter/material.dart';

class CreatePill {
  String? name;
  DateTime? startTakingPill;
  DateTime? endTakingPill;
  TimeOfDay? reminderEveryDay;
  int? frequencyInHours;

  CreatePill({
    this.name,
    this.startTakingPill,
    this.endTakingPill,
    this.reminderEveryDay,
    this.frequencyInHours,
  });

  CreatePill copyWith({
    String? name,
    String? frequency,
    DateTime? startTakingPill,
    DateTime? endTakingPill,
    TimeOfDay? reminderEveryDay,
    int? frequencyInHours,
  }) {
    return CreatePill(
      name: name,
      startTakingPill: startTakingPill,
      endTakingPill: endTakingPill,
      reminderEveryDay: reminderEveryDay,
      frequencyInHours: frequencyInHours,
    );
  }
}
