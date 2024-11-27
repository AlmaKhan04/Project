import 'package:ems/view/Dashboard/User_Dashboard/screens/user_dashboard_screen.dart';
import 'package:ems/view/Profile/profile_screen.dart';
import 'package:ems/view/Users/manage_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class User_navigation_drawer extends StatelessWidget{
  
  const User_navigation_drawer({super.key, required String title});

    
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Samreen Shkh'), 
            accountEmail: Text('samshkh@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/images/Forget_Password.png'),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 35, 76, 158),
            ),
          ),

          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile_screen(title: 'Profile')),
              );
            },
          ),

          //Divider(color: Colors.grey),

          Divider(
            color: Colors.grey,
            thickness: 1.0,
            indent: MediaQuery.of(context).size.width * 0.1, // Indent to match the search bar
            endIndent: MediaQuery.of(context).size.width * 0.1, // End indent to match the search bar
          ),

          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserDashboardScreen()),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.event_note),
            title: Text('Manage Event'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Manage_event(title: 'Vendor Category')),
              );
            },
          ),
        ],
      ),
    );
  }
}
