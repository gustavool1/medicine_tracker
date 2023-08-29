import 'package:flutter/material.dart';
import 'package:medicine_tracker/styles/styles.dart';

import 'widgets/widgets.dart';

class CreatePillPage extends StatefulWidget {
  const CreatePillPage({super.key});

  @override
  State<CreatePillPage> createState() => _CreatePillPageState();
}

class _CreatePillPageState extends State<CreatePillPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
              SelectDates(),
              Reminder(),
              const Expanded(child: SizedBox()),
              SubmitButton(formKey: formKey)
            ],
          ),
        ),
      ),
    );
  }
}
