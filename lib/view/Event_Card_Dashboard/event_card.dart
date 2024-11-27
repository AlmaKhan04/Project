import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String location;
  final String description;

  EventCard({
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 5),
                Text(date),
                SizedBox(width: 20),
                Icon(Icons.access_time),
                SizedBox(width: 5),
                Text(time),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 5),
                Text(location),
              ],
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
