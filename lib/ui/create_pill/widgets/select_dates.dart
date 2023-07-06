import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/helpers/extensions.dart';

import '../../../bloc/bloc.dart';
import '../../../styles/styles.dart';

class SelectDates extends StatelessWidget {
  SelectDates({super.key});
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
              child: TextField(
                  controller: _textEditingControllerStartDate,
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
                      onSelectStartDate(context, value);
                      _textEditingControllerStartDate.text =
                          startSelectedDate.dMY;
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
              child: TextField(
                  controller: _textEditingControllerEndDate,
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
                    ).then((value) {
                      if (value == null) return;
                      onSelectEndDate(context, value);
                      _textEditingControllerEndDate.text = endSelectedDate.dMY;
                    });
                  }),
            ),
          ],
        ),
      );

  void selectStartDay(BuildContext context, DateTime date) {
    context.read<CreatePillBloc>().add(
          CreatePillSetStartDate(date),
        );
  }

  void selectEndDay(BuildContext context, DateTime date) {
    context.read<CreatePillBloc>().add(
          CreatePillSetEndDate(date),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreatePillBloc>(
      create: (context) => context.read<CreatePillBloc>(),
      child: Column(
        children: [
          selectStartDate(
              context: context,
              onSelectStartDate: selectStartDay,
              startSelectedDate: context
                      .watch<CreatePillBloc>()
                      .state
                      .createPill
                      .startTakingPill ??
                  DateTime.now()),
          selectEndDate(
            context: context,
            onSelectEndDate: selectEndDay,
            endSelectedDate: context
                    .watch<CreatePillBloc>()
                    .state
                    .createPill
                    .endTakingPill ??
                DateTime.now().add(const Duration(days: 1)),
          ),
        ],
      ),
    );
  }
}
