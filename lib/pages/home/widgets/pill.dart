import 'package:flutter/material.dart';
import 'package:medicine_tracker/styles/styles.dart';

import '../../../models/models.dart';
import '../widgets.dart';

class Pill extends StatelessWidget {
  final bool shouldRedirectOnTap;
  final PillModel pill;

  const Pill({
    required this.pill,
    this.shouldRedirectOnTap = true,
    super.key,
  });

  Widget get leftBorder => Container(
        width: 7,
        decoration: const BoxDecoration(
            color: ColorPackage.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            )),
      );

  Widget get iconAndTime => Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pill.timeToTake,
              style: TextFonts.body1.copyWith(color: ColorPackage.darkGray),
            ),
            const SizedBox(height: 8),
            Image.asset(
              Assets.pill,
              width: 30,
              height: 30,
            ),
          ],
        ),
      );

  Widget get typeAndQuantity => Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pill.name,
              style: TextFonts.head2.copyWith(color: ColorPackage.blue),
            ),
            const SizedBox(height: 8),
            Text(
              pill.amountLabel,
              style: TextFonts.body1.copyWith(color: ColorPackage.lightGray),
            )
          ],
        ),
      );

  void onTap(BuildContext context) => shouldRedirectOnTap
      ? Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MedicineActions(pill: pill),
          ),
        )
      : () {};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Container(
          height: 105,
          decoration: BoxDecoration(
            color: ColorPackage.white,
            border: Border.all(
                color: ColorPackage.blue, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              leftBorder,
              iconAndTime,
              typeAndQuantity,
              const Spacer(),
              if (pill.isTaken)
                const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.check_circle,
                    color: ColorPackage.blue,
                    size: 40,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
