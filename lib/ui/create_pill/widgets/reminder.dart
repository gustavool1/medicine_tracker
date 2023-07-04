import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class Reminder extends StatelessWidget {
  Reminder({super.key});

  final TextEditingController _timerTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          const Icon(
            Icons.access_alarm,
            color: ColorPackage.blue,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Lembrete',
              style: TextFonts.body1.copyWith(
                color: ColorPackage.darkBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            child: TextField(
              controller: _timerTextEditingController,
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
              onTap: () async {
                await showTimePicker(
                        context: context, initialTime: TimeOfDay.now())
                    .then((value) => print('AAAA : $value'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
