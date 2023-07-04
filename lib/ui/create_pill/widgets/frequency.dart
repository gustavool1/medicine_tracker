import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class FrequencyPill extends StatelessWidget {
  const FrequencyPill({super.key});

  get frequencyList => ['1h', '2h', '3h', '4h', '5h', '6h', '7h', '8h', '9h'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          const Icon(
            Icons.calendar_month_sharp,
            color: ColorPackage.blue,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Frequência de uso diário',
              style: TextFonts.body1.copyWith(
                color: ColorPackage.darkBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Spacer(),
          DropdownButton<String>(
            items: frequencyList
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                .toList(),
            onChanged: (value) => {},
            value: '1h',
          )
        ],
      ),
    );
    ;
  }
}
