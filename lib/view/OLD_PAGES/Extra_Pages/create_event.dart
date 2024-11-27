import 'package:ems/constants/styles.dart';
import 'package:ems/view/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key, required String title});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> with SingleTickerProviderStateMixin {
  DateTime? _selectedDate;
  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime;
  String? _selectedLocation;
  
  // List of locations for the drop-down
  final List<String> _locations = [
    'Marine Lines',
    'Colaba',
    'Cherni Road',
    'Mumbai Central',
    'Andheri',
    'Bandra',
  ];

  Widget _buildEventNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Event Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.name,
            style: kInputLabelStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.event_note,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
              hintText: 'Enter your Event Name',
              hintStyle: kHintTextStyle,
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
        Text(
          'Location',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Icon(Icons.location_on, color: Color.fromARGB(255, 100, 100, 100)),
              SizedBox(width: 10),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedLocation,
                    isExpanded: true,
                    dropdownColor: Color(0xFF398AE5),
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    style: kInputLabelStyle,
                    hint: Text(
                      'Select your Event Location',
                      style: kHintTextStyle,
                    ),
                    items: _locations.map((String location) {
                      return DropdownMenuItem<String>(
                        value: location,
                        child: Row(
                          children: <Widget>[
                            Text(location),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLocation = newValue;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEventDateTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Event Date',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Icon(
                    Icons.calendar_month,
                    color: Color.fromARGB(255, 100, 100, 100),
                  ),
                ),
                Text(
                  _selectedDate == null
                      ? 'Select Event Date'
                      : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                  style: kInputLabelStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Widget _buildStartEndTimeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Start Time',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Row(
          children: [
            GestureDetector(
              onTap: () => _selectStartTime(context),
              child: Padding(
                padding: const EdgeInsets.only(right: 9.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: kBoxDecorationStyle,
                  height: 60.0,
                  width: 150.0,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Icon(
                          Icons.access_time,
                          color: Color.fromARGB(255, 100, 100, 100),
                        ),
                      ),
                      Text(
                        _selectedStartTime == null
                            ? 'Start Time'
                            : _selectedStartTime!.format(context),
                        style: kInputLabelStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            GestureDetector(
              onTap: () => _selectEndTime(context),
              child: Padding(
                padding: const EdgeInsets.only(left: 9.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: kBoxDecorationStyle,
                  height: 60.0,
                  width: 150.0,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Icon(
                          Icons.access_time,
                          color: Color.fromARGB(255, 100, 100, 100),
                        ),
                      ),
                      Text(
                        _selectedEndTime == null
                            ? 'End Time'
                            : _selectedEndTime!.format(context),
                        style: kInputLabelStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedStartTime) {
      setState(() {
        _selectedStartTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedEndTime) {
      setState(() {
        _selectedEndTime = picked;
      });
    }
  }

  Widget _buildEventDescTF() {
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
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 150.0,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: kInputLabelStyle,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(14.0),
                ),
              ),
            ),
            Positioned(
              top: 14.0,
              left: 14.0,
              right: 14.0,
              child: IgnorePointer(
                child: Text(
                  'Write a summary and any details your invitee should know about the event...',
                  style: kHintTextStyle.copyWith(fontSize: 17.0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNextBtn() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),  // Reduced padding to decrease space
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
        ),
      ],
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
          'Create Event',
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
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Create Event',
                          style: TextStyle(
                            color: Color.fromARGB(255, 100, 100, 100),
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        _buildEventNameTF(),
                        SizedBox(height: 15.0),
                        _buildLocationTF(),
                        SizedBox(height: 15.0),
                        _buildEventDateTF(),
                        SizedBox(height: 15.0),
                        _buildStartEndTimeTF(),
                        SizedBox(height: 15.0),
                        _buildEventDescTF(),
                        SizedBox(height: 20.0),
                        _buildNextBtn(),
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
