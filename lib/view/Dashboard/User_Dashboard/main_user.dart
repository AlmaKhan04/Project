import 'package:flutter/material.dart';
import 'screens/user_dashboard_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreenUser(),
    );
  }
}

class MainScreenUser extends StatelessWidget {
  const MainScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: UserDashboardScreen(),
    );
  }
}
