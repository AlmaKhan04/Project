import 'package:ems/constants/colors.dart';
import 'package:ems/constants/styles.dart';
import 'package:ems/view/Dashboard/dashboard.dart';
import 'package:ems/view/Navigation_Drawer/sp_navigation_drawer.dart';
import 'package:ems/view/Super_Admin/background_shapes_painter_2.dart';
import 'package:ems/view/Super_Admin/vendors_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Vendors_category_form extends StatefulWidget {
  const Vendors_category_form({super.key, required String title});

  @override
  State<Vendors_category_form> createState() => _Vendors_category_formState();
}

class _Vendors_category_formState extends State<Vendors_category_form> {
  final TextEditingController _categoryNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _clearForm() {
    _categoryNameController.clear();
    _descriptionController.clear();
  }

  bool _isFormValid() {
    return _isCategoryNameValid; 
   // Add other field validations as required
  }

  bool _isCategoryNameValid = true; // Flag to track validation

  void _validateForm() {
    setState(() {
      _isCategoryNameValid = _categoryNameController.text.isNotEmpty;
    });

    if (_isFormValid()) {
      // If form is valid, navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Vendors_category(title: 'Vendors Category',)), // Replace with your target page
      );
    } else {
      // Stay on the same page and show validation errors
      print("Please fill out all required fields.");
    }
  }

  Widget _buildCategoryNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Category Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        TextField(
          controller: _categoryNameController,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 59, 105),
            fontFamily: 'OpenSans',
          ),
          onChanged: (text) {
            // If there was an error but user is typing, clear the error
            if (!_isCategoryNameValid && text.isNotEmpty) {
              setState(() {
                _isCategoryNameValid = true;
              });
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 12.0),
            prefixIcon: Icon(
              Icons.category,
              color: Color.fromARGB(255, 100, 100, 100),
              size: 22.0,
            ),
            hintText: 'Enter Category Name',
            hintStyle: kHintTextStyle,
            errorText: _isCategoryNameValid ? null : '*Required',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isCategoryNameValid ? Colors.grey : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isCategoryNameValid ? fbordercolor : Colors.red,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isCategoryNameValid ? bordercolor : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
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
                          'Category Details',
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
                        'Please Add the Category Details',
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
                            _buildCategoryNameTF(),
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
