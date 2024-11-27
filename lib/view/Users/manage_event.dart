import 'package:ems/view/Navigation_Drawer/user_navigation_drawer.dart';
import 'package:ems/view/Users/background_shapes_painter.dart';
import 'package:ems/view/Users/manage_event_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Manage_event extends StatefulWidget {
  const Manage_event({super.key, required String title});

  @override
  State<Manage_event> createState() => _Manage_eventState();
}

class _Manage_eventState extends State<Manage_event> {
  List<Map<String, String>> events = [
    {
      'id': '1',
      'event_name': 'Conference',
      'date': '2024-09-15',
      'start_time': '10:00 AM',
      'end_time': '04:00 PM',
      'location': 'Maharashtra, Mumbai',
      'category': 'Conference',
      'status': 'Scheduled',
      'budget': '5000',
      'description': 'Annual tech conference',
    },
    {
      'id': '2',
      'event_name': 'Workshop',
      'date': '2024-10-05',
      'start_time': '09:00 AM',
      'end_time': '12:00 PM',
      'location': 'Karnataka, Bengaluru',
      'category': 'Workshop',
      'status': 'Confirmed',
      'budget': '2000',
      'description': 'Workshop on Flutter development',
    },
    {
      'id': '3',
      'event_name': 'Exhibition',
      'date': '2024-10-05',
      'start_time': '09:00 AM',
      'end_time': '12:00 PM',
      'location': 'Kerala, Kollam',
      'category': 'Workshop',
      'status': 'Confirmed',
      'budget': '2000',
      'description': 'Workshop on Flutter development',
    },
    // Add more events as needed
  ];

  void _deleteEvent(String eventId) {
    setState(() {
      events.removeWhere((event) => event['id'] == eventId);
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
              builder: (context) => Manage_event_form(title: 'Event Setup Page'),
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

  Widget _buildEventCard(Map<String, String> event) {
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
                    event['event_name']!,
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
                          MaterialPageRoute(
                            builder: (context) =>
                                Manage_event_form(title: 'Home'),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteEvent(event['id']!),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text('Date: ${event['date']}', style: TextStyle(fontSize: 13.0)),
            Text('Start Time: ${event['start_time']}', style: TextStyle(fontSize: 13.0)),
            Text('End Time: ${event['end_time']}', style: TextStyle(fontSize: 13.0)),
            Text('Location: ${event['location']}', style: TextStyle(fontSize: 13.0)),
            Text('Category: ${event['category']}', style: TextStyle(fontSize: 13.0)),
            Text('Status: ${event['status']}', style: TextStyle(fontSize: 13.0)),
            Text('Budget: \₹${event['budget']}', style: TextStyle(fontSize: 13.0)),
            Text('Description: ${event['description']}', style: TextStyle(fontSize: 13.0)),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: User_navigation_drawer(title: 'Navigation Drawer'),
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
              SafeArea(
                child: Container(
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
                                'Events',
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
                          'Welcome, Please add your event details and continue your journey',
                          style: TextStyle(
                            color: Color.fromARGB(255, 100, 100, 100),
                            fontFamily: 'OpenSans',
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Column(
                          children: events.map((event) => _buildEventCard(event)).toList(),
                        ),
                      ],
                    ),
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
