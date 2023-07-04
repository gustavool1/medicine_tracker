import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String get dMY => DateFormat('dd/MM/yyyy').format(toLocal());
}
