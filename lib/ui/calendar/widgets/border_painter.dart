import 'package:flutter/material.dart';
import 'package:medicine_tracker/styles/styles.dart';

class BorderPainter extends CustomPainter {
  final double completedPercentage;
  final bool isSelected;

  BorderPainter({
    required this.completedPercentage,
    this.isSelected = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final Path path = Path()
      ..addOval(rect)
      ..close();

    if (isSelected) {
      paint.color = ColorPackage.lightGray;
      canvas.drawPath(path, paint);
    } else if (completedPercentage == 1) {
      paint.color = ColorPackage.blue;
      canvas.drawPath(path, paint);
    } else {
      final double halfWidth = size.width / 2;
      final double halfHeight = size.height / 2;
      final double center = halfWidth > halfHeight ? halfHeight : halfWidth;
      final double stopOffset = center * completedPercentage;

      final Gradient gradient = LinearGradient(
        colors: const [ColorPackage.blue, ColorPackage.red],
        stops: [stopOffset / center, stopOffset / center],
      );

      paint.shader = gradient.createShader(rect);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
