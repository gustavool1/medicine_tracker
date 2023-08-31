import 'package:flutter/material.dart';

class CreatePillEvent {}

class CreatePillSetPillName extends CreatePillEvent {
  String name;

  CreatePillSetPillName(this.name);
}

class CreatePillSetStartDate extends CreatePillEvent {
  DateTime startDate;

  CreatePillSetStartDate(this.startDate);
}

class CreatePillSetEndDate extends CreatePillEvent {
  DateTime endDate;

  CreatePillSetEndDate(this.endDate);
}

class CreatePillSetReminder extends CreatePillEvent {
  TimeOfDay time;

  CreatePillSetReminder(this.time);
}

class CreatePillSetFrequency extends CreatePillEvent {
  int frequency;

  CreatePillSetFrequency(this.frequency);
}

class CreatePillSetPillAmount extends CreatePillEvent {
  int amount;

  CreatePillSetPillAmount(this.amount);
}
