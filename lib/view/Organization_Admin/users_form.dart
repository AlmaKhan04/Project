import 'dart:io';
import 'package:ems/constants/colors.dart';
import 'package:ems/constants/styles.dart';
import 'package:ems/view/Dashboard/dashboard.dart';
import 'package:ems/view/Navigation_Drawer/org_navigation_drawer.dart';
import 'package:ems/view/Organization_Admin/background_shapes_painter_2.dart';
import 'package:ems/view/Organization_Admin/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Users_form extends StatefulWidget {
  const Users_form({super.key, required String title});

  @override
  State<Users_form> createState() => _Users_formState();
}

class _Users_formState extends State<Users_form> {
  final TextEditingController _useridController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  File? image;
  bool _isImageSelected = false;

  String? _selectedReporting;
  String? _selectedDesignation;
  final List<String> _reportingOptions = ['Manager', 'Team Lead', 'Staff'];
  final List<String> _designationOptions = ['Junior Developer', 'Senior Developer', 'Lead Developer'];

  void _clearForm() {
    _useridController.clear();
    _fullnameController.clear();
    _addressController.clear();
    _contactController.clear();
    _emailController.clear();
    _imageController.clear();

    setState(() {
      _isImageSelected = false;
      image = null;
      _selectedReporting = null;
      _selectedDesignation = null;
    });
  }

  Future pickImage() async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);

      setState(() {
        this.image = imageTemp;
        _isImageSelected = true; // Set to true when an image is selected
      });

    } on PlatformException catch(e){
      print("Failed to pick Image: $e");
    }
  }

  bool _isFormValid() {
    return _isUserIdValid && _isFullNameValid && _isContactValid && _isEmailValid && _isAddressValid && _isDesignationValid && _isReportingValid && _isImageValid; 
   // Add other field validations as required
  }


  bool _isUserIdValid = true; // Flag to track validation
  bool _isFullNameValid = true;
  bool _isContactValid = true;
  bool _isEmailValid = true;
  bool _isAddressValid = true;
  bool _isDesignationValid = true;
  bool _isReportingValid = true;
  bool _isImageValid = true;

  void _validateForm() {
    setState(() {
      _isUserIdValid = _useridController.text.isNotEmpty;
      _isFullNameValid = _fullnameController.text.isNotEmpty;
      _isContactValid = _contactController.text.isNotEmpty;
      _isEmailValid = _emailController.text.isNotEmpty;
      _isAddressValid = _addressController.text.isNotEmpty;
      _isDesignationValid = _selectedDesignation != null;
      _isReportingValid = _selectedReporting != null;
      _isImageValid = _imageController.text.isNotEmpty;
    });

    if (_isFormValid()) {
      // If form is valid, navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Users(title: 'Users',)), // Replace with your target page
      );
    } else {
      // Stay on the same page and show validation errors
      print("Please fill out all required fields.");
    }
  }

  final FocusNode _DesignationFocuseNode = FocusNode();
  bool _isDesignationFocused = false;

  final FocusNode _ReportingFocuseNode = FocusNode();
  bool _isReportingFocused = false;

  @override
  void initState() {
    super.initState();

    // Add listener to update focus state when the dropdown focus changes
    _DesignationFocuseNode.addListener(() {
      setState(() {
        _isDesignationFocused = _DesignationFocuseNode.hasFocus;
      });
    });

    _ReportingFocuseNode.addListener(() {
      setState(() {
        _isReportingFocused = _ReportingFocuseNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _DesignationFocuseNode.dispose(); // Dispose of the focus node when done
    super.dispose();
  }

  Widget _buildUserIDTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'User ID',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        TextField(
          controller: _useridController,
          keyboardType: TextInputType.number,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 59, 105),
            fontFamily: 'OpenSans',
          ),
          onChanged: (text) {
            // If there was an error but user is typing, clear the error
            if (!_isUserIdValid && text.isNotEmpty) {
              setState(() {
                _isUserIdValid = true;
              });
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 12.0),
            prefixIcon: Icon(
              Icons.badge,
              color: Color.fromARGB(255, 100, 100, 100),
              size: 22.0,
            ),
            hintText: 'Enter User ID',
            hintStyle: kHintTextStyle,
            errorText: _isUserIdValid ? null : '*Required',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isUserIdValid ? Colors.grey : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isUserIdValid ? fbordercolor : Colors.red,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isUserIdValid ? bordercolor : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
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
          keyboardType: TextInputType.number,
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

  Widget _buildImagePicker() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Profile Picture',
        style: kLabelStyle,
      ),
      SizedBox(height: 5.0), // Adjust spacing as needed
      SizedBox(
        width: 350.0, // Set width for the button
        height: 50.0, // Set height for the button
        child: OutlinedButton(
          onPressed: () async {
            await pickImage();
            setState(() {
              _isImageSelected = true; // Mark image as selected
              _isImageValid = true; // Mark image selection as valid
            });
          },
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: _isImageValid
                  ? Color.fromARGB(255, 236, 220, 232) // Default border color
                  : Color.fromARGB(255, 190, 36, 25), // Red border for invalid state
              width: 1.0, // Border width
            ),
            padding: EdgeInsets.zero, // Remove internal padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Icon(
                  Icons.image,
                  color: Color.fromARGB(255, 100, 100, 100),
                  size: 22.0,
                ),
              ),
              SizedBox(width: 10.0), // Space between icon and text
              Expanded(
                child: Text(
                  _isImageSelected ? 'Image Selected' : 'Select Profile Picture',
                  style: kHintTextStyle,
                  overflow: TextOverflow.ellipsis, // Handle text overflow
                ),
              ),
              if (_isImageSelected)
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Icon(
                    Icons.check,
                    color: Color.fromARGB(255, 76, 175, 80), // Checkmark color
                    size: 22.0,
                  ),
                ),
            ],
          ),
        ),
      ),
      if (!_isImageValid) // Show error message if image is not selected
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            '*Required',
            style: TextStyle(color: Color.fromARGB(255, 190, 36, 25), fontSize: 12.0),
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
              Icons.person,
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

  Widget _buildDesignationDropdown() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Designation',
        style: kLabelStyle,
      ),
      SizedBox(height: 5.0),
      GestureDetector(
        onTap: () {
          setState(() {
            _isDesignationFocused = true; // Set focus when tapped
          });
        },
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: _isDesignationFocused
                  ? fbordercolor // Focus border color
                  : (_isDesignationValid
                      ? bordercolor // Valid border color
                      : Color.fromARGB(255, 190, 36, 25)), // Error border color
              width: _isDesignationFocused ? 1.5 : 1.0,
            ),
          ),
          height: 50.0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.assignment,
                  color: Color.fromARGB(255, 100, 100, 100),
                  size: 22.0,
                ),
              ),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedDesignation,
                    hint: Text(
                      'Select Designation',
                      style: kHintTextStyle,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedDesignation = newValue;
                        _isDesignationFocused = false; // Remove focus
                        _isDesignationValid = _selectedDesignation != null; // Validate
                      });
                    },
                    onTap: () {
                      setState(() {
                        _isDesignationFocused = true; // Set focus
                      });
                    },
                    items: _designationOptions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Color.fromARGB(255, 105, 59, 105),
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      );
                    }).toList(),
                    isExpanded: true,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Color.fromARGB(255, 100, 100, 100),
                      size: 22.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      if (!_isDesignationValid)
        Padding(
          padding: const EdgeInsets.only(left: 0, top: 5.0),
          child: Text(
            '*Required',
            style: TextStyle(
              color: Color.fromARGB(255, 190, 36, 25),
              fontSize: 12.0,
            ),
          ),
        ),
    ],
  );
}


  Widget _buildReportingDropdown() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Reporting To',
        style: kLabelStyle,
      ),
      SizedBox(height: 5.0),
      GestureDetector(
        onTap: () {
          setState(() {
            _isReportingFocused = true; // Set focus when tapped
          });
        },
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: _isReportingFocused
                  ? fbordercolor // Focus border color
                  : (_isReportingValid
                      ? bordercolor // Valid border color
                      : Color.fromARGB(255, 190, 36, 25)), // Error border color
              width: _isReportingFocused ? 1.5 : 1.0,
            ),
          ),
          height: 50.0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.assessment, // Choose an appropriate icon for reporting
                  color: Color.fromARGB(255, 100, 100, 100),
                  size: 22.0,
                ),
              ),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedReporting,
                    hint: Text(
                      'Select Reporting',
                      style: kHintTextStyle,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedReporting = newValue;
                        _isReportingFocused = false; // Remove focus on selection
                        _isReportingValid = _selectedReporting != null; // Validate
                      });
                    },
                    onTap: () {
                      setState(() {
                        _isReportingFocused = true; // Set focus
                      });
                    },
                    items: _reportingOptions.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Color.fromARGB(255, 105, 59, 105),
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      );
                    }).toList(),
                    isExpanded: true,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Color.fromARGB(255, 100, 100, 100),
                      size: 22.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      if (!_isReportingValid)
        Padding(
          padding: const EdgeInsets.only(left: 0, top: 5.0),
          child: Text(
            '*Required',
            style: TextStyle(
              color: Color.fromARGB(255, 190, 36, 25),
              fontSize: 12.0,
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
                  Color.fromARGB(255, 25, 75, 124),
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
                          'User Details',
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
                        'Please Add the User Details',
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
                            _buildUserIDTF(),
                            SizedBox(height: 20.0,),
                            _buildFullNameTF(),
                            SizedBox(height: 20.0),
                            _buildImagePicker(),
                            SizedBox(height: 20.0,),
                            _buildContactTF(),
                            SizedBox(height: 20.0),
                            _buildEmailTF(),
                            SizedBox(height: 20.0),
                            _buildAddressTF(),
                            SizedBox(height: 20.0),
                            _buildDesignationDropdown(),
                            SizedBox(height: 20.0,),
                            _buildReportingDropdown(), // Add the new dropdown here
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
