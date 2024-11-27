import 'package:flutter/material.dart';
import 'package:ems/view/OLD_PAGES/Navigation_Bar/navigation_bar.dart';

class ImageGenerator extends StatefulWidget{
  const ImageGenerator({super.key, required String title});

  @override
  State<ImageGenerator> createState() => _Image_generator_State();
}

class _Image_generator_State extends State<ImageGenerator> 
  with SingleTickerProviderStateMixin{

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'AI Image Generator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 108, 109, 110),
      ),

      body: Center(
        child: Text(
          'Welcome to the AI Image Generator Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: Navigation_bar(title: 'Navigation'),  // Use the Navigation_bar widget
    );
  }
}

