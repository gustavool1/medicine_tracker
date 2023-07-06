import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';

import '../../models/models.dart';

class PillsBloc extends Bloc<PillsEvent, PillsState> {
  static final List<PillModel> _pills = [
    PillModel(id: '1', amount: 2, name: 'Vitamina Dx', timeToTake: '8:00'),
  ];
  final CreatePillBloc createPillBloc;

  PillsBloc({required this.createPillBloc}) : super(PillsState(_pills)) {
    on<PillsEventTakePill>(_onTakePill);
    on<PillsEventCreatePill>(_onCreatePill);
  }

  _onTakePill(PillsEventTakePill event, Emitter<PillsState> emit) {
    final pill = _pills.firstWhere((pill) => pill.id == event.pillId);
    pill.takePill();
    emit(PillsState(_pills));
  }

  _onCreatePill(PillsEventCreatePill event, Emitter<PillsState> emit) {
    final newPill = PillModel.fromCreatePillToPillModel(event.createPill);
    _pills.add(newPill);
    emit(PillsState(_pills));
  }
}
