import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterProfilePainter extends CustomPainter {
  final Color color;

  const CharacterProfilePainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4.0);

    path = Path();
    path.moveTo(0, _splitFunction(size, 0));

    // Draw the split line.
    for (double x = 1; x <= size.width; x++) {
      path.lineTo(x, _splitFunction(size, x));
    }

    // Close bottom part of the screen.
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // Draw shadow behind the path.
    canvas.save();
    canvas.translate(0.0, -8.0);
    canvas.drawPath(path, shadowPaint);
    canvas.restore();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

  double _splitFunction(Size size, double x) {
    // Normalizing x to make it exactly one wave.
    final double normalizedX = x / size.width * 2 * pi;
    final double waveHeight = size.height / 8;
    final double y = size.height / 2 + sin(normalizedX) * waveHeight;

    return y;
  }
}
