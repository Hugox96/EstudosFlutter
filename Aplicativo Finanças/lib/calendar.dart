import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController calendarController = CalendarController();

  @override
  void dispose(){
    calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: TableCalendar(
        calendarController: calendarController,
      ),
    );
  }
}