import 'package:flutter/material.dart';

import '../../models/models.dart';

class PillsEvent {}

class PillsEventTakePill extends PillsEvent {
  final String pillId;
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
