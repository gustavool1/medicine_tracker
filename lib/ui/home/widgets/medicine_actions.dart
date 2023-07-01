import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';
import 'package:medicine_tracker/ui/ui.dart';

import '../../../models/models.dart';

class MedicineActions extends StatelessWidget {
  final PillModel pill;
  const MedicineActions({required this.pill, super.key});

  AppBar get appBar => AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(pill.name),
            Text(pill.timeToTake),
          ],
        ),
      );

  Widget bottomButtons({required Function(String pillId) onPillTaken}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Button(
              label: 'Confirmar Medicamento ingerido',
              onTap: () => onPillTaken(pill.id),
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
    return BlocBuilder<PillsBloc, PillsState>(builder: (context, state) {
      onPillTaken(String pillId) {
        context.read<PillsBloc>().add(PillsEventTakePill(pillId: pillId));
        Navigator.pop(context);
      }

      return Scaffold(
        appBar: appBar,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Pill(pill: pill, shouldRedirectOnTap: false),
            ),
            const Expanded(child: SizedBox()),
            bottomButtons(onPillTaken: onPillTaken),
          ],
        ),
      );
    });
  }
}
