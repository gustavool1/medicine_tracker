import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';
import 'package:medicine_tracker/styles/styles.dart';

import 'widgets.dart';

class DayCell extends StatelessWidget {
  final DateTime day;
  final double completedPercentage;

  const DayCell(
      {required this.day, required this.completedPercentage, super.key});

  bool isThisDayCellSelected(DateTime selectedDate) {
    if (selectedDate.day == day.day &&
        selectedDate.month == day.month &&
        selectedDate.year == day.year) return true;

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Stack(
          children: [
            CustomPaint(
              painter: BorderPainter(completedPercentage: completedPercentage),
              child: Container(
                width: 50,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isThisDayCellSelected(state.calendar.selectedDate)
                      ? ColorPackage.blue
                      : ColorPackage.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.padded,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: () => context
                      .read<CalendarBloc>()
                      .add(CalendarEventOnSelectedDay(day)),
                  child: Text(
                    "${day.day}",
                    style: TextFonts.body1.copyWith(
                      color: completedPercentage == 1
                          ? ColorPackage.white
                          : ColorPackage.lightGray,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
