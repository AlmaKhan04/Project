import 'package:ems/view/Dashboard/Organization_Dashboard/models/dashboard_card.dart';
import 'package:flutter/material.dart';

class DashboardMetrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DashboardCard(
                  title: 'Total Event Managed',
                  value: '120',
                  color: Color.fromARGB(255, 75, 97, 136),
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: DashboardCard(
                  title: 'Successful Events',
                  value: '110',
                  color: Color.fromARGB(255, 143, 189, 168),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          // Second row of cards
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DashboardCard(
                  title: 'Active Users',
                  value: '75',
                  color: Color.fromARGB(255, 204, 160, 204),
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: DashboardCard(
                  title: 'Vendors Connected',
                  value: '30',
                  color: Color.fromARGB(255, 192, 147, 121),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  MetricCard({required this.title, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
    );
  }
}
