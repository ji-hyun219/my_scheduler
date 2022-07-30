import 'package:flutter/material.dart';
import 'package:my_scheduler/components/calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: Center(child: Calendar())));
  }
}
