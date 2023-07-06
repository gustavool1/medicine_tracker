import 'package:flutter/material.dart';
import 'package:medicine_tracker/styles/styles.dart';

import 'widgets/widgets.dart';

class CreatePillPage extends StatelessWidget {
  const CreatePillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicamento'),
      ),
      body: Container(
        color: ColorPackage.defaultPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RegisterPillName(),
            const FrequencyPill(),
            const PillsAmount(),
            SelectDates(),
            Reminder(),
            const Expanded(child: SizedBox()),
            const SubmitButton()
          ],
        ),
      ),
    );
  }
}
