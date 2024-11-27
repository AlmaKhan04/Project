import 'dart:io';
import 'package:ems/constants/styles.dart';
import 'package:ems/view/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Profile_setup extends StatefulWidget {
  const Profile_setup({super.key, required String title});

  @override
  State<Profile_setup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<Profile_setup> {
  String? _selectedGender;
  File? _imageFile;
  DateTime? _selectedDate;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Widget _buildFirstnameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'First Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Color.fromARGB(255, 100, 100, 100),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
              hintText: 'Enter your First Name',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildLastnameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Last Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Color.fromARGB(255, 100, 100, 100),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
              hintText: 'Enter your Last Name',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContactTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mobile Number',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.phone,
            style: TextStyle(
              color: Color.fromARGB(255, 100, 100, 100),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.phone,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
              hintText: 'Enter your Mobile Number',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDOBTF(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Date of Birth',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onTap: () => _selectDate(context),
            readOnly: true,
            style: TextStyle(
              color: Color.fromARGB(255, 100, 100, 100),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.cake,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
              hintText: _selectedDate == null ? 'Enter your Date of Birth' : _selectedDate!.toLocal().toString().split(' ')[0],
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildGenderTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Gender',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Row(
          children: <Widget>[
            Radio<String>(
              value: 'Male',
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
              activeColor: Color.fromARGB(255, 139, 83, 139),
            ),
            Text(
              'Male',
              style: TextStyle(
                color: Color.fromARGB(255, 100, 100, 100),
                fontFamily: 'OpenSans',
              ),
            ),
            Radio<String>(
              value: 'Female',
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
              activeColor: Color.fromARGB(255, 139, 83, 139),
            ),
            Text(
              'Female',
              style: TextStyle(
                color: Color.fromARGB(255, 100, 100, 100),
                fontFamily: 'OpenSans',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
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
          borderRadius: BorderRadius.circular(30.0),
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
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard(title: 'Profile Setup Page')),
            );
          },
          child: Text(
            'Save',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
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
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Setup Profile',
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
                    vertical: 40.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: Color.fromARGB(255, 100, 100, 100),
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Please setup your profile',
                          style: TextStyle(
                            color: Color.fromARGB(255, 100, 100, 100),
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10.0,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 75,
                            backgroundColor: Color.fromARGB(255, 172, 115, 172).withOpacity(0.4),
                            child: _imageFile == null
                                ? Icon(
                                    Icons.camera_alt,
                                    size: 50,
                                    color: Colors.black.withOpacity(0.5),
                                  )
                                : ClipOval(
                                    child: Image.file(
                                      _imageFile!,
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      _buildFirstnameTF(),
                      SizedBox(height: 30.0),
                      _buildLastnameTF(),
                      SizedBox(height: 30.0),
                      _buildContactTF(),
                      SizedBox(height: 30.0),
                      _buildDOBTF(context),
                      SizedBox(height: 30.0),
                      _buildGenderTF(),
                      SizedBox(height: 10.0),
                      _buildLoginBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
