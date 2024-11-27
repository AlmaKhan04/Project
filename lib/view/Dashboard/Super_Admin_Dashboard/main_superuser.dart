import 'package:ems/view/Dashboard/Organization_Dashboard/screens/organization_drawer.dart';
import 'package:flutter/material.dart';
import 'screens/superuser_dashboard_screen.dart'; // Ensure this path is correct


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreenSuper(), // Entry point of the app
    );
  }
}

class MainScreenSuper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Management App'),
      ),
      drawer: OrganizationDrawer(), // The drawer should be included here
      body: SuperuserDashboardScreen(), // The body of the app
    );
  }
}
