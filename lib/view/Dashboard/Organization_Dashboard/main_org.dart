import 'package:flutter/material.dart';
import 'screens/organization_dashboard_screen.dart'; // Ensure this path is correct
import 'screens/organization_drawer.dart'; // Ensure this path is correct

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
      home: MainScreenOrg(), // Entry point of the app
    );
  }
}

class MainScreenOrg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: OrganizationDrawer(), // The drawer should be included here
      body: OrganizationDashboardScreen(), // The body of the app
    );
  }
}
