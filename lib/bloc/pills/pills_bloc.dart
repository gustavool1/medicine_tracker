import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';

import '../../models/models.dart';

class PillsBloc extends Bloc<PillsEvent, PillsState> {
  static final List<PillModel> _pills = [
    PillModel(id: '1', amount: 2, name: 'Vitamina Dx', timeToTake: '8:00'),
  ];
  // final CreatePillBloc createPillBloc;
// required this.createPillBloc}
  PillsBloc() : super(PillsState(_pills)) {
    on<PillsEventTakePill>(_onTakePill);
  }

  _onTakePill(PillsEventTakePill event, Emitter<PillsState> emit) {
    final pill = _pills.firstWhere((pill) => pill.id == event.pillId);
    pill.takePill();
    emit(PillsState(_pills));
  }
}
