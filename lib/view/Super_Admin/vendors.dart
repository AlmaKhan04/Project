import 'package:ems/view/Navigation_Drawer/sp_navigation_drawer.dart';
import 'package:ems/view/Super_Admin/vendors_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'background_shapes_painter.dart'; // Import the custom painter

class Vendors extends StatefulWidget {
  const Vendors({super.key, required String title});

  @override
  State<Vendors> createState() => _VendorsState();
}

class _VendorsState extends State<Vendors> {
  List<Map<String, String>> vendors = [
    {
      'id': '1',
      'vendor_name': 'Sam Organization',
      'contact_person': 'Sam shkh',
      'contact_number': '9876543210',
      'email': 'sam@gmail.com',
      'physical_address': '1234, 5th Avenue',
      'vendors_description': 'This is Sam\'s Organization',
    },
    {
      'id': '2',
      'vendor_name': 'John Organization',
      'contact_person': 'John Doe',
      'contact_number': '9876543210',
      'email': 'john@gmail.com',
      'physical_address': '5678, 6th Avenue',
      'vendors_description': 'This is John\'s Organization',
    },
    {
      'id': '3',
      'vendor_name': 'Ben Organization',
      'contact_person': 'Ben Doe',
      'contact_number': '9876543210',
      'email': 'ben@gmail.com',
      'physical_address': '5678, 6th Avenue',
      'vendors_description': 'This is Ben\'s Organization',
    },
    {
      'id': '4',
      'vendor_name': 'Van Organization',
      'contact_person': 'Van Doe',
      'contact_number': '9876543210',
      'email': 'van@gmail.com',
      'physical_address': '5678, 6th Avenue',
      'vendors_description': 'This is Van\'s Organization',
    },
    // Add more organizations as needed
  ];

  void _deleteEvent(String eventId) {
    setState(() {
      vendors.removeWhere((event) => event['id'] == eventId);
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
              builder: (context) => Vendors_form(title: 'Profile Setup Page'),
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

  Widget _buildOrganizationCard(Map<String, String> vendor) {
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
                    vendor['vendor_name']!,
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
                          MaterialPageRoute(builder: (context) => Vendors_form(title: 'Home')),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteEvent(vendor['id']!),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text('Contact Person: ${vendor['contact_person']}', style: TextStyle(fontSize: 13.0)),
            Text('Contact Number: ${vendor['contact_number']}', style: TextStyle(fontSize: 13.0)),
            Text('Email: ${vendor['email']}', style: TextStyle(fontSize: 13.0)),
            Text('Address: ${vendor['physical_address']}', style: TextStyle(fontSize: 13.0)),
            Text('Description: ${vendor['vendors_description']}', style: TextStyle(fontSize: 13.0)),
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
                              'Vendors',
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
                        'Welcome, Please add your vendor details and continue your journey',
                        style: TextStyle(
                          color: Color.fromARGB(255, 100, 100, 100),
                          fontFamily: 'OpenSans',
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Column(
                        children: vendors.map((org) => _buildOrganizationCard(org)).toList(),
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
