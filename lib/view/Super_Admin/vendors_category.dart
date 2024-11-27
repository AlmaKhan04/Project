import 'package:ems/view/Navigation_Drawer/sp_navigation_drawer.dart';
import 'package:ems/view/Super_Admin/vendors_category_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'background_shapes_painter.dart'; // Import the custom painter

class Vendors_category extends StatefulWidget {
  const Vendors_category({super.key, required String title});

  @override
  State<Vendors_category> createState() => _Vendors_categoryState();
}

class _Vendors_categoryState extends State<Vendors_category> {
  List<Map<String, String>> organizations = [
    {
      'id': '1',
      'category_name': 'Venue',
      'description': 'A leading organization in tech.',
    },
    {
      'id': '2',
      'category_name': 'Decoration',
      'description': 'Specializing in marketing solutions.',
    },
    {
      'id': '3',
      'category_name': 'Caterer',
      'description': 'Experts in financial services.',
    },
    {
      'id': '4',
      'category_name': 'Flowers',
      'description': 'Providing healthcare solutions.',
    },
    // Add more organizations as needed
  ];

  void _deleteEvent(String eventId) {
    setState(() {
      organizations.removeWhere((event) => event['id'] == eventId);
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
              builder: (context) => Vendors_category_form(title: 'Profile Setup Page'),
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

  Widget _buildOrganizationCard(Map<String, String> organization) {
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
                    organization['category_name']!,
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
                          MaterialPageRoute(builder: (context) => Vendors_category_form(title: 'Home')),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteEvent(organization['id']!),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text('Description: ${organization['description']}', style: TextStyle(fontSize: 13.0, fontStyle: FontStyle.italic)),
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
                              'Categories',
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
                        'Welcome, Please add categories details and continue your journey',
                        style: TextStyle(
                          color: Color.fromARGB(255, 100, 100, 100),
                          fontFamily: 'OpenSans',
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Column(
                        children: organizations.map((org) => _buildOrganizationCard(org)).toList(),
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
