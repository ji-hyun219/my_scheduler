import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final int startTime;
  final int endTime;
  final String content;
  final Color color;
  const ScheduleCard({
    Key? key,
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(106, 0, 0, 0),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Text('${startTime.toString().padLeft(2, '0')}:00'),
                    Text('${endTime.toString().padLeft(2, '0')}:00'),
                  ],
                ),
                const SizedBox(width: 15),
                Expanded(child: Text(content)),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                  child: const SizedBox(
                    width: 16,
                    height: 16,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
