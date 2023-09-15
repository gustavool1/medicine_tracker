import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String get dMY => DateFormat('dd/MM/yyyy').format(toLocal());
  String get toHoursMinutes => DateFormat('HH:mm').format(toLocal());
  String get yMD => DateFormat('yyyy-MM-dd').format(toLocal());
  String get dM => DateFormat('dd/MM').format(toLocal());
}

extension TimerFormatter on TimeOfDay {
  String get toHoursMinutes => '$hour:${minute == 0 ? '00' : minute}';
}

extension StringExtension on String {
  String get capitalize =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}
