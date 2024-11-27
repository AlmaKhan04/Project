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
      Offset(size.width * 0.001, size.height * 0.01),
      80.0,
      paint,
    );
    
    canvas.drawCircle(
      Offset(size.width * 0.95, size.height * 0.3),
      130.0,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.52),
      100.0,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.78, size.height * 0.8),
      110.0,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 1.08),
      120.0,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}