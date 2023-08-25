import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';
import 'package:medicine_tracker/helpers/extensions.dart';
import 'package:medicine_tracker/repositories/repositories.dart';

import '../../models/models.dart';

class PillsBloc extends Bloc<PillsEvent, PillsState> {
  static List<PillModel> _pills = [];
  final CreatePillBloc createPillBloc;
  final MedicineRepository medicineRepository;
  final PillRepository pillRepository;

  PillsBloc({
    required this.createPillBloc,
    required this.medicineRepository,
    required this.pillRepository,
  }) : super(PillInitial()) {
    on<PillsEventTakePill>(_onTakePill);
    on<PillsEventCreatePill>(_onCreatePill);
    on<PillsEventGetPillsByDay>(_onGetPillsByDay);
  }

  _onTakePill(PillsEventTakePill event, Emitter<PillsState> emit) async {
    final pill = _pills.firstWhere((pill) => pill.id == event.pillId);
    final shouldTakePill = await pillRepository.takePill(event.pillId);

    if (shouldTakePill) {
      pill.takePill();
      emit(PillsState(_pills));
    }
  }

  _onCreatePill(PillsEventCreatePill event, Emitter<PillsState> emit) async {
    final newPill = PillModel.fromCreatePillToPillModel(event.createPill);
    _pills.add(newPill);
    await medicineRepository.createMedicine(event.createPill);
    emit(PillsState(_pills));
  }

  _onGetPillsByDay(
      PillsEventGetPillsByDay event, Emitter<PillsState> emit) async {
    emit(PillLoading());
    _pills = await pillRepository.getPillsByDay(event.day.yMD);
    await Future.delayed(const Duration(seconds: 2));

    if (_pills.isEmpty) {
      emit(PillEmpty());
      return;
    }
    emit(PillsState(_pills));
  }
}
