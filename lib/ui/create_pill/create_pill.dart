import 'package:flutter/material.dart';
import 'package:medicine_tracker/styles/styles.dart';

class CreatePillPage extends StatefulWidget {
  const CreatePillPage({super.key});

  @override
  State<CreatePillPage> createState() => _CreatePillPageState();
}

class _CreatePillPageState extends State<CreatePillPage> {
  String selectedFrequency = '1h';

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
            Spacer(),
            DropdownButton<String>(
              items: frequencyList
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() {
                selectedFrequency = value ?? '';
              }),
              value: selectedFrequency,
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
          children: [pillNameTextField, frequency],
        ),
      ),
    );
  }
}
