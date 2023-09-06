import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';
import 'package:medicine_tracker/styles/styles.dart';

import 'widgets/widgets.dart';

class CreateMedicinePage extends StatefulWidget {
  const CreateMedicinePage({super.key});

  @override
  State<CreateMedicinePage> createState() => _CreateMedicinePageState();
}

class _CreateMedicinePageState extends State<CreateMedicinePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineBloc, MedicineState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Medicamento'),
        ),
        body: Container(
          color: ColorPackage.defaultPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RegisterPillName(),
                const PillsAmount(),
                if ((state.medicine.pillsAmount ?? 0) > 1)
                  const MultipleReminders(),
                const SelectDates(),
                if ((state.medicine.pillsAmount ?? 1) == 1)
                  const Reminder(index: 0),
                const Expanded(child: SizedBox()),
                SubmitButton(formKey: formKey)
              ],
            ),
          ),
        ),
      );
    });
  }
}
