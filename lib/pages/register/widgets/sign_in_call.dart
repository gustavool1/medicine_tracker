import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medicine_tracker/pages/sign_in/sign_in.dart';
import 'package:medicine_tracker/styles/styles.dart';

class SignInCall extends StatelessWidget {
  const SignInCall({super.key});

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
            const TextSpan(text: 'Já possui uma conta?'),
            TextSpan(
              text: ' Entrar',
              style: TextFonts.body1.copyWith(
                color: ColorPackage.blue,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignInPage(),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
