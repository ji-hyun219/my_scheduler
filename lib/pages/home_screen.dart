import 'package:flutter/material.dart';
import 'package:my_scheduler/components/calendar.dart';
import 'package:my_scheduler/components/schedule_card.dart';
import 'package:my_scheduler/components/today_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime focusedDay = DateTime.now();
  int scheduleCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Calendar(
                selectedDay: selectedDay,
                focusedDay: focusedDay,
                onDaySelected: onDaySelected,
              ),
              const SizedBox(height: 15),
              TodayBanner(
                selectedDay: selectedDay,
                scheduleCount: scheduleCount,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                    separatorBuilder: ((context, index) {
                      return const SizedBox(height: 8);
                    }),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ScheduleCard(
                        startTime: 8,
                        endTime: 9,
                        content: '프로그래밍 공부하기',
                        color: Colors.red,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }
}
