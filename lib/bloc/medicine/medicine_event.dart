import 'package:flutter/material.dart';

class MedicineEvent {}

class MedicineSetPillName extends MedicineEvent {
  String name;

  MedicineSetPillName(this.name);
}

class MedicineSetStartDate extends MedicineEvent {
  DateTime startDate;

  MedicineSetStartDate(this.startDate);
}

class MedicineSetEndDate extends MedicineEvent {
  DateTime endDate;

  MedicineSetEndDate(this.endDate);
}

class MedicineSetReminder extends MedicineEvent {
  TimeOfDay time;
  int index;

  MedicineSetReminder(this.time, this.index);
}

class MedicineSetFrequency extends MedicineEvent {
  int frequency;

  MedicineSetFrequency(this.frequency);
}

class MedicineSetPillAmount extends MedicineEvent {
  int amount;

  MedicineSetPillAmount(this.amount);
}
