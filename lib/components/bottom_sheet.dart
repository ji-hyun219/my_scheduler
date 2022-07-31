import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatelessWidget {
  const ScheduleBottomSheet({
    Key? key,
    required this.context,
    required this.bottomSheet,
  }) : super(key: key);

  final BuildContext context;
  final double bottomSheet;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2 + bottomSheet,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomSheet),
        child: Column(
          children: const [
            TextField(),
          ],
        ),
      ),
    );
  }
}
