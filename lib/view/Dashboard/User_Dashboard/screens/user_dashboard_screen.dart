import 'package:ems/view/Dashboard/User_Dashboard/model/dashboard_card.dart';
import 'package:ems/view/Dashboard/User_Dashboard/screens/background_shapes_painter.dart';
import 'package:ems/view/Dashboard/User_Dashboard/widgets/calender_widget.dart';
import 'package:ems/view/Dashboard/User_Dashboard/widgets/ongoing_event_section.dart';
import 'package:ems/view/Dashboard/User_Dashboard/widgets/review_section.dart';
import 'package:ems/view/Navigation_Drawer/user_navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserDashboardScreen extends StatefulWidget {
  @override
  _UserDashboardScreenState createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {

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
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 15.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Dashboard Overview',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      // First Row: Total Organizations and Connected Vendors
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: DashboardCard(
                              title: 'Total Events',
                              value: '120',
                              color: Color.fromARGB(255, 75, 97, 136),
                            ),
                          ),
                          SizedBox(width: 8.0), // Add some spacing between the cards
                          Expanded(
                            child: DashboardCard(
                              title: 'Successfull Events',
                              value: '110',
                              color: Color.fromARGB(255, 143, 189, 168),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      // Ongoing Events Card
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ongoing Events',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(height: 10),
                              OngoingeventSection(),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      // Upcoming Events in Calendar
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Upcoming Events',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(height: 10),
                              CalendarWidget(),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      // Reviews Card
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Reviews',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(height: 10),
                              ReviewSection(),
                            ],
                          ),
                        ),
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
