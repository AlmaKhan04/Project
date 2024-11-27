import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  DashboardCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: color,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45, // Adjusting width for mobile
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(color: Colors.white, fontSize: 14)), // Adjusted font size
            SizedBox(height: 8),
            Text(value, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)), // Adjusted font size
          ],
        ),
      ),
    );
  }
}
