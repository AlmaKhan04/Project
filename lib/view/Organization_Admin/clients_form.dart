import 'package:ems/constants/colors.dart';
import 'package:ems/constants/styles.dart';
import 'package:ems/view/Dashboard/dashboard.dart';
import 'package:ems/view/Navigation_Drawer/org_navigation_drawer.dart';
import 'package:ems/view/Organization_Admin/background_shapes_painter_2.dart';
import 'package:ems/view/Organization_Admin/clients.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Clients_form extends StatefulWidget {
  const Clients_form({super.key, required String title});

  @override
  State<Clients_form> createState() => _Clients_formState();
}

class _Clients_formState extends State<Clients_form> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _clearForm() {
    _fullnameController.clear();
    _addressController.clear();
    _contactController.clear();
    _emailController.clear();
  }

  bool _isFormValid() {
    return _isFullNameValid && _isContactValid && _isEmailValid && _isAddressValid; 
   // Add other field validations as required
  }


  bool _isFullNameValid = true; // Flag to track validation
  bool _isContactValid = true;
  bool _isEmailValid = true;
  bool _isAddressValid = true;

  void _validateForm() {
    setState(() {
      _isFullNameValid = _fullnameController.text.isNotEmpty;
      _isContactValid = _contactController.text.isNotEmpty;
      _isEmailValid = _emailController.text.isNotEmpty;
      _isAddressValid = _addressController.text.isNotEmpty;
    });

    if (_isFormValid()) {
      // If form is valid, navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Clients(title: 'Clientss',)), // Replace with your target page
      );
    } else {
      // Stay on the same page and show validation errors
      print("Please fill out all required fields.");
    }
  }

  Widget _buildFullNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Full Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        TextField(
          controller: _fullnameController,
          keyboardType: TextInputType.name,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 59, 105),
            fontFamily: 'OpenSans',
          ),
          onChanged: (text) {
            // If there was an error but user is typing, clear the error
            if (!_isFullNameValid && text.isNotEmpty) {
              setState(() {
                _isFullNameValid = true;
              });
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 12.0),
            prefixIcon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 100, 100, 100),
              size: 22.0,
            ),
            hintText: 'Enter Full Name',
            hintStyle: kHintTextStyle,
            errorText: _isFullNameValid ? null : '*Required',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isFullNameValid ? Colors.grey : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isFullNameValid ? fbordercolor : Colors.red,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isFullNameValid ? bordercolor : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Contact Number',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        TextField(
          controller: _contactController,
          keyboardType: TextInputType.phone,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 59, 105),
            fontFamily: 'OpenSans',
          ),
          onChanged: (text) {
            // If there was an error but user is typing, clear the error
            if (!_isContactValid && text.isNotEmpty) {
              setState(() {
                _isContactValid = true;
              });
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 12.0),
            prefixIcon: Icon(
              Icons.phone,
              color: Color.fromARGB(255, 100, 100, 100),
              size: 22.0,
            ),
            hintText: 'Enter Contact Number',
            hintStyle: kHintTextStyle,
            errorText: _isContactValid ? null : '*Required',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isContactValid ? Colors.grey : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isContactValid ? fbordercolor : Colors.red,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isContactValid ? bordercolor : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email Address',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 59, 105),
            fontFamily: 'OpenSans',
          ),
          onChanged: (text) {
            // If there was an error but user is typing, clear the error
            if (!_isEmailValid && text.isNotEmpty) {
              setState(() {
                _isEmailValid = true;
              });
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 12.0),
            prefixIcon: Icon(
              Icons.email,
              color: Color.fromARGB(255, 100, 100, 100),
              size: 22.0,
            ),
            hintText: 'Enter Email Address',
            hintStyle: kHintTextStyle,
            errorText: _isEmailValid ? null : '*Required',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isEmailValid ? Colors.grey : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isEmailValid ? fbordercolor : Colors.red,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isEmailValid ? bordercolor : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Address',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        TextField(
          controller: _addressController,
          keyboardType: TextInputType.streetAddress,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 59, 105),
            fontFamily: 'OpenSans',
          ),
          onChanged: (text) {
            // If there was an error but user is typing, clear the error
            if (!_isAddressValid && text.isNotEmpty) {
              setState(() {
                _isAddressValid = true;
              });
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 12.0),
            prefixIcon: Icon(
              Icons.location_on,
              color: Color.fromARGB(255, 100, 100, 100),
              size: 22.0,
            ),
            hintText: 'Enter Address',
            hintStyle: kHintTextStyle,
            errorText: _isAddressValid ? null : '*Required',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isAddressValid ? Colors.grey : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isAddressValid ? fbordercolor : Colors.red,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isAddressValid ? bordercolor : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: 150.0, // Set width
          height: 75.0, // Set height
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 65, 122, 179),
                  Color.fromARGB(255, 25, 75, 124)
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
                _validateForm(); // Check validation and navigate conditionally
              },
              child: Text(
                'Save',
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
        Center(
          child: TextButton(
            onPressed: _clearForm,
            child: Text(
              'Clear',
              style: TextStyle(
                color: Color.fromARGB(255, 65, 122, 179),
                fontFamily: 'OpenSans',
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
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
      drawer: Org_navigation_drawer(title: 'Navigation Drawer'),
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
                painter: BackgroundShapesPainter2(),
                child: Container(),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Client Details',
                          style: TextStyle(
                            color: Color.fromARGB(255, 85, 85, 85),
                            fontFamily: 'OpenSans',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        'Please Add the Client Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 100, 100, 100),
                          fontFamily: 'OpenSans',
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 4),
                              blurRadius: 10.0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            _buildFullNameTF(),
                            SizedBox(height: 20.0),
                            _buildContactTF(),
                            SizedBox(height: 20.0),
                            _buildEmailTF(),
                            SizedBox(height: 20.0),
                            _buildAddressTF(),
                            SizedBox(height: 20.0),
                            _buildActionButtons(),
                          ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your chat button action here
          print('Chat button pressed');
        },
        child: Icon(Icons.chat),
        backgroundColor: Color.fromARGB(255, 150, 93, 150),
      ),
    );
  }
}
