import 'package:flutter/material.dart';

class EventDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Management Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Profile settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Upcoming Events Section
            _buildSectionTitle('Upcoming Events'),
            _buildEventSummary(),

            // Calendar View Section
            _buildSectionTitle('Calendar'),
            _buildCalendarView(),

            // Analytics Section
            _buildSectionTitle('Analytics'),
            _buildAnalytics(),

            // Notifications Section
            _buildSectionTitle('Notifications'),
            _buildNotifications(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add Event functionality
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildEventSummary() {
    // Placeholder for event summary widgets
    return Container(
      height: 200,
      color: Colors.grey[200],
      child: Center(child: Text('Event Summary')),
    );
  }

  Widget _buildCalendarView() {
    // Placeholder for calendar view widget
    return Container(
      height: 300,
      color: Colors.grey[200],
      child: Center(child: Text('Calendar View')),
    );
  }

  Widget _buildAnalytics() {
    // Placeholder for analytics widgets
    return Container(
      height: 200,
      color: Colors.grey[200],
      child: Center(child: Text('Analytics')),
    );
  }

  Widget _buildNotifications() {
    // Placeholder for notifications widgets
    return Container(
      height: 200,
      color: Colors.grey[200],
      child: Center(child: Text('Notifications')),
    );
  }
}
