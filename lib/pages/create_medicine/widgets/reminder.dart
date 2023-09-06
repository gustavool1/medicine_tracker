import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';
import 'package:medicine_tracker/helpers/validators/required.validator.dart';

import '../../../styles/styles.dart';

class Reminder extends StatefulWidget {
  final int index;
  final bool showOrderInHint;

  const Reminder({
    super.key,
    required this.index,
    this.showOrderInHint = false,
  });

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  final TextEditingController _timerTextEditingController =
      TextEditingController();

  void setTimer(BuildContext context, TimeOfDay time, int index) {
    context.read<MedicineBloc>().add(MedicineSetReminder(time, index));
    _timerTextEditingController.text = time.format(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MedicineBloc>(
      create: (context) => context.read<MedicineBloc>(),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          children: [
            const Icon(
              Icons.access_alarm,
              color: ColorPackage.blue,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                widget.showOrderInHint
                    ? 'Lembrete ${widget.index}ª'
                    : 'Lembrete',
                style: TextFonts.body1.copyWith(
                  color: ColorPackage.darkBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              child: TextFormField(
                controller: _timerTextEditingController,
                validator: DefaultRequiredValidator(),
                decoration: InputDecoration(
                  hintText: '6:30 AM',
                  contentPadding: const EdgeInsets.only(bottom: 5),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorPackage.lightGray),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorPackage.lightGray),
                  ),
                  hintStyle: TextFonts.body1.copyWith(
                    color: ColorPackage.lightGray,
                  ),
                ),
                readOnly: true,
                onTap: () async {
                  await showTimePicker(
                          context: context, initialTime: TimeOfDay.now())
                      .then((value) => setTimer(
                          context, value ?? TimeOfDay.now(), widget.index));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
