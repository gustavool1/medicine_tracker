import 'package:flutter/material.dart';

class MedicineEvent {}

class CreatePillSetPillName extends MedicineEvent {
  String name;

  CreatePillSetPillName(this.name);
}

class CreatePillSetStartDate extends MedicineEvent {
  DateTime startDate;

  CreatePillSetStartDate(this.startDate);
}

class CreatePillSetEndDate extends MedicineEvent {
  DateTime endDate;

  CreatePillSetEndDate(this.endDate);
}

class CreatePillSetReminder extends MedicineEvent {
  TimeOfDay time;

  CreatePillSetReminder(this.time);
}

class CreatePillSetFrequency extends MedicineEvent {
  int frequency;

  CreatePillSetFrequency(this.frequency);
}

class CreatePillSetPillAmount extends MedicineEvent {
  int amount;

  CreatePillSetPillAmount(this.amount);
}
