import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medicine_tracker/pages/register/register_page.dart';
import 'package:medicine_tracker/styles/styles.dart';

class RegisterCall extends StatelessWidget {
  const RegisterCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: RichText(
        text: TextSpan(
          style: TextFonts.body1.copyWith(
            color: ColorPackage.homeWelcome,
          ),
          children: [
            const TextSpan(text: 'Não tem uma conta ainda?'),
            TextSpan(
              text: ' Cadastre-se',
              style: TextFonts.body1.copyWith(
                color: ColorPackage.blue,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RegisterPage(),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
