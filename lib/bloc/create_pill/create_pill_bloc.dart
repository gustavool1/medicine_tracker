import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/models/models.dart';

import 'create_pill.dart';

class CreatePillBloc extends Bloc<CreatePillEvent, CreatePillState> {
  static CreatePill createPill = CreatePill();
  CreatePillBloc() : super(CreatePillState(createPill)) {
    on<CreatePillSetPillName>(_onCreatePillSetName);
    on<CreatePillSetStartDate>(_onCreatePillSetStartDate);
    on<CreatePillSetEndDate>(_onCreatePillSetEndDate);
    on<CreatePillSetReminder>(_onSetTimeReminder);
    on<CreatePillSetFrequency>(_onSetFrequency);
  }

  void _onCreatePillSetName(
      CreatePillSetPillName event, Emitter<CreatePillState> emit) {
    createPill.name = event.name;
    emit(CreatePillState(createPill));
  }

  void _onCreatePillSetStartDate(
      CreatePillSetStartDate event, Emitter<CreatePillState> emit) {
    createPill.startTakingPill = event.startDate;
    emit(CreatePillState(createPill));
  }

  void _onCreatePillSetEndDate(
      CreatePillSetEndDate event, Emitter<CreatePillState> emit) {
    createPill.endTakingPill = event.endDate;
    emit(CreatePillState(createPill));
  }

  void _onSetTimeReminder(
      CreatePillSetReminder event, Emitter<CreatePillState> emit) {
    createPill.reminderEveryDay = event.time;
    emit(CreatePillState(createPill));
  }

  void _onSetFrequency(
      CreatePillSetFrequency event, Emitter<CreatePillState> emit) {
    createPill.frequencyInHours = event.frequency;
    emit(CreatePillState(createPill));
  }
}
