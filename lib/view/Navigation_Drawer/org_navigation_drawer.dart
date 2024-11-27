import 'package:ems/view/Dashboard/Organization_Dashboard/screens/organization_dashboard_screen.dart';
import 'package:ems/view/Organization_Admin/clients.dart';
import 'package:ems/view/Organization_Admin/events.dart';
import 'package:ems/view/Organization_Admin/users.dart';
import 'package:ems/view/Profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Org_navigation_drawer extends StatelessWidget{
  
  const Org_navigation_drawer({super.key, required String title});

    
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
                MaterialPageRoute(builder: (context) => OrganizationDashboardScreen()),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: Text('Users'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Users(title: 'User')),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.event),
            title: Text('Events'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Events(title: 'Vendor')),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.group),
            title: Text('Clients'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Clients(title: 'Vendor Category')),
              );
            },
          ),
        ],
      ),
    );
  }
}
