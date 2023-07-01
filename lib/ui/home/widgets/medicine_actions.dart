import 'package:flutter/material.dart';
import 'package:medicine_tracker/ui/ui.dart';

import '../../../models/models.dart';

class MedicineActions extends StatelessWidget {
  final Pill pill;
  const MedicineActions({required this.pill, super.key});

  Widget get bottomButtons => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Button(
              label: 'Confirmar Medicamento ingerido',
              onTap: () {},
              icon: const Icon(Icons.check),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Button(
                      label: 'Pular',
                      onTap: () {},
                      backgroundColor: ButtonColors.danger,
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Button(
                      label: 'Adiar',
                      onTap: () {},
                      backgroundColor: ButtonColors.alert,
                      icon: const Icon(Icons.add_alert),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(pill.name),
            Text(pill.timeToTake),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Medicine(pill: pill, shouldRedirectOnTap: false),
          ),
          const Expanded(child: SizedBox()),
          bottomButtons,
        ],
      ),
    );
  }
}
