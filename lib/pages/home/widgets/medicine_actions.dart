import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';
import 'package:medicine_tracker/repositories/pill.repository.dart';
import 'package:medicine_tracker/ui/ui.dart';

import '../../../models/models.dart';

class MedicineActions extends StatefulWidget {
  final PillModel? pill;
  final int? alarmPillId;

  const MedicineActions({this.pill, this.alarmPillId, super.key});

  @override
  State<MedicineActions> createState() => _MedicineActionsState();
}

class _MedicineActionsState extends State<MedicineActions> {
  bool isLoading = true;

  PillModel correctPill = PillModel(
    id: 0,
    medicineId: '',
    timeToTake: '',
    takePillDay: DateTime.now(),
    name: '',
    amount: 0,
  );

  @override
  void initState() {
    super.initState();
    final PillRepository pillRepository = PillRepository();

    setState(() {
      if (widget.alarmPillId != null) {
        pillRepository.getPillById(widget.alarmPillId!).then((pill) {
          correctPill = pill;
          isLoading = false;
          setState(() {});
        });
        return;
      }
      isLoading = false;
      correctPill = widget.pill!;
    });
  }

  AppBar get appBar => AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(correctPill.name),
            Text(correctPill.timeToTake),
          ],
        ),
      );

  Widget bottomButtons({required Function(int pillId) onPillTaken}) =>
      BlocListener(
        bloc: context.read<PillsBloc>(),
        listener: (context, state) {
          if (state is PillSetReminderSuccessfuly) Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Button(
                label: 'Confirmar Medicamento ingerido',
                onTap: () => onPillTaken(correctPill.id),
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
                        onTap: () {
                          Alarm.stop(correctPill.id);
                          Navigator.pop(context);
                        },
                        backgroundColor: ButtonColors.danger,
                        icon: const Icon(Icons.close),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Button(
                        label: 'Adiar',
                        onTap: () async {
                          final timeOfDay = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());

                          if (timeOfDay != null) {
                            onChangeReminder(
                              correctPill.id,
                              timeOfDay,
                            );
                          }
                        },
                        backgroundColor: ButtonColors.alert,
                        icon: const Icon(Icons.add_alert),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );

  onPillTaken(int pillId) {
    context.read<PillsBloc>().add(PillsEventTakePill(pillId: pillId));
    Alarm.stop(pillId);
    Navigator.pop(context);
  }

  onChangeReminder(int pillId, TimeOfDay timeOfDay) {
    context
        .read<PillsBloc>()
        .add(PillEventChangeReminder(pillId: pillId, timeOfDay: timeOfDay));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Pill(pill: correctPill, shouldRedirectOnTap: false),
          ),
          const Expanded(child: SizedBox()),
          bottomButtons(onPillTaken: onPillTaken),
        ],
      ),
    );
  }
}
