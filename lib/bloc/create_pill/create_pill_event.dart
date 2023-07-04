class CreatePillEvent {}

class CreatePillSetPillName extends CreatePillEvent {
  String name;

  CreatePillSetPillName(this.name);
}
