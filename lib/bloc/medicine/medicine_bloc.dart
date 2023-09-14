import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';
import 'package:medicine_tracker/repositories/repositories.dart';

import '../../models/medicine.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  static Medicine medicine = Medicine();
  static List<Medicine> medicines = [];

  final MedicineRepository medicineRepository;
  final AuthBloc authBloc;

  MedicineBloc({
    required this.authBloc,
    required this.medicineRepository,
  }) : super(MedicineState(medicine)) {
    on<MedicineSetPillName>(_onMedicineSetPillName);
    on<MedicineSetPillAmount>(_onSetAmount);
    on<MedicineSetStartDate>(_onSetStartDate);
    on<MedicineSetEndDate>(_onSetEndDate);
    on<MedicineSetReminder>(_onSetReminder);
    on<MedicineGetMedicines>(_onGetMedicines);
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
    await Future.delayed(const Duration(seconds: 1));
    medicines = await medicineRepository.getUserMedicines(authBloc.token);

    emit(MedicineGottenSuccessfully(medicine, medicines));
  }
}
