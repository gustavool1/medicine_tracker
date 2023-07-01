import '../../models/models.dart';

class PillsState {
  final List<PillModel> pills;

  PillsState(this.pills);
}

class PillInitial extends PillsState {
  PillInitial() : super([]);
}
