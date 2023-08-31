import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';
import 'package:medicine_tracker/pages/create_medicine/widgets/widgets.dart';

class MultipleReminders extends StatelessWidget {
  const MultipleReminders({super.key});

  List<Widget> reminders(int remindersQuantity) {
    final List<Widget> remindersList = [];

    for (var i = 0; i < remindersQuantity; i++) {
      remindersList.add(Reminder(index: i, showOrderInHint: true));
    }
    return remindersList;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineBloc, MedicineState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Definir lembretes para as pilulas:'),
            ...reminders(state.medicine.pillsAmount ?? 2),
          ],
        );
      },
    );
  }
}
