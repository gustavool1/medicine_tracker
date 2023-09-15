import '../../models/models.dart';

class PillsState {
  final List<PillModel> pills;

  PillsState(this.pills);
}

class PillInitial extends PillsState {
  PillInitial() : super([]);
}

class PillLoading extends PillsState {
  PillLoading() : super([]);
}

class PillEmpty extends PillsState {
  PillEmpty() : super([]);
}

class PillLoadingCreation extends PillsState {
  PillLoadingCreation() : super([]);
}

class PillCreatedSuccessfuly extends PillsState {
  PillCreatedSuccessfuly() : super([]);
}

class PillSetReminderSuccessfuly extends PillsState {
  PillSetReminderSuccessfuly() : super([]);
}
