import 'package:flutter/material.dart';
import 'package:ems/view/OLD_PAGES/Navigation_Bar/navigation_bar.dart';

class Message extends StatefulWidget{
  const Message({super.key, required String title});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> 
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
          'Message',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 108, 109, 110),
      ),

      body: Center(
        child: Text(
          'Welcome to the Messageing Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
      
      bottomNavigationBar: Navigation_bar(title: 'Navigation'),
    );
  }
}

