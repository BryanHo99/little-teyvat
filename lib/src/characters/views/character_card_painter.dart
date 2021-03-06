import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:little_teyvat/themes/themes.dart';

class CharacterCardPainter extends CustomPainter {
  final Color color;

  const CharacterCardPainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    path.lineTo(0.0, size.height - 60);
    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2.25, size.height - 45.0);
    path.quadraticBezierTo(size.width - (size.width / 3.25), size.height - 100, size.width, size.height - 50.0);
    path.lineTo(size.width, size.height - 40.0);
    path.lineTo(size.width, 0.0);
    path.close();

    canvas.drawShadow(path, kcBlack, 5.0, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
