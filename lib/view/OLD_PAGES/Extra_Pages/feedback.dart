import 'package:ems/constants/styles.dart';
import 'package:ems/view/OLD_PAGES/Navigation_Bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Feed_back extends StatefulWidget{
  const Feed_back({super.key, required String title});

  @override
  State<Feed_back> createState() => _Feed_backState();
}

class _Feed_backState extends State<Feed_back> 
  with SingleTickerProviderStateMixin{

  Widget _buildEmailTF(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: <Widget>[
        Text(
          'Hello', 
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Color.fromARGB(255, 105, 59, 105),
              fontFamily: 'OpenSans',  
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

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
          'Feedback',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 150, 93, 150),
      ),

      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                color: Color.fromARGB(255, 254, 250, 255),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 70.0,
                  ),
          
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Feedback',
                        style: TextStyle(
                          color: Color.fromARGB(255, 85, 85, 85), 
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Welcome, Please Sign in and continue \nyour journey with us',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 100, 100, 100),
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
          
                      SizedBox(height: 40.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0
                      ),
           
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navigation_bar(title: 'Navigation'),
    );
  }
}

