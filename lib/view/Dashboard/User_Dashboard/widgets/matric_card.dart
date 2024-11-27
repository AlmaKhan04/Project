import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  MetricCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
      height: MediaQuery.of(context).size.width * 0.9, // Keep the height equal to width to make it square
      decoration: BoxDecoration(
        color: color, // Background color
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            value,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
