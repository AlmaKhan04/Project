import 'package:ems/view/Dashboard/Super_Admin_Dashboard/screens/background_shapes_painter.dart';
import 'package:ems/view/Dashboard/Super_Admin_Dashboard/widgets/year_selector.dart';
import 'package:ems/view/Navigation_Drawer/sp_navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/bar_chart_widget.dart';
import '../widgets/line_chart_widget.dart';
import '../widgets/review_section.dart';

class SuperuserDashboardScreen extends StatefulWidget {
  @override
  _SuperuserDashboardScreenState createState() => _SuperuserDashboardScreenState();
}

class _SuperuserDashboardScreenState extends State<SuperuserDashboardScreen> {
  int selectedYear = DateTime.now().year; // Default to current year

  void _onYearChanged(int newYear) {
    setState(() {
      selectedYear = newYear;
    });
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
                    horizontal: 10.0,
                    vertical: 15.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Super Admin Dashboard Overview',
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
                              title: 'Total Organizations',
                              value: '120',
                              color: Color.fromARGB(255, 75, 97, 136),
                            ),
                          ),
                          SizedBox(width: 8.0), // Add some spacing between the cards
                          Expanded(
                            child: DashboardCard(
                              title: 'Connected Vendors',
                              value: '75',
                              color: Color.fromARGB(255, 143, 189, 168),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10), // Spacing between the rows
                      // Second Row: Total Revenue and Pending Revenue
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: DashboardCard(
                              title: 'Total Revenue',
                              value: '10M',
                              color: Color.fromARGB(255, 174, 143, 189),
                            ),
                          ),
                          SizedBox(width: 8.0), // Add some spacing between the cards
                          Expanded(
                            child: DashboardCard(
                              title: 'Pending Revenue',
                              value: '50K',
                              color: Color.fromARGB(255, 189, 143, 153),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Platform Activity Graph Card
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
                                'Organizations Purchased',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              YearSelector(
                                selectedYear: selectedYear,
                                onYearChanged: _onYearChanged,
                              ),
                              BarChartWidget(selectedYear: selectedYear),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Engagement Matrix Card
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
                                'Engagement Matrix',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(height: 10),
                              LineChartWidget(selectedYear: selectedYear),
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
