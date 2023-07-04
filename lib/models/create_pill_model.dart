class CreatePill {
  String? name;
  String? frequency;
  DateTime? startTakingPill;
  DateTime? endTakingPill;
  DateTime? reminderEveryDay;

  CreatePill({
    this.name,
    this.frequency,
    this.startTakingPill,
    this.endTakingPill,
    this.reminderEveryDay,
  });

  CreatePill copyWith({
    String? name,
    String? frequency,
    DateTime? startTakingPill,
    DateTime? endTakingPill,
    DateTime? reminderEveryDay,
  }) {
    return CreatePill(
      name: name,
      frequency: frequency,
      startTakingPill: startTakingPill,
      endTakingPill: endTakingPill,
      reminderEveryDay: reminderEveryDay,
    );
  }
}
