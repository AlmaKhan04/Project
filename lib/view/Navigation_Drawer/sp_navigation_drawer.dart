import 'package:ems/view/Dashboard/Super_Admin_Dashboard/screens/superuser_dashboard_screen.dart';
import 'package:ems/view/Profile/profile_screen.dart';
import 'package:ems/view/Super_Admin/organizations.dart';
import 'package:ems/view/Super_Admin/subscription_plan.dart';
import 'package:ems/view/Super_Admin/users.dart';
import 'package:ems/view/Super_Admin/vendors.dart';
import 'package:ems/view/Super_Admin/vendors_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Sp_navigation_drawer extends StatelessWidget{
  
  const Sp_navigation_drawer({super.key, required String title});

    
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
                MaterialPageRoute(builder: (context) => SuperuserDashboardScreen()),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.business),
            title: Text('Organization'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Organizations(title: 'Organization')),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.subscriptions),
            title: Text('Subscribtion'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Subscription_plan(title: 'Subscription')),
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
            leading: Icon(Icons.store),
            title: Text('Vendors'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Vendors(title: 'Vendor')),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.store),
            title: Text('Vendors Category'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Vendors_category(title: 'Vendor Category')),
              );
            },
          ),
        ],
      ),
    );
  }
}
