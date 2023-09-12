import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medicine_tracker/bloc/bloc.dart';
import 'package:medicine_tracker/helpers/extensions.dart';
import 'package:medicine_tracker/repositories/repositories.dart';

import '../../models/models.dart';

class PillsBloc extends Bloc<PillsEvent, PillsState> {
  static List<PillModel> _pills = [];
  final MedicineBloc medicineBloc;
  final MedicineRepository medicineRepository;
  final PillRepository pillRepository;

  PillsBloc({
    required this.medicineBloc,
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
    emit(PillLoadingCreation());

    if (event.formKey.currentState?.validate() ?? false) {
      final medicine =
          await medicineRepository.createMedicine(event.createPill);
      medicine.setAlarmForAllPills();

      medicine.pills?.forEach((pill) {
        final today = DateTime.now();
        if (pill.takePillDay.day == today.day &&
            pill.takePillDay.month == today.month &&
            pill.takePillDay.year == today.year) {
          _pills.add(pill);
        }
      });

      Fluttertoast.showToast(
        msg: "Medicamento criado com sucesso",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      emit(PillCreatedSuccessfuly());
      emit(PillsState(_pills));
    }
  }

  _onGetPillsByDay(
      PillsEventGetPillsByDay event, Emitter<PillsState> emit) async {
    emit(PillLoading());
    _pills = await pillRepository.getPillsByDay(event.day.yMD);

    if (_pills.isEmpty) {
      emit(PillEmpty());
      return;
    }
    emit(PillsState(_pills));
  }
}
