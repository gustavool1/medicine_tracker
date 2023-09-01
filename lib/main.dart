import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:medicine_tracker/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Alarm.init(showDebugLogs: true);

  runApp(const App());
}
