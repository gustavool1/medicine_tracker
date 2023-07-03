import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';
import 'package:medicine_tracker/styles/styles.dart';

import 'widgets/select_dates.dart';

class CreatePillPage extends StatelessWidget {
  const CreatePillPage({super.key});

  Widget get pillNameTextField => TextField(
        decoration: InputDecoration(
          hintText: 'Nome do medicamento',
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
        onChanged: (_) {},
      );

  get frequencyList => ['1h', '2h', '3h', '4h', '5h', '6h', '7h', '8h', '9h'];

  Widget get frequency => Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_today,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicamento'),
      ),
      body: Container(
        color: ColorPackage.defaultPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [pillNameTextField, frequency, SelectDates()],
        ),
      ),
    );
  }
}
