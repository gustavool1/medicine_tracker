import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class MedicineImage extends StatelessWidget {
  final String name;

  const MedicineImage({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPackage.blue,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.pill, height: 90),
              Text(
                name,
                style: TextFonts.head1.copyWith(
                  color: ColorPackage.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
