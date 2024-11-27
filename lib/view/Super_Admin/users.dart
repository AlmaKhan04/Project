import 'package:ems/view/Navigation_Drawer/sp_navigation_drawer.dart';
import 'package:ems/view/Super_Admin/users_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'background_shapes_painter.dart'; // Import the custom painter

class Users extends StatefulWidget {
  const Users({super.key, required String title});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<Map<String, String>> users = [
    {
      'id': '1',
      'full_name': 'Sam Shkh',
      'contactnumber': '9876543210',
      'email': 'sam@gmail.com',
      'address': '1234, 5th Avenue',
    },
    {
      'id': '2',
      'full_name': 'John Doe',
      'contactnumber': '9876543210',
      'email': 'john@gmail.com',
      'address': '5678, 6th Avenue',
    },
    {
      'id': '3',
      'full_name': 'Ben Doe',
      'contactnumber': '9876543210',
      'email': 'ben@gmail.com',
      'address': '5678, 6th Avenue',
    },
    {
      'id': '4',
      'full_name': 'Van Doe',
      'contactnumber': '9876543210',
      'email': 'van@gmail.com',
      'address': '5678, 6th Avenue',
    },
    // Add more users as needed
  ];

  void _deleteEvent(String eventId) {
    setState(() {
      users.removeWhere((event) => event['id'] == eventId);
    });
  }

  Widget _buildAddBtn() {
    return Container(
      padding: EdgeInsets.only(top: 10.0, right: 2.0),
      alignment: Alignment.topRight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5.0,
          backgroundColor: Color.fromARGB(255, 35, 94, 153),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Users_form(title: 'User Setup Page'),
            ),
          );
        },
        child: Text(
          'Add',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildUserCard(Map<String, String> user) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5.0,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    user['full_name']!,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Users_form(title: 'Home')),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteEvent(user['id']!),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text('Contact Number: ${user['contactnumber']}', style: TextStyle(fontSize: 13.0)),
            Text('Email: ${user['email']}', style: TextStyle(fontSize: 13.0)),
            Text('Address: ${user['address']}', style: TextStyle(fontSize: 13.0)),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sp_navigation_drawer(title: 'Navigation Drawer'),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Set the color for the hamburger icon
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 95.0, bottom: 0.0),
          child: SizedBox(
            child: Image.asset('assets/LOGO/EA_white.png'),
            height: 60.0,
            width: 60.0,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 14, 78, 143),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              CustomPaint(
                painter: BackgroundShapesPainter(),
                child: Container(),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Users',
                              style: TextStyle(
                                color: Color.fromARGB(255, 85, 85, 85),
                                fontFamily: 'OpenSans',
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          _buildAddBtn(),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Welcome, Please add your user details and continue your journey',
                        style: TextStyle(
                          color: Color.fromARGB(255, 100, 100, 100),
                          fontFamily: 'OpenSans',
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Column(
                        children: users.map((user) => _buildUserCard(user)).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
