import 'package:flutter/material.dart';

class Chat_bot extends StatefulWidget {
  Chat_bot({Key? key, required String title}) : super(key: key);

  @override
  State<Chat_bot> createState() => _Chat_botState();
}

class _Chat_botState extends State<Chat_bot> {

    @override
    Widget build(BuildContext context) {
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
            'Chat bot',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 108, 109, 110),
        ),

        body: Column(
          children: [
            Text('Chat bot',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.black,
                fontSize: 32,
              ),
            ),
          ],
        ),
      );
    }
  }