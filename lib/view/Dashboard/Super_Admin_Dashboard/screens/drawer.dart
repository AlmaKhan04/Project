import 'package:flutter/material.dart';

class OrganizationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Menu', style: TextStyle(fontSize: 24, color: Colors.white)),
            decoration: BoxDecoration(color: Color.fromARGB(255, 210, 139, 189)),
          ),
          ListTile(
            title: Text('Dashboard Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Superuser Management'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('User/Client Management'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('AI Chatbot Management'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Image Generator'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Vendor & Event Manager Connection'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Expense Management'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          
        ],
      ),
    );
  }
}
