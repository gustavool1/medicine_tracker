import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medicine_tracker/bloc/bloc.dart';
import 'package:medicine_tracker/helpers/auth.helper.dart';
import 'package:medicine_tracker/repositories/repositories.dart';

import '../../models/medicine.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  static Medicine medicine = Medicine();
  static List<Medicine> medicines = [];
  final _authHelper = AuthHelper();

  final MedicineRepository medicineRepository;

  MedicineBloc({
    required this.medicineRepository,
  }) : super(MedicineState(medicine)) {
    on<MedicineSetPillName>(_onMedicineSetPillName);
    on<MedicineSetPillAmount>(_onSetAmount);
    on<MedicineSetStartDate>(_onSetStartDate);
    on<MedicineSetEndDate>(_onSetEndDate);
    on<MedicineSetReminder>(_onSetReminder);
    on<MedicineGetMedicines>(_onGetMedicines);

    on<MedicineDelete>(_onMedicineDelete);
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

  void _onGetMedicines(
      MedicineGetMedicines event, Emitter<MedicineState> emit) async {
    medicines = await medicineRepository
        .getUserMedicines(await _authHelper.getUserToken());
    if (medicines.isEmpty) {
      emit(MedicineEmpty());
      return;
    }
    emit(MedicineGottenSuccessfully(medicine, medicines));
  }

  void _onMedicineDelete(
      MedicineDelete event, Emitter<MedicineState> emit) async {
    await medicineRepository.deleteMedicine(
        event.id, await _authHelper.getUserToken());

    medicines.removeWhere((medicine) => medicine.id == event.id);

    Fluttertoast.showToast(
      msg: "Medicamento deletado",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
    emit(MedicineDeletedSuccessfully(medicine, medicines));
  }
}
