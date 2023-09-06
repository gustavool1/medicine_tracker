import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class FormFields extends StatelessWidget {
  final TextEditingController textFieldEmailController;
  final TextEditingController textFieldPasswordController;
  final List<Widget> additionalFields;

  const FormFields({
    required this.textFieldEmailController,
    required this.textFieldPasswordController,
    this.additionalFields = const [],
    super.key,
  });

  Widget get separator => const SizedBox(
        height: 30,
      );

  List<Widget> insertingAdditionalFields() {
    final List<Widget> widgets = [];
    for (var i = 0; i < additionalFields.length; i++) {
      widgets.add(additionalFields[i]);
      widgets.add(separator);
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmailTextField(controller: textFieldEmailController),
        separator,
        PasswordTextField(controller: textFieldPasswordController),
        separator,
        ...insertingAdditionalFields(),
      ],
    );
  }
}
