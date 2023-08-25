import '../../models/models.dart';

class PillsEvent {}

class PillsEventTakePill extends PillsEvent {
  final String pillId;
  PillsEventTakePill({required this.pillId});
}

class PillsEventCreatePill extends PillsEvent {
  final CreatePill createPill;
  PillsEventCreatePill({required this.createPill});
}

class PillsEventGetPillsByDay extends PillsEvent {
  final DateTime day;
  PillsEventGetPillsByDay({required this.day});
}
