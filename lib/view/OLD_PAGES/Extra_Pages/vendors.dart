import 'package:ems/view/Signin_Singup/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Vendors extends StatefulWidget {
  const Vendors({super.key, required String title});

  @override
  State<Vendors> createState() => _VendorsState();
}

class _VendorsState extends State<Vendors> {
  bool _isChecked = false;

  Widget _buildImageBox() {
    return Container(
      width: 350.0, // Fixed width
      height: 150.0, // Fixed height
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.black, width: 2.0, style: BorderStyle.solid, strokeAlign: BorderSide.strokeAlignInside),
                  image: DecorationImage(
                    image: AssetImage('assets/images/onboarding_images/Scalability_and_Flexibility.png'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 156, 156, 156).withOpacity(0.1),
                      blurRadius: 10.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signin(title: 'Sign In')),
                      );
                    },
                    child: Text(
                      'Kokni Hall',
                      style: TextStyle(
                        color: Color(0xFF527DAA),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.black,
                          size: 15.0,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          'Mumbai Central',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.black,
                          size: 15.0,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          'Timings',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
                    )
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      'Mon - Sun \n9:00am - 9:00pm',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Checkbox(
              value: _isChecked,
              activeColor: Colors.green, // Set the color to green when checked
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateEventBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5.0,
          backgroundColor: Colors.white,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Vendors(title: 'Profile Setup Page')),
          );
        },
        child: Text(
          'Next',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Vendors',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 108, 109, 110),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478de0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 40.0,
                  ),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Select Decoration Items',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        _buildImageBox(),
                        SizedBox(height: 30.0),
                        _buildCreateEventBtn(),
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
