import 'package:flutter/material.dart';
import 'package:ems/view/Dashboard/dashboard.dart';
import 'package:ems/view/OLD_PAGES/Extra_Pages/message.dart';
import 'package:ems/view/OLD_PAGES/AI_Features/image_generator.dart';
import 'package:ems/view/Profile/profile_screen.dart';

class Activity extends StatelessWidget {
  final String title;

  const Activity({Key? key, required this.title}) : super(key: key);

  void _Activity(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.blue, // Button color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 108, 109, 110),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: ElevatedButton(
                    onPressed: () => _Activity(context, const Dashboard(title: 'Home Page')),
                    style: buttonStyle,
                    child: const Text(
                      'Create Event',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: ElevatedButton(
                    onPressed: () => _Activity(context, const Message(title: 'Messaging Page')),
                    style: buttonStyle,
                    child: const Text(
                      'Venue',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: ElevatedButton(
                    onPressed: () => _Activity(context, const ImageGenerator(title: 'Image Generator Page')),
                    style: buttonStyle,
                    child: const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: ElevatedButton(
                    onPressed: () => _Activity(context, const Profile_screen(title: 'Profile Page')),
                    style: buttonStyle,
                    child: const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
