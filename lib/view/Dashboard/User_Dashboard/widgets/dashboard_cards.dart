import 'package:ems/view/Dashboard/User_Dashboard/widgets/matric_card.dart';
import 'package:flutter/material.dart';

class DashboardMetricsUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Adjust padding as needed
      child: GridView.count(
        crossAxisCount: 2, // Number of cards per row
        crossAxisSpacing: 16.0, // Horizontal spacing between cards
        mainAxisSpacing: 16.0, // Vertical spacing between cards
        childAspectRatio: 1.5, // Aspect ratio for card size
        shrinkWrap: true, // Makes the grid take up only as much space as needed
        children: [
          MetricCard(
            title: 'Past Successful Events',
            value: '120', // Example value
            color: Colors.blueAccent,
          ),
          MetricCard(
            title: 'Total Events',
            value: '150', // Example value
            color: const Color.fromARGB(255, 127, 171, 150),
          ),
        ],
      ),
    );
  }
}
