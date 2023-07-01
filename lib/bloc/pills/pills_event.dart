class PillsEvent {}

class PillsEventTakePill extends PillsEvent {
  final String pillId;
  PillsEventTakePill({required this.pillId});
}
