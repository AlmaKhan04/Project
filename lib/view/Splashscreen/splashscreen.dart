import 'package:ems/view/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key, required String title});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const Dashboard(title: 'Org',),
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 248, 251, 254),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace the Icon with Image.asset
            Image.asset(
              'assets/LOGO/EA-LOGO.png',
              height: 100,  // Adjust size as needed
              width: 100,   // Adjust size as needed
            ),
            SizedBox(height: 20),
            Text(
              'Eventaura',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 55, 96, 137),
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
