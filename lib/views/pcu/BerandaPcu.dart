import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BerandaPcu extends StatefulWidget {
  @override
  _BerandaPcuState createState() => _BerandaPcuState();
}

class _BerandaPcuState extends State<BerandaPcu> {
  final _calendarController = CalendarController();
  @override
  Widget build(BuildContext context) {
    final Map<DateTime, List> _holidays = {
      DateTime(2020, 1, 1): ['New Year\'s Day'],
      DateTime(2020, 1, 6): ['Epiphany'],
      DateTime(2020, 2, 14): ['Valentine\'s Day'],
      DateTime(2020, 4, 21): ['Easter Sunday'],
      DateTime(2020, 11, 12): ['Easter Monday'],
    };
    var screen = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TableCalendar(
          calendarController: _calendarController,
          holidays: _holidays,
          calendarStyle: CalendarStyle(
              selectedColor: Color(0xff043795), todayColor: Color(0xff518cfb)),
          headerStyle:
              HeaderStyle(formatButtonVisible: false, centerHeaderTitle: true),
        ),
      ],
    );
  }
}
