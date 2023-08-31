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
    return BlocBuilder<MedicineBloc, CreatePillState>(
        builder: (context, state) {
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
                const FrequencyPill(),
                const PillsAmount(),
                // if (state..pillsAmount != 1)
                //   const MultipleReminders(),
                SelectDates(),
                // if (state.createPill.pillsAmount == 1) Reminder(),
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
