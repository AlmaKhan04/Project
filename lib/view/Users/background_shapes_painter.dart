import 'package:flutter/material.dart';

class BackgroundShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color.fromARGB(255, 35, 94, 153).withOpacity(0.15) // Purple color for the outline
      ..style = PaintingStyle.stroke // Outline only
      ..strokeWidth = 3.0; // Adjust stroke width as needed

    // Draw circles
    canvas.drawCircle(
      Offset(size.width * 0.22, size.height * 0.31),
      100.0,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.82, size.height * 0.55),
      150.0,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.8),
      120.0,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 1.05),
      120.0,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
