import 'package:flutter/material.dart';

import '../styles/styles.dart';

enum ButtonColors { primary, danger, alert }

class Button extends StatelessWidget {
  final ButtonColors? backgroundColor;
  final String label;
  final Function() onTap;
  final EdgeInsets? padding;
  final Icon? icon;
  final double borderRadius;
  final bool isLoading;
  final Color? loadingColor;

  const Button({
    required this.label,
    required this.onTap,
    this.backgroundColor = ButtonColors.primary,
    this.icon,
    this.padding,
    this.borderRadius = 5,
    this.isLoading = false,
    this.loadingColor,
    super.key,
  });

  get getBackgroundColor {
    switch (backgroundColor) {
      case ButtonColors.primary:
        return ColorPackage.blue;

      case ButtonColors.danger:
        return ColorPackage.red;

      case ButtonColors.alert:
        return ColorPackage.yellow;

      default:
        return ColorPackage.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.6),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: getBackgroundColor,
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onTap,
        child: isLoading
            ? const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: ColorPackage.white,
                    strokeWidth: 3,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[icon!, const SizedBox(width: 10)],
                  Text(
                    label,
                    style: TextFonts.body1.copyWith(color: ColorPackage.white),
                  )
                ],
              ),
      ),
    );
  }
}
