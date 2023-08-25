import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:medicine_tracker/styles/styles.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../bloc/bloc.dart';
import 'widgets/widgets.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  AutoScrollController get scrollController => AutoScrollController();

  void fillLastRow(List<Widget> list, DateTime lastDayOfTheMonth) {
    list.addAll(
      List.generate(6 - (lastDayOfTheMonth.weekday % 7), (index) => index + 1)
          .map((e) {
        return const SizedBox.shrink();
      }),
    );
  }

  void creatingTableRows(
      List<TableRow> finalList, List<Widget> list, bool isOpen) {
    if (!isOpen) {
      finalList.add(TableRow(children: list.sublist(0, 7)));
      return;
    }

    finalList.add(TableRow(children: list.sublist(0, 7)));
    finalList.add(TableRow(children: list.sublist(7, 14)));
    finalList.add(TableRow(children: list.sublist(14, 21)));
    finalList.add(TableRow(children: list.sublist(21, 28)));
    finalList.add(TableRow(children: list.sublist(28, 35)));

    if (list.length > 35) {
      finalList.add(TableRow(children: list.sublist(35, list.length)));
    }
  }

  List<TableRow> buildDays(DateTime month, bool isOpen) {
    final lastDayDateTimeOfTheMonth = (month.month < 12)
        ? DateTime(month.year, month.month + 1, 0)
        : DateTime(month.year + 1, 1, 0);

    final lastDayYear = lastDayDateTimeOfTheMonth.year;
    final lastDayMonth =
        lastDayDateTimeOfTheMonth.month.toString().padLeft(2, "0");
    final firstDay = DateTime.parse("$lastDayYear-$lastDayMonth-01");

    final list = <Widget>[];
    if (isOpen) {
      list.addAll(
        List.generate(firstDay.weekday % 7, (index) => index + 1)
            .map((e) {
              return const SizedBox.shrink();
            })
            .toList()
            .reversed,
      );

      list.addAll(
        List.generate(lastDayDateTimeOfTheMonth.day, (index) => index).map((e) {
          final dayNow = firstDay.add(Duration(days: e));
          return DayCell(day: dayNow, completedPercentage: 0.5);
        }).toList(),
      );
    } else {
      final today = DateTime.now();
      const fullWeekLength = 7;
      final weekStart = DateTime(today.year, today.month, today.day)
          .subtract(Duration(days: today.weekday));

      list.addAll(
        List.generate(fullWeekLength, (index) => index).map((e) {
          final dayNow = weekStart.add(Duration(days: e));
          return DayCell(day: dayNow, completedPercentage: 0.5);
        }).toList(),
      );
    }

    fillLastRow(list, lastDayDateTimeOfTheMonth);

    final finalList = <TableRow>[];

    creatingTableRows(finalList, list, isOpen);

    return finalList;
  }

  Widget _buildVerticalCalendar(
      int diffInMonths, DateFormat formattedMonth, bool isOpen) {
    final monthNow = DateTime(DateTime.now().year, DateTime.now().month + 0, 1);

    return SizedBox(
      height: 370,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Table(
          children: [
            ...buildDays(monthNow, isOpen),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(builder: (context, state) {
      final formattedMonth = DateFormat.LLLL();

      void changeOpen() {
        context.read<CalendarBloc>().add(CalendarEventChangeOpen());

        if (state.calendar.isOpen) {
          context
              .read<CalendarBloc>()
              .add(CalendarEventOnSelectedDay(DateTime.now()));
        }
      }

      return Container(
        decoration: const BoxDecoration(
          color: ColorPackage.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
        child: SizedBox(
          height: state.calendar.isOpen ? 370 : 130,
          child: Stack(
            children: [
              const Center(
                child: Header(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: _buildVerticalCalendar(
                  1,
                  formattedMonth,
                  state.calendar.isOpen,
                ),
              ),
              if (!state.calendar.isOpen)
                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: changeOpen,
                    child: const Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 40,
                      color: ColorPackage.darkGray,
                    ),
                  ),
                ),
              if (state.calendar.isOpen)
                Positioned(
                  top: 340,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: changeOpen,
                    child: const Icon(
                      Icons.arrow_drop_up_rounded,
                      color: ColorPackage.darkGray,
                      size: 40,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
