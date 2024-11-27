import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late Map<DateTime, List<String>> _events;
  DateTime _selectedMonth = DateTime.now();

  @override
  void initState() {
    super.initState();
    _events = _loadEvents();
  }

  Map<DateTime, List<String>> _loadEvents() {
    return {
      DateTime(2024, 8, 10): ['Event 1'],
      DateTime(2024, 8, 15): ['Event 2'],
      DateTime(2024, 8, 20): ['Event 3'],
      DateTime(2023, 12, 25): ['Holiday Party'],
      DateTime(2023, 12, 31): ['New Year\'s Eve'],
      // Add more events here
    };
  }

  List<String> _getEventsForDay(DateTime day) {
    final normalizedDay = DateTime(day.year, day.month, day.day);
    return _events[normalizedDay] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: TableCalendar(
            focusedDay: _selectedMonth,
            firstDay: DateTime.utc(2000, 1, 1), // Adjust start year as needed
            lastDay: DateTime.utc(2100, 12, 31), // Adjust end year as needed
            calendarFormat: CalendarFormat.month,
            eventLoader: _getEventsForDay,
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (events.isNotEmpty) {
                  return Positioned(
                    bottom: 4,
                    right: 4,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                }
                return SizedBox();
              },
              defaultBuilder: (context, day, focusedDay) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    '${day.day}',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedMonth = DateTime(selectedDay.year, selectedDay.month, 1);
              });
              final events = _getEventsForDay(selectedDay);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Events on ${selectedDay.toLocal()}'),
                    content: events.isEmpty
                        ? Text('No events for this day.')
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: events.map((event) => Text(event)).toList(),
                          ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.blueAccent),
              weekendStyle: TextStyle(color: Colors.redAccent),
            ),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _showYearSelectionDialog,
          child: Text('Select Year'),
        ),
      ],
    );
  }

  void _showYearSelectionDialog() {
    int startYear = 2000; // Adjust the start year as needed
    int endYear = DateTime.now().year + 10; // Show future years up to 10 years ahead

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Year'),
          content: SizedBox(
            height: 300, // Adjust height as needed
            width: 300,
            child: ListView.builder(
              itemCount: (endYear - startYear + 1), // Calculate number of years
              itemBuilder: (context, index) {
                final year = startYear + index;
                return ListTile(
                  title: Text(year.toString()),
                  onTap: () {
                    Navigator.of(context).pop();
                    setState(() {
                      _selectedMonth = DateTime(year, _selectedMonth.month, 1);
                    });
                  },
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
