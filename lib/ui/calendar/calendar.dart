import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

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

  void creatingTableRows(List<TableRow> finalList, List<Widget> list) {
    finalList.add(TableRow(children: list.sublist(0, 7)));
    finalList.add(TableRow(children: list.sublist(7, 14)));
    finalList.add(TableRow(children: list.sublist(14, 21)));
    finalList.add(TableRow(children: list.sublist(21, 28)));
    finalList.add(TableRow(children: list.sublist(28, 35)));

    if (list.length > 35) {
      finalList.add(TableRow(children: list.sublist(35, list.length)));
    }
  }

  List<TableRow> buildDays(DateTime month) {
    final lastDayDateTimeOfTheMonth = (month.month < 12)
        ? DateTime(month.year, month.month + 1, 0)
        : DateTime(month.year + 1, 1, 0);

    final lastDayYear = lastDayDateTimeOfTheMonth.year;
    final lastDayMonth =
        lastDayDateTimeOfTheMonth.month.toString().padLeft(2, "0");
    final firstDay = DateTime.parse("$lastDayYear-$lastDayMonth-01");

    final list = <Widget>[];

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

    fillLastRow(list, lastDayDateTimeOfTheMonth);

    final finalList = <TableRow>[];

    creatingTableRows(finalList, list);

    return finalList;
  }

  Widget _buildVerticalCalendar(int diffInMonths, DateFormat formattedMonth) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, index) {
              final monthNow = DateTime(
                  DateTime.now().year, DateTime.now().month + index, 1);

              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 425),
                child: SlideAnimation(
                  horizontalOffset: 50.0,
                  child: AutoScrollTag(
                    key: ValueKey(monthNow.year + monthNow.month),
                    controller: scrollController,
                    index: monthNow.year + monthNow.month,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Table(
                        children: [
                          ...buildDays(monthNow),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            childCount: diffInMonths,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedMonth = DateFormat.LLLL();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  const Positioned(
                    child: Center(
                      child: Header(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: AnimationLimiter(
                      child: _buildVerticalCalendar(1, formattedMonth),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
