import 'package:ems/constants/colors.dart';
import 'package:ems/constants/styles.dart';
import 'package:ems/view/Dashboard/dashboard.dart';
import 'package:ems/view/Navigation_Drawer/sp_navigation_drawer.dart';
import 'package:ems/view/Super_Admin/background_shapes_painter_2.dart';
import 'package:ems/view/Super_Admin/subscription_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Subscription_plan_form extends StatefulWidget {
  const Subscription_plan_form({super.key, required String title});

  @override
  State<Subscription_plan_form> createState() => _Subscription_plan_formState();
}

class _Subscription_plan_formState extends State<Subscription_plan_form> {
  final TextEditingController _subscriptionTypeController = TextEditingController();
  final TextEditingController _subscriptionDetailController = TextEditingController();
  

  void _clearForm() {
    _subscriptionTypeController.clear();
    _subscriptionDetailController.clear();
    setState(() {
      _selectedDesignation = null;
      _selectedCostType = null;
    });
  }

  String? _selectedDesignation;
  String? _selectedCostType;

  final List<String> _designationOptions = ['Monthly', 'Quarterly', 'Yearly'];
  final List<String> _costTypeOptions = ['Eventwise', 'Fixed'];

  bool _isFormValid() {
    return _isSubTypeValid && _isPaymentTypeValid && _isCostTypeValid; 
    // Add other field validations as required
  }

  bool _isSubTypeValid = true; // Flag to track validation
  bool _isPaymentTypeValid = true; // Add this variable to track validation
  bool _isCostTypeValid = true; // Add this variable to track validation

  FocusNode _subscriptionDetailFocusNode = FocusNode();
  bool _isTyping = false; // Track if the user is typing

  void _validateForm() {
    setState(() {
      _isSubTypeValid = _subscriptionTypeController.text.isNotEmpty;
      _isPaymentTypeValid = _selectedDesignation != null;
      _isCostTypeValid = _selectedCostType != null;
    });

    if (_isFormValid()) {
      // If form is valid, navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Subscription_plan(title: 'Subscription Plan',)), // Replace with your target page
      );
    } else {
      // Stay on the same page and show validation errors
      print("Please fill out all required fields.");
    }
  }

  final FocusNode _paymentTypeFocusNode = FocusNode();
  bool _isPaymentTypeFocused = false;

  final FocusNode _costTypeFocusNode = FocusNode();
  bool _isCostTypeFocused = false;

  @override
  void initState() {
    super.initState();

    // Add listener to update focus state when the dropdown focus changes
    _paymentTypeFocusNode.addListener(() {
      setState(() {
        _isPaymentTypeFocused = _paymentTypeFocusNode.hasFocus;
      });
    });
    
    // Listen for focus changes
    _subscriptionDetailFocusNode.addListener(() {
      setState(() {
        _isTyping = _subscriptionDetailFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _paymentTypeFocusNode.dispose(); // Dispose of the focus node when done
    super.dispose();

    // Dispose the FocusNode when done
    _subscriptionDetailFocusNode.dispose();
    super.dispose();
  }

  Widget _buildSubscriptionTypeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Subscription Type',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        TextField(
          controller: _subscriptionTypeController,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 59, 105),
            fontFamily: 'OpenSans',
          ),
          onChanged: (text) {
            // If there was an error but user is typing, clear the error
            if (!_isSubTypeValid && text.isNotEmpty) {
              setState(() {
                _isSubTypeValid = true;
              });
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 12.0),
            prefixIcon: Icon(
              Icons.business,
              color: Color.fromARGB(255, 100, 100, 100),
              size: 22.0,
            ),
            hintText: 'Enter Subscription Type',
            hintStyle: kHintTextStyle,
            errorText: _isSubTypeValid ? null : '*Required',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isSubTypeValid ? Colors.grey : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isSubTypeValid ? fbordercolor : Colors.red,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isSubTypeValid ? bordercolor : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentTypeDropdown() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Payment Type',
        style: kLabelStyle,
      ),
      SizedBox(height: 5.0),
      GestureDetector(
        onTap: () {
          setState(() {
            _isPaymentTypeFocused = true; // Set focus when tapped
          });
        },
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white, // Assuming a white background for the box
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: _isPaymentTypeFocused ? fbordercolor : (_isPaymentTypeValid ? bordercolor : Color.fromARGB(255, 190, 36, 25)), // Blue when focused, red when invalid
              width: _isPaymentTypeFocused ? 1.5 : 1.0, // Thicker border when focused
            ),
          ),
          height: 50.0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.payment,
                  color: Color.fromARGB(255, 100, 100, 100),
                  size: 22.0,
                ),
              ),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedDesignation,
                    hint: Text(
                      'Select Payment Type',
                      style: kHintTextStyle,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedDesignation = newValue;
                        _isPaymentTypeFocused = false; // Remove focus on selection
                        _isPaymentTypeValid = _selectedDesignation != null; // Clear error if a selection is made
                      });
                    },
                    onTap: () {
                      setState(() {
                        _isPaymentTypeFocused = true; // Set focus when dropdown is opened
                      });
                    },
                    items: _designationOptions.map<DropdownMenuItem<String>>((String value) {
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
      if (!_isPaymentTypeValid)
        Padding(
          padding: const EdgeInsets.only(left: 0, top: 5.0), // Align horizontally with "Payment Type"
          child: Text(
            '*Required',
            style: TextStyle(color: Color.fromARGB(255, 190, 36, 25), fontSize: 12.0),
          ),
        ),
    ],
  );
}


  Widget _buildCostTypeDropdown() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Cost Type',
        style: kLabelStyle,
      ),
      SizedBox(height: 5.0),
      GestureDetector(
        onTap: () {
          setState(() {
            _isCostTypeFocused = true; // Set focus when tapped
          });
        },
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: _isCostTypeFocused ? fbordercolor : (_isCostTypeValid ? bordercolor : Color.fromARGB(255, 190, 36, 25)),
              width: _isCostTypeFocused ? 1.5 : 1.0,
            ),
          ),
          height: 50.0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.monetization_on,
                  color: Color.fromARGB(255, 100, 100, 100),
                  size: 22.0,
                ),
              ),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedCostType,
                    hint: Text(
                      'Select Cost Type',
                      style: kHintTextStyle,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCostType = newValue;
                        _isCostTypeFocused = false; // Remove focus on selection
                        _isCostTypeValid = _selectedCostType != null; // Validate if a selection is made
                      });
                    },
                    onTap: () {
                      setState(() {
                        _isCostTypeFocused = true; // Set focus when dropdown is opened
                      });
                    },
                    items: _costTypeOptions.map<DropdownMenuItem<String>>((String value) {
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
      if (!_isCostTypeValid)
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



  Widget _buildSubscriptionDetailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Subscription Details',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        Stack(
          children: [
            Container(
              alignment: Alignment.topRight,
              decoration: kBoxDecorationStyle.copyWith(
                // Set border width to 1.5 when focused or typing
                border: Border.all(
                  color: _isTyping ? fbordercolor : bordercolor, // Change color when typing/focused
                  width: _isTyping ? 1.5 : 1.0, // Width 1.5 when typing or focused
                ),
              ),
              height: 150.0,
              child: TextFormField(
                controller: _subscriptionDetailController,
                focusNode: _subscriptionDetailFocusNode, // Assign FocusNode
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: kInputLabelStyle,
                onChanged: (text) {
                  setState(() {
                    _isTyping = text.isNotEmpty; // Set to true if user is typing
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(14.0),
                  hintText: 'Write a summary and any details about the \nsubscription...',
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
                _validateForm();
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
                          'Subscription Details',
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
                        'Please Add the Subscription Details',
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
                            _buildSubscriptionTypeTF(),
                            SizedBox(height: 20.0),
                            _buildPaymentTypeDropdown(),
                            SizedBox(height: 20.0),
                            _buildCostTypeDropdown(),  // Added Cost Type Dropdown
                            SizedBox(height: 20.0),
                            _buildSubscriptionDetailTF(),
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
