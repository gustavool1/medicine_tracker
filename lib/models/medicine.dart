import 'package:flutter/material.dart';
import 'package:medicine_tracker/models/models.dart';

class Medicine {
  String? id;
  String? name;
  DateTime? startTakingPill;
  DateTime? endTakingPill;
  List<TimeOfDay?>? reminders;
  int? frequencyInHours;
  int? pillsAmount;
  List<PillModel>? pills;

  Medicine({
    this.id,
    this.name,
    this.startTakingPill,
    this.endTakingPill,
    this.reminders,
    this.frequencyInHours,
    this.pillsAmount = 1,
    this.pills,
  });

  Medicine copyWith({
    String? id,
    String? name,
    String? frequency,
    DateTime? startTakingPill,
    DateTime? endTakingPill,
    List<TimeOfDay?>? reminders,
    int? frequencyInHours,
    int? pillsAmount,
    List<PillModel>? pills,
  }) {
    return Medicine(
      id: id,
      name: name,
      startTakingPill: startTakingPill,
      endTakingPill: endTakingPill,
      reminders: reminders,
      frequencyInHours: frequencyInHours,
      pillsAmount: pillsAmount,
      pills: pills,
    );
  }

  factory Medicine.fromJson(Map<String, dynamic> map) {
    return Medicine(
      id: map['id'],
      name: map['name'],
      frequencyInHours: map['frequencyfrequency'],
      pillsAmount: map['frequency'],
      endTakingPill: DateTime.parse(map['until']),
      pills: (map['pills'] as List<dynamic>)
          .map((pill) => PillModel.fromMap(pill as Map<String, dynamic>))
          .toList(),
    );
  }

  void setAlarmForAllPills() {
    if (pills != null) {
      for (var pill in pills!) {
        pill.setAlarm();
      }
    }
  }
}
