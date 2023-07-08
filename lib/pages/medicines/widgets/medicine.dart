import 'package:flutter/material.dart';
import 'package:medicine_tracker/pages/pill/pill.dart';
import 'package:medicine_tracker/styles/styles.dart';

class Medicine extends StatelessWidget {
  const Medicine({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const MedicationPage())),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorPackage.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              height: 80,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, left: 45.0),
                    child: Column(children: [
                      Text(
                        'Vitamina C',
                        style: TextFonts.head2.copyWith(
                            color: ColorPackage.darkBlue,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Ibalgin 400',
                        style: TextFonts.body1
                            .copyWith(color: ColorPackage.lightGray),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 5, left: 10, child: Image.asset(Assets.pill, height: 70))
        ],
      ),
    );
  }
}
