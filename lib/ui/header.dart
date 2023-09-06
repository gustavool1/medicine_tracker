import 'package:flutter/material.dart';
import 'package:medicine_tracker/styles/styles.dart';

class Header extends StatelessWidget {
  final String title;
  final String message;

  const Header({
    required this.title,
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextFonts.head1
                .copyWith(color: const Color.fromRGBO(36, 124, 255, 1)),
          ),
          Text(
            message,
            style: TextFonts.body1.copyWith(color: ColorPackage.homeWelcome),
          )
        ],
      ),
    );
  }
}
