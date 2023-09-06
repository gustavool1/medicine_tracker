import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/medicine.dart';
import 'medicine.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  static Medicine medicine = Medicine();
  MedicineBloc() : super(MedicineState(medicine)) {
    on<MedicineSetPillName>(_onMedicineSetPillName);
    on<MedicineSetPillAmount>(_onSetAmount);
    on<MedicineSetStartDate>(_onSetStartDate);
    on<MedicineSetEndDate>(_onSetEndDate);
    on<MedicineSetReminder>(_onSetReminder);
  }

  _onMedicineSetPillName(
      MedicineSetPillName event, Emitter<MedicineState> emit) {
    medicine.name = event.name;
    emit(MedicineState(medicine));
  }

  void _onSetAmount(MedicineSetPillAmount event, Emitter<MedicineState> emit) {
    medicine.pillsAmount = event.amount;
    emit(MedicineState(medicine));
  }

  void _onSetStartDate(
      MedicineSetStartDate event, Emitter<MedicineState> emit) {
    medicine.startTakingPill = event.startDate;
    emit(MedicineState(medicine));
  }

  void _onSetEndDate(MedicineSetEndDate event, Emitter<MedicineState> emit) {
    medicine.endTakingPill = event.endDate;
    emit(MedicineState(medicine));
  }

  void _onSetReminder(MedicineSetReminder event, Emitter<MedicineState> emit) {
    medicine.reminders ??= [];
    if (medicine.reminders?.length != medicine.pillsAmount) {
      for (var i = 0; i < (medicine.pillsAmount ?? 1); i++) {
        if (i == 0) medicine.reminders = [];
        medicine.reminders?.add(null);
      }
    }

    medicine.reminders?[event.index] = event.time;
    emit(MedicineState(medicine));
  }
}
