import 'package:flutter/material.dart';
import 'package:medicine_tracker/styles/styles.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  Widget weekDay(String day) => TableCell(
        child: Text(
          day,
          textAlign: TextAlign.center,
          style: TextFonts.body1.copyWith(
              fontWeight: FontWeight.bold, color: ColorPackage.darkBlue),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Table(
            children: [
              TableRow(
                children: [
                  weekDay('Dom'),
                  weekDay('Seg'),
                  weekDay('Ter'),
                  weekDay('Qua'),
                  weekDay('Qui'),
                  weekDay('Sex'),
                  weekDay('Sab'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
