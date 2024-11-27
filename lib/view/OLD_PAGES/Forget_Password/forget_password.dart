import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget{
  const ForgetPassword({super.key, required String title});

  @override
  State<ForgetPassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<ForgetPassword> 
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
          'Forget Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 108, 109, 110),
      ),

      body: Column(
        children: [
          Text('Forget Password',
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

