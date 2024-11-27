import 'package:ems/constants/colors.dart';
import 'package:ems/constants/styles.dart';
import 'package:ems/view/Dashboard/dashboard.dart';
import 'package:ems/view/Navigation_Drawer/sp_navigation_drawer.dart';
import 'package:ems/view/Super_Admin/background_shapes_painter_2.dart';
import 'package:ems/view/Super_Admin/vendors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Vendors_form extends StatefulWidget {
  const Vendors_form({super.key, required String title});

  @override
  State<Vendors_form> createState() => _Vendors_formState();
}

class _Vendors_formState extends State<Vendors_form> {
  final TextEditingController _vendorNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactPersonController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _selectedCategory; // Variable to hold the selected category

  final List<String> _categories = [
    'Catering',
    'Photography',
    'Entertainment',
    'Venue',
    'Decoration',
    'Others',
  ];

  void _clearForm() {
    _vendorNameController.clear();
    _addressController.clear();
    _contactPersonController.clear();
    _contactController.clear();
    _emailController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedCategory = null;
    });
  }

  bool _isFormValid() {
    return _isVendorNameValid && _isContactPersonValid && _isContactValid && _isEmailValid && _isAddressValid && _isCategoryValid; 
   // Add other field validations as required
  }

  bool _isVendorNameValid = true; // Flag to track validation
  bool _isContactPersonValid = true;
  bool _isContactValid = true;
  bool _isEmailValid = true;
  bool _isAddressValid = true;
  bool _isCategoryValid = true;
  bool _isCategoryFocused = false;

  void _validateForm() {
    setState(() {
      _isVendorNameValid = _vendorNameController.text.isNotEmpty;
      _isContactPersonValid = _contactPersonController.text.isNotEmpty;
      _isContactValid = _contactController.text.isNotEmpty;
      _isEmailValid = _emailController.text.isNotEmpty;
      _isAddressValid = _addressController.text.isNotEmpty;
      _isCategoryValid = _selectedCategory != null; // Check if category is selected
    });

    if (_isFormValid()) {
      // If form is valid, navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Vendors(title: 'Organizations',)), // Replace with your target page
      );
    } else {
      // Stay on the same page and show validation errors
      print("Please fill out all required fields.");
    }
  }
  

  Widget _buildVendorNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Vendor Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        TextField(
          controller: _vendorNameController,
          keyboardType: TextInputType.name,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 59, 105),
            fontFamily: 'OpenSans',
          ),
          onChanged: (text) {
            // If there was an error but user is typing, clear the error
            if (!_isVendorNameValid && text.isNotEmpty) {
              setState(() {
                _isVendorNameValid = true;
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
            hintText: 'Enter Vendor Name',
            hintStyle: kHintTextStyle,
            errorText: _isVendorNameValid ? null : '*Required',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isVendorNameValid ? Colors.grey : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isVendorNameValid ? fbordercolor : Colors.red,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isVendorNameValid ? bordercolor : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactPersonTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Contact Person',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        TextField(
          controller: _contactPersonController,
          keyboardType: TextInputType.name,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 59, 105),
            fontFamily: 'OpenSans',
          ),
          onChanged: (text) {
            // If there was an error but user is typing, clear the error
            if (!_isContactPersonValid && text.isNotEmpty) {
              setState(() {
                _isContactPersonValid = true;
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
            hintText: 'Enter Contact Person Name',
            hintStyle: kHintTextStyle,
            errorText: _isContactPersonValid ? null : '*Required',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isContactPersonValid ? Colors.grey : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isContactPersonValid ? fbordercolor : Colors.red,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isContactPersonValid ? bordercolor : Color.fromARGB(255, 14, 78, 143),
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

  Widget _buildCategoryDropdown() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Category',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      GestureDetector(
        onTap: () {
          setState(() {
            _isCategoryFocused = true; // Set focus when tapped
          });
        },
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: _isCategoryFocused
                  ? fbordercolor
                  : (_isCategoryValid ? bordercolor : Color.fromARGB(255, 190, 36, 25)), // Red for invalid
              width: _isCategoryFocused ? 1.5 : 1.0, // Thicker border on focus
            ),
          ),
          height: 50.0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.category,
                  color: Color.fromARGB(255, 100, 100, 100),
                  size: 22.0,
                ),
              ),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedCategory,
                    hint: Text(
                      'Select Category',
                      style: kHintTextStyle,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue;
                        _isCategoryFocused = false; // Remove focus on selection
                        _isCategoryValid = _selectedCategory != null; // Validate if a selection is made
                      });
                    },
                    onTap: () {
                      setState(() {
                        _isCategoryFocused = true; // Set focus when dropdown is opened
                      });
                    },
                    items: _categories.map<DropdownMenuItem<String>>((String value) {
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
      if (!_isCategoryValid)
        Padding(
          padding: const EdgeInsets.only(left: 0, top: 5.0),
          child: Text(
            '*Required',
            style: TextStyle(color: Color.fromARGB(255, 190, 36, 25), fontSize: 12.0),
          ),
        ),
    ],
  );
}

  Widget _buildDescriptionTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Description',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Stack(
          children: [
            Container(
              alignment: Alignment.topRight,
              decoration: kBoxDecorationStyle,
              height: 150.0,
              child: TextFormField(
                controller: _descriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: kInputLabelStyle,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(14.0),
                  hintText: 'Write a summary and any details your \ninvitee should know about the event...',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: 150.0,  // Set width
          height: 75.0,  // Set height
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
                          'Vendor Details',
                          style: TextStyle(
                            color: Color.fromARGB(255, 85, 85, 85),
                            fontFamily: 'OpenSans',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Please Add the Vendor Details',
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
                            _buildVendorNameTF(),
                            SizedBox(height: 20.0),
                            _buildContactPersonTF(),
                            SizedBox(height: 20.0),
                            _buildContactTF(),
                            SizedBox(height: 20.0),
                            _buildEmailTF(),
                            SizedBox(height: 20.0),
                            _buildAddressTF(),
                            SizedBox(height: 20.0),
                            _buildCategoryDropdown(), // Added dropdown
                            SizedBox(height: 20.0),
                            _buildDescriptionTF(),
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
