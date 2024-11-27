import 'package:ems/constants/colors.dart';
import 'package:ems/constants/styles.dart';
import 'package:intl/intl.dart';
import 'package:ems/view/Navigation_Drawer/user_navigation_drawer.dart';
import 'package:ems/view/Users/background_shapes_painter_2.dart';
import 'package:ems/view/Users/manage_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Manage_event_form extends StatefulWidget {
  const Manage_event_form({super.key, required String title});

  @override
  State<Manage_event_form> createState() => _Manage_event_formState();
}

class _Manage_event_formState extends State<Manage_event_form> {
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();

  String? _selectedStatus; // Changed to nullable
  
  final List<String> _statusOptions = ['Confirmed', 'Scheduleed', 'Planned', 'Pending', 'Draft', 'Completed'];

  void _clearForm() {
    _eventNameController.clear();
    _descriptionController.clear();
    _dateController.clear();
    _startTimeController.clear();
    _endTimeController.clear();
    _streetController.clear();
    _categoryController.clear();
    _statusController.clear();
    _budgetController.clear();

    // Clear the date and time selections
    setState(() {
      _selectedStartTime = null;
      _selectedEndTime = null;
      _selectedStatus = null; // Clear the status
      _selectedState = null;
      _selectedCity = null;
    });
  }

  String? _selectedState;
  String? _selectedCity;
  final Map<String, List<String>> _stateCityMap = {
    'Maharashtra': ['Mumbai', 'Pune', 'Thane'],
    'Karnataka': ['Bengaluru', 'Mangaluru', 'Ballari'],
    'Kerala': ['Kannur', 'Kottayam', 'Kollam'],
  };

  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime;

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
  final DateTime now = DateTime.now();
  final DateTime today = DateTime(now.year, now.month, now.day); // Stripping time
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: today, // Default to today
    firstDate: today,   // Disable previous dates
    lastDate: DateTime(2100), // Arbitrary future limit
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: Color.fromARGB(255, 105, 59, 105), // Header color
          hintColor: Color.fromARGB(255, 100, 100, 100), // Highlight color
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary, // Button colors
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickedDate != null && pickedDate != _selectedDate) {
    setState(() {
      _selectedDate = pickedDate;
      _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      _isDateValid = true; // Clear error if a valid date is selected
    });
  }
}


  bool _isFormValid() {
    return _isEventNameValid && _isDateValid && _isStartTimeValid && _isEndTimeValid && _isStateValid && _isCityValid && _isStreetValid && _isCategoryValid && _isStatusValid && _isBudgetValid && _isEndTimeInvalid; 
   // Add other field validations as required
  }

  bool _isEventNameValid = true; // Flag to track validation
  bool _isDateValid = true;
  bool _isStartTimeValid = true;
  bool _isEndTimeValid = true;
  bool _isStateValid = true;
  bool _isCityValid = true;
  bool _isStreetValid = true;
  bool _isCategoryValid = true;
  bool _isStatusValid = true;
  bool _isBudgetValid = true;

  bool _isStateFocused = false; // Tracks whether the dropdown is focused
  bool _isEndTimeInvalid = true;
  bool _isFormSubmitted = true;

  void _validateForm() {
    setState(() {
      _isEventNameValid = _eventNameController.text.isNotEmpty;
      _isDateValid = _dateController.text.isNotEmpty;
      _isStartTimeValid = _selectedStartTime != null;
      _isEndTimeValid = _selectedEndTime != null;
      _isStateValid = _selectedState != null;
      _isCityValid = _selectedState == null || _selectedCity != null;
      _isStreetValid = _streetController.text.isNotEmpty;
      _isCategoryValid = _categoryController.text.isNotEmpty;
      _isStatusValid = _selectedStatus != null;
      _isBudgetValid = _budgetController.text.isNotEmpty;
      _isEndTimeInvalid = _selectedEndTime != null;
      _isFormSubmitted = true;
    });

    if (_isEndTimeInvalid && !_isStartTimeValid && !_isEndTimeValid) {
      return; // Stop further execution if validation fails
    }

    // Proceed with saving logic here
    // For example, you can call a function to save the event
    print('Event saved successfully');

    if (_isFormValid()) {
      // If form is valid, navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Manage_event(title: 'Manage Events',)), // Replace with your target page
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

  Widget _buildDescriptionTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Event Description',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        Stack(
          children: [
            Container(
              alignment: Alignment.topLeft,
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
                  hintText: 'Write a description and any details about the \ncategory...',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
          ],
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

  Widget _buildStartEndTimeTF() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Start Time Field
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Start Time',
              style: kLabelStyle,
            ),
            SizedBox(height: 5.0),
            GestureDetector(
              onTap: () => _selectStartTime(context),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: _isStartTimeValid
                        ? bordercolor
                        : Color.fromARGB(255, 190, 36, 25), // Red border if invalid
                    width: 1.0,
                  ),
                ),
                height: 50.0,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Icon(
                        Icons.access_time,
                        color: Color.fromARGB(255, 100, 100, 100),
                      ),
                    ),
                    Text(
                      _selectedStartTime == null
                          ? 'Start Time'
                          : _selectedStartTime!.format(context),
                      style: kHintTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5.0),
            if (!_isStartTimeValid && _isFormSubmitted)
              Text(
                '*Required',
                style: TextStyle(
                  color: Color.fromARGB(255, 190, 36, 25),
                  fontSize: 12.0,
                ),
              ),
          ],
        ),
      ),
      SizedBox(width: 10.0),
      // End Time Field
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'End Time',
              style: kLabelStyle,
            ),
            SizedBox(height: 5.0),
            GestureDetector(
              onTap: () => _selectEndTime(context),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: _isEndTimeValid
                        ? bordercolor
                        : Color.fromARGB(255, 190, 36, 25), // Red border if invalid
                    width: 1.0,
                  ),
                ),
                height: 50.0,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Icon(
                        Icons.access_time,
                        color: Color.fromARGB(255, 100, 100, 100),
                      ),
                    ),
                    Text(
                      _selectedEndTime == null
                          ? 'End Time'
                          : _selectedEndTime!.format(context),
                      style: kHintTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5.0),
            if (!_isEndTimeValid && _isFormSubmitted)
              Text(
                '*Required',
                style: TextStyle(
                  color: Color.fromARGB(255, 190, 36, 25),
                  fontSize: 12.0,
                ),
              ),
            if (_isEndTimeInvalid && _selectedStartTime != null && _selectedEndTime != null)
              Text(
                '*End Time must be later than Start Time',
                style: TextStyle(
                  color: Color.fromARGB(255, 190, 36, 25),
                  fontSize: 12.0,
                ),
              ),
          ],
        ),
      ),
    ],
  );
}

Future<void> _selectStartTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (picked != null) {
    setState(() {
      _selectedStartTime = picked;
      _isStartTimeValid = true; // Mark as valid when a time is selected
      _checkEndTime(); // Revalidate the end time
    });
  }
}

Future<void> _selectEndTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (picked != null) {
    setState(() {
      _selectedEndTime = picked;
      _isEndTimeValid = true; // Mark as valid when a time is selected
      _checkEndTime(); // Revalidate the end time
    });
  }
}

void _checkEndTime() {
  if (_selectedStartTime != null && _selectedEndTime != null) {
    final startTime = DateTime(0, 1, 1, _selectedStartTime!.hour, _selectedStartTime!.minute);
    final endTime = DateTime(0, 1, 1, _selectedEndTime!.hour, _selectedEndTime!.minute);

    setState(() {
      // Check if end time is the same as or earlier than start time
      _isEndTimeInvalid = endTime.isBefore(startTime) || endTime.isAtSameMomentAs(startTime);
    });
  }
}

bool validateForm() {
  setState(() {
    _isFormSubmitted = true;
    _isStartTimeValid = _selectedStartTime != null;
    _isEndTimeValid = _selectedEndTime != null;
  });
  return !_isEndTimeInvalid && _isStartTimeValid && _isEndTimeValid;
}

void onSavePressed() {
  if (validateForm()) {
    // Save data or navigate
    print('Form is valid, proceed!');
  } else {
    print('Form is invalid, fix errors.');
  }
}



  Widget _buildStateDropdown() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'State',
        style: kLabelStyle,
      ),
      SizedBox(height: 5.0),
      GestureDetector(
        onTap: () {
          setState(() {
            _isStateFocused = true; // Set focus when tapped
          });
        },
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: _isStateFocused
                  ? fbordercolor // Highlight border when focused
                  : (_isStateValid
                      ? bordercolor // Default valid border color
                      : Color.fromARGB(255, 190, 36, 25)), // Error border color
              width: _isStateFocused ? 1.5 : 1.0,
            ),
          ),
          height: 50.0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.location_on,
                  color: Color.fromARGB(255, 100, 100, 100),
                  size: 22.0,
                ),
              ),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedState,
                    hint: Text(
                      'Select State',
                      style: kHintTextStyle,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedState = newValue;
                        _selectedCity = null; // Reset city selection
                        _isStateFocused = false; // Remove focus on selection
                        _isStateValid = _selectedState != null; // Validate selection
                      });
                    },
                    onTap: () {
                      setState(() {
                        _isStateFocused = true; // Set focus when dropdown is opened
                      });
                    },
                    items: _stateCityMap.keys.map<DropdownMenuItem<String>>((String state) {
                      return DropdownMenuItem<String>(
                        value: state,
                        child: Text(
                          state,
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
      if (!_isStateValid)
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


  Widget _buildCityDropdown() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'City',
        style: kLabelStyle,
      ),
      SizedBox(height: 5.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: _selectedState == null ? Colors.grey[200] : Colors.white, // Greyed-out background when disabled
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: (_selectedState != null && !_isCityValid)
                ? Color.fromARGB(255, 190, 36, 25) // Red when invalid
                : bordercolor, // Default border color
            width: 1.0,
          ),
        ),
        height: 50.0,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(
                Icons.location_city,
                color: _selectedState == null
                    ? Colors.grey
                    : Color.fromARGB(255, 100, 100, 100),
                size: 22.0,
              ),
            ),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedCity,
                  hint: Text(
                    'Select City',
                    style: _selectedState == null
                        ? kHintTextStyle.copyWith(color: Colors.grey) // Grey hint when disabled
                        : kHintTextStyle,
                  ),
                  onChanged: _selectedState == null
                      ? null // Disable dropdown if no state is selected
                      : (String? newValue) {
                          setState(() {
                            _selectedCity = newValue;
                            _isCityValid = true; // Clear error when a valid city is selected
                          });
                        },
                  items: _selectedState == null
                      ? [] // Empty list if no state is selected
                      : _stateCityMap[_selectedState!]!.map((String city) {
                          return DropdownMenuItem<String>(
                            value: city,
                            child: Text(
                              city,
                              style: TextStyle(
                                color: Color.fromARGB(255, 105, 59, 105),
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          );
                        }).toList(),
                  isExpanded: true,
                  icon: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [
                          _selectedState == null
                              ? Colors.grey
                              : Color.fromARGB(255, 105, 59, 105),
                          _selectedState == null
                              ? Colors.grey
                              : Color.fromARGB(255, 100, 100, 100),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(bounds);
                    },
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 22.0,
                      color: Colors.white, // Needed for ShaderMask to work
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      if (_selectedState != null && !_isCityValid)
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
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




  Widget _buildStreetTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Street',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        TextField(
          controller: _streetController,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 59, 105),
            fontFamily: 'OpenSans',
          ),
          onChanged: (text) {
            // If there was an error but user is typing, clear the error
            if (!_isStreetValid && text.isNotEmpty) {
              setState(() {
                _isStreetValid = true;
              });
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 12.0),
            prefixIcon: Icon(
              Icons.streetview,
              color: Color.fromARGB(255, 100, 100, 100),
              size: 22.0,
            ),
            hintText: 'Enter Street',
            hintStyle: kHintTextStyle,
            errorText: _isStreetValid ? null : '*Required',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isStreetValid ? Colors.grey : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isStreetValid ? fbordercolor : Colors.red,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isStreetValid ? bordercolor : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildStateDropdown(),
        SizedBox(height: 20.0),
        _buildCityDropdown(),
        SizedBox(height: 20.0),
        _buildStreetTF(),
      ],
    );
  }

  Widget _buildCategoryTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Category',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        TextField(
          controller: _categoryController,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 59, 105),
            fontFamily: 'OpenSans',
          ),
          onChanged: (text) {
            // If there was an error but user is typing, clear the error
            if (!_isCategoryValid && text.isNotEmpty) {
              setState(() {
                _isCategoryValid = true;
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
            hintText: 'Enter Category',
            hintStyle: kHintTextStyle,
            errorText: _isCategoryValid ? null : '*Required',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isCategoryValid ? Colors.grey : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isCategoryValid ? fbordercolor : Colors.red,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isCategoryValid ? bordercolor : Color.fromARGB(255, 14, 78, 143),
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

  Widget _buildBudgetTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Budget',
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        TextField(
          controller: _budgetController,
          keyboardType: TextInputType.number,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 59, 105),
            fontFamily: 'OpenSans',
          ),
          onChanged: (text) {
            // If there was an error but user is typing, clear the error
            if (!_isBudgetValid && text.isNotEmpty) {
              setState(() {
                _isBudgetValid = true;
              });
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 12.0),
            prefixIcon: Icon(
              Icons.currency_rupee,
              color: Color.fromARGB(255, 100, 100, 100),
              size: 22.0,
            ),
            hintText: 'Enter Budget',
            hintStyle: kHintTextStyle,
            errorText: _isBudgetValid ? null : '*Required',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isBudgetValid ? Colors.grey : Color.fromARGB(255, 14, 78, 143),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isBudgetValid ? fbordercolor : Colors.red,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isBudgetValid ? bordercolor : Color.fromARGB(255, 14, 78, 143),
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
      drawer: User_navigation_drawer(title: 'Navigation Drawer'),
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
                            _buildDescriptionTF(),
                            SizedBox(height: 20.0),
                            _buildDateTF(),
                            SizedBox(height: 20.0),
                            _buildStartEndTimeTF(),
                            SizedBox(height: 20.0),
                            _buildLocationTF(),
                            SizedBox(height: 20.0),
                            _buildCategoryTF(),
                            SizedBox(height: 20.0),
                            _buildStatusTF(),
                            SizedBox(height: 20.0),
                            _buildBudgetTF(),
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
