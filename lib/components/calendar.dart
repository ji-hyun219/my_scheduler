import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final DateTime selectedDay;
  final DateTime focusedDay;
  final OnDaySelected onDaySelected;
  Calendar({
    Key? key,
    required this.selectedDay,
    required this.focusedDay,
    required this.onDaySelected,
  }) : super(key: key);

  final BoxDecoration rectangleDecoration = BoxDecoration(
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(12),
  );

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: focusedDay,
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      onDaySelected: onDaySelected,
      selectedDayPredicate: (DateTime day) {
        return day.year == selectedDay.year &&
            selectedDay.month == day.month &&
            selectedDay.day == day.day;
      },
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        weekendTextStyle: const TextStyle().copyWith(color: Colors.red),
        defaultDecoration: rectangleDecoration,
        weekendDecoration: rectangleDecoration,
        selectedDecoration: rectangleDecoration.copyWith(
          color: const Color.fromARGB(164, 172, 192, 92),
        ),
        outsideDecoration: rectangleDecoration,
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          if (day.weekday == DateTime.saturday) {
            final saturdayText = day.day.toString();

            return Center(
              child: Text(
                saturdayText,
                style: const TextStyle(color: Colors.blue),
              ),
            );
          }
          return null;
        },
        dowBuilder: (context, day) {
          if (day.weekday == DateTime.sunday) {
            final sundayText = DateFormat.E().format(day);

            return Center(
              child: Text(
                sundayText,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (day.weekday == DateTime.saturday) {
            final saturdayText = DateFormat.E().format(day);

            return Center(
              child: Text(
                saturdayText,
                style: const TextStyle(color: Colors.blue),
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
