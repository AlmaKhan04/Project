import 'package:flutter/material.dart';

void main() => runApp(EventManagementApp());

class EventManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EventManagementDashboard(),
    );
  }
}

class EventManagementDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSidebar(context),
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildEventCards(),
            SizedBox(height: 20),
            _buildCalendarView(),
            SizedBox(height: 20),
            _buildAnalyticsSection(),
            SizedBox(height: 20),
            _buildNotificationsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Navigation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Events'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title: Text('Analytics'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEventCards() {
    return Column(
      children: [
        _buildEventCard(
          'Event 1',
          'July 31, 2024',
          '10:00 AM',
          'Location 1',
          'Description of Event 1',
        ),
        _buildEventCard(
          'Event 2',
          'August 5, 2024',
          '2:00 PM',
          'Location 2',
          'Description of Event 2',
        ),
        // Add more event cards as needed
      ],
    );
  }

  Widget _buildEventCard(String title, String date, String time, String location, String description) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
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

  Widget _buildCalendarView() {
    // Placeholder for calendar view widget
    return Container(
      height: 300,
      color: Colors.grey[200],
      child: Center(child: Text('Calendar View')),
    );
  }

  Widget _buildAnalyticsSection() {
    // Placeholder for analytics widgets
    return Container(
      height: 200,
      color: Colors.grey[200],
      child: Center(child: Text('Analytics Section')),
    );
  }

  Widget _buildNotificationsSection() {
    // Placeholder for notifications widgets
    return Container(
      height: 200,
      color: Colors.grey[200],
      child: Center(child: Text('Notifications Section')),
    );
  }
}
