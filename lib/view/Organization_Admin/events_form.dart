import 'package:ems/constants/colors.dart';
import 'package:ems/constants/styles.dart';
import 'package:ems/view/Dashboard/dashboard.dart';
import 'package:ems/view/Navigation_Drawer/org_navigation_drawer.dart';
import 'package:ems/view/Organization_Admin/background_shapes_painter_2.dart';
import 'package:ems/view/Organization_Admin/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Events_form extends StatefulWidget {
  const Events_form({super.key, required String title});

  @override
  State<Events_form> createState() => _Events_formState();
}

class _Events_formState extends State<Events_form> {
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _selectedStatus; // Changed to nullable

  void _clearForm() {
    _eventNameController.clear();
    _dateController.clear();
    _timeController.clear();
    _locationController.clear();
    _statusController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedStatus = null; // Clear the status
    });
  }

  final List<String> _statusOptions = ['Confirmed', 'Scheduleed', 'Planned', 'Pending', 'Draft', 'Completed'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
        _isDateValid = true; // Reset validation to valid
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _timeController.text = pickedTime.format(context);
        _isTimeValid = true; // Reset validation to valid
      });
    }
  }

  bool _isFormValid() {
    return _isEventNameValid && _isDateValid && _isTimeValid && _isLocationValid && _isStatusValid; 
   // Add other field validations as required
  }

  bool _isEventNameValid = true; // Flag to track validation
  bool _isDateValid = true;
  bool _isTimeValid = true;
  bool _isLocationValid = true;
  bool _isStatusValid = true;

  void _validateForm() {
    setState(() {
      _isEventNameValid = _eventNameController.text.isNotEmpty;
      _isDateValid = _dateController.text.isNotEmpty;
      _isTimeValid = _timeController.text.isNotEmpty;
      _isLocationValid = _locationController.text.isNotEmpty;
      _isStatusValid = _selectedStatus != null;
    });

    if (_isFormValid()) {
      // If form is valid, navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Events(title: 'Events',)), // Replace with your target page
      );
    } else {
      // Stay on the same page and show validation errors
      print("Please fill out all required fields.");
    }
  }

  final FocusNode _statusFocusNode = FocusNode();
  bool _isStatusFocused = false;

  @override
  void initState() {
    super.initState();

    // Add listener to update focus state when the dropdown focus changes
    _statusFocusNode.addListener(() {
      setState(() {
        _isStatusFocused = _statusFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _statusFocusNode.dispose(); // Dispose of the focus node when done
    super.dispose();
  }


  Widget _buildEventNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Event Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        TextField(
          controller: _eventNameController,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 59, 105),
            fontFamily: 'OpenSans',
          ),
          onChanged: (text) {
            // If there was an error but user is typing, clear the error
            if (!_isEventNameValid && text.isNotEmpty) {
              setState(() {
                _isEventNameValid = true;
              });
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 12.0),
            prefixIcon: Icon(
              Icons.event,
              color: Color.fromARGB(255, 100, 100, 100),
              size: 22.0,
            ),
            hintText: 'Enter Event Name',
            hintStyle: kHintTextStyle,
            errorText: _isEventNameValid ? null : '*Required',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isEventNameValid ? Colors.grey : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isEventNameValid ? fbordercolor : Colors.red,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isEventNameValid ? bordercolor : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Date',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        GestureDetector(
          onTap: () async {
            await _selectDate(context);
          },
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: _isDateValid ? bordercolor : Color.fromARGB(255, 190, 36, 25),
                width: 1.0,
              ),
            ),
            height: 50.0,
            child: TextField(
              controller: _dateController,
              enabled: false,
              style: TextStyle(
                color: Color.fromARGB(255, 105, 59, 105),
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 12.0),
                prefixIcon: Icon(
                  Icons.date_range,
                  color: Color.fromARGB(255, 100, 100, 100),
                  size: 22.0,
                ),
                hintText: 'Select Date',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ),
        if (!_isDateValid)
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


  Widget _buildTimeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Time',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        GestureDetector(
          onTap: () async {
            await _selectTime(context);
          },
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: _isTimeValid ? bordercolor : Color.fromARGB(255, 190, 36, 25),
                width: 1.0,
              ),
            ),
            height: 50.0,
            child: TextField(
              controller: _timeController,
              enabled: false,
              style: TextStyle(
                color: Color.fromARGB(255, 105, 59, 105),
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 12.0),
                prefixIcon: Icon(
                  Icons.access_time,
                  color: Color.fromARGB(255, 100, 100, 100),
                  size: 22.0,
                ),
                hintText: 'Select Time',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ),
        if (!_isTimeValid)
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


  Widget _buildLocationTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Location',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        TextField(
          controller: _locationController,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 59, 105),
            fontFamily: 'OpenSans',
          ),
          onChanged: (text) {
            // If there was an error but user is typing, clear the error
            if (!_isLocationValid && text.isNotEmpty) {
              setState(() {
                _isLocationValid = true;
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
            hintText: 'Enter Location',
            hintStyle: kHintTextStyle,
            errorText: _isLocationValid ? null : '*Required',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isLocationValid ? Colors.grey : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isLocationValid ? fbordercolor : Colors.red,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isLocationValid ? bordercolor : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusTF() {
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
              _isStatusFocused = true; // Set focus when tapped
            });
          },
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white, // Assuming a white background for the box
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: _isStatusFocused ? fbordercolor : (_isStatusValid ? bordercolor : Color.fromARGB(255, 190, 36, 25)), // Blue when focused, red when invalid
                width: _isStatusFocused ? 1.5 : 1.0, // Thicker border when focused
              ),
            ),
            height: 50.0,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Icon(
                    Icons.info,
                    color: Color.fromARGB(255, 100, 100, 100),
                    size: 22.0,
                  ),
                ),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedStatus,
                      hint: Text(
                        'Select Payment Type',
                        style: kHintTextStyle,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedStatus = newValue;
                          _isStatusFocused = false; // Remove focus on selection
                          _isStatusValid = _selectedStatus != null; // Clear error if a selection is made
                        });
                      },
                      onTap: () {
                        setState(() {
                          _isStatusFocused = true; // Set focus when dropdown is opened
                        });
                      },
                      items: _statusOptions.map<DropdownMenuItem<String>>((String value) {
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
        if (!_isStatusValid)
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
                  hintText: 'Write a summary and any details your invitee \nshould know about the event...',
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
          width: 150.0,
          height: 75.0,
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
                          'Event Details',
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
                        'Please Add the Event Details',
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
                            _buildEventNameTF(),
                            SizedBox(height: 20.0),
                            _buildDateTF(),
                            SizedBox(height: 20.0),
                            _buildTimeTF(),
                            SizedBox(height: 20.0),
                            _buildLocationTF(),
                            SizedBox(height: 20.0),
                            _buildStatusTF(),
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
