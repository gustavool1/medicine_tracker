import 'package:flutter/material.dart';

import '../../button.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Button(
        label: 'Criar Medicamento',
        onTap: () {},
      ),
    );
  }
}
