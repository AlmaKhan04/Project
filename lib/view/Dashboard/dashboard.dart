import 'package:ems/constants/styles.dart';
import 'package:ems/view/Dashboard/Organization_Dashboard/screens/organization_dashboard_screen.dart';
import 'package:ems/view/Dashboard/Super_Admin_Dashboard/screens/superuser_dashboard_screen.dart';
import 'package:ems/view/Dashboard/User_Dashboard/screens/user_dashboard_screen.dart';
import 'package:ems/view/Image_Generator/Image_Generator_Screen.dart';
import 'package:ems/view/Organization_Admin/users.dart';
import 'package:ems/view/Super_Admin/organizations.dart';
import 'package:ems/view/Users/manage_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget{
  const Dashboard({super.key, required String title});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> 
  with SingleTickerProviderStateMixin{

  Widget _buildEmailTF(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: <Widget>[
        Text(
          'Email', 
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Color.fromARGB(255, 105, 59, 105),
              fontFamily: 'OpenSans',  
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSuperAdminButtons() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: 300.0, // Set width
          height: 75.0, // Set height
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 169, 135, 168),
                  Color.fromARGB(255, 121, 68, 121)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Organizations(title: 'Event Setup Page')),
                );
              },
              child: Text(
                'Super Admin',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrganizationButtons() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: 300.0, // Set width
          height: 75.0, // Set height
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 169, 135, 168),
                  Color.fromARGB(255, 121, 68, 121)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Users(title: 'Event Setup Page')),
                );
              },
              child: Text(
                'Organization Admin',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserButtons() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: 300.0, // Set width
          height: 75.0, // Set height
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 169, 135, 168),
                  Color.fromARGB(255, 121, 68, 121)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Manage_event(title: 'Event Setup Page')),
                );
              },
              child: Text(
                'User Admin',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuperAdminDashboard() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: 300.0, // Set width
          height: 75.0, // Set height
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 169, 135, 168),
                  Color.fromARGB(255, 121, 68, 121)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SuperuserDashboardScreen()),
                );
              },
              child: Text(
                'Super Admin Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrgAdminDashboard() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: 300.0, // Set width
          height: 75.0, // Set height
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 169, 135, 168),
                  Color.fromARGB(255, 121, 68, 121)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrganizationDashboardScreen()),
                );
              },
              child: Text(
                'Org Admin Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserDashboard() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: 300.0, // Set width
          height: 75.0, // Set height
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 169, 135, 168),
                  Color.fromARGB(255, 121, 68, 121)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserDashboardScreen()),
                );
              },
              child: Text(
                'User Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageGenerator() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: 300.0, // Set width
          height: 75.0, // Set height
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 169, 135, 168),
                  Color.fromARGB(255, 121, 68, 121)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Image_Generator_Screen()),
                );
              },
              child: Text(
                'Image Generator',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 150, 93, 150),
      ),

      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                color: Color.fromARGB(255, 254, 250, 255),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 70.0,
                  ),
          
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          color: Color.fromARGB(255, 85, 85, 85), 
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Welcome, Please Sign in and continue \nyour journey with us',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 100, 100, 100),
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
          
                      SizedBox(height: 40.0),
                      _buildEmailTF(),
                      SizedBox(height: 30.0),
                      _buildSuperAdminButtons(),
                      SizedBox(height: 30.0,),
                      _buildOrganizationButtons(),
                      SizedBox(height: 30.0,),
                      _buildUserButtons(),
                      SizedBox(height: 30.0,),
                      _buildSuperAdminDashboard(),
                      SizedBox(height: 30.0,),
                      _buildOrgAdminDashboard(),
                      SizedBox(height: 30.0,),
                      _buildUserDashboard(),
                      SizedBox(height: 30.0,),
                      _buildImageGenerator(),
                      SizedBox(height: 30.0,),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      //bottomNavigationBar: Navigation_bar(title: 'Navigation'),
    );
  }
}

