import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/helpers/extensions.dart';
import 'package:medicine_tracker/helpers/validators/required.validator.dart';

import '../../../bloc/bloc.dart';
import '../../../styles/styles.dart';

class SelectDates extends StatefulWidget {
  const SelectDates({super.key});

  @override
  State<SelectDates> createState() => _SelectDatesState();
}

class _SelectDatesState extends State<SelectDates> {
  final TextEditingController _textEditingControllerStartDate =
      TextEditingController();

  final TextEditingController _textEditingControllerEndDate =
      TextEditingController();

  Widget selectStartDate(
          {required BuildContext context,
          required Function(BuildContext, DateTime) onSelectStartDate,
          required DateTime startSelectedDate}) =>
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Icon(
                Icons.calendar_today,
                color: ColorPackage.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Text(
                'Começar em: ',
                style: TextFonts.body1.copyWith(
                  color: ColorPackage.darkBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              child: TextFormField(
                  controller: _textEditingControllerStartDate,
                  validator: DefaultRequiredValidator(),
                  decoration: InputDecoration(
                    hintText: '30/08/2023',
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
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => DatePickerDialog(
                        initialDate: startSelectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          const Duration(days: 365),
                        ),
                      ),
                    ).then((value) {
                      if (value == null) return;
                      final selectedDate = DateTime.parse(value.toString());

                      onSelectStartDate(context, value);
                      _textEditingControllerStartDate.text = selectedDate.dMY;
                    });
                  }),
            ),
          ],
        ),
      );

  Widget selectEndDate(
          {required BuildContext context,
          required Function(BuildContext, DateTime) onSelectEndDate,
          required DateTime endSelectedDate}) =>
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Icon(
                Icons.calendar_month_sharp,
                color: ColorPackage.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Text(
                'Terminar em: ',
                style: TextFonts.body1.copyWith(
                  color: ColorPackage.darkBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              child: TextFormField(
                  controller: _textEditingControllerEndDate,
                  validator: DefaultRequiredValidator(),
                  decoration: InputDecoration(
                    hintText: '07/09/2023',
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
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => DatePickerDialog(
                        initialDate: endSelectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          const Duration(days: 365),
                        ),
                      ),
                      // 19 a0 21
                    ).then((value) {
                      if (value == null) return;
                      final selectedDate = DateTime.parse(value.toString());

                      onSelectEndDate(context, value);
                      _textEditingControllerEndDate.text = selectedDate.dMY;
                    });
                  }),
            ),
          ],
        ),
      );

  void selectStartDay(BuildContext context, DateTime date) {
    context.read<MedicineBloc>().add(
          MedicineSetStartDate(date),
        );
  }

  void selectEndDay(BuildContext context, DateTime date) {
    context.read<MedicineBloc>().add(
          MedicineSetEndDate(date),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MedicineBloc>(
      create: (context) => context.read<MedicineBloc>(),
      child: Column(
        children: [
          selectStartDate(
              context: context,
              onSelectStartDate: selectStartDay,
              startSelectedDate: context
                      .watch<MedicineBloc>()
                      .state
                      .medicine
                      .startTakingPill ??
                  DateTime.now()),
          selectEndDate(
            context: context,
            onSelectEndDate: selectEndDay,
            endSelectedDate:
                context.watch<MedicineBloc>().state.medicine.endTakingPill ??
                    DateTime.now().add(const Duration(days: 1)),
          ),
        ],
      ),
    );
  }
}
