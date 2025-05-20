import 'package:flutter/material.dart';
import 'package:todo_app/widgets/application_listview.dart';
import 'package:todo_app/widgets/focus_timer.dart';
import 'package:todo_app/widgets/overview_barchart.dart';

class FocusPage extends StatefulWidget {
  const FocusPage({super.key});

  @override
  State<FocusPage> createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          spacing: 30,
          children: [FocusTimer(), WeeklyBarChart(), ApplicationListview()],
        ),
      ),
    );
  }
}
