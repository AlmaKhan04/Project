import 'package:flutter/material.dart';

class BackgroundShapesPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color.fromARGB(255, 35, 94, 153).withOpacity(0.15) // Purple color for the outline
      ..style = PaintingStyle.stroke // Outline only
      ..strokeWidth = 3.0; // Adjust stroke width as needed

    // Draw circles
    canvas.drawCircle(
      Offset(size.width * 0.001, size.height * 0.25),
      120.0,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.75, size.height * 0.5),
      110.0,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.78),
      120.0,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 1.05),
      120.0,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
