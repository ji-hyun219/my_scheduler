import 'package:flutter/material.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDay;
  final int scheduleCount;
  const TodayBanner({
    Key? key,
    required this.selectedDay,
    required this.scheduleCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: const Color.fromARGB(242, 225, 205, 182),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                '${selectedDay.year}년 ${selectedDay.month}월 ${selectedDay.day}일',
                style: textStyle),
            Text('$scheduleCount개', style: textStyle),
          ],
        ));
  }

  final textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );
}
