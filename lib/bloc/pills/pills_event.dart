import 'package:flutter/material.dart';

import '../../models/models.dart';

class PillsEvent {}

class PillsEventTakePill extends PillsEvent {
  final int pillId;
  PillsEventTakePill({required this.pillId});
}

class PillsEventCreatePill extends PillsEvent {
  final Medicine createPill;
  final GlobalKey<FormState> formKey;

  PillsEventCreatePill({required this.createPill, required this.formKey});
}

class PillsEventGetPillsByDay extends PillsEvent {
  final DateTime day;

  PillsEventGetPillsByDay({required this.day});
}

class PillEventChangeReminder extends PillsEvent {
  final int pillId;
  final TimeOfDay timeOfDay;

  PillEventChangeReminder({required this.pillId, required this.timeOfDay});
}
