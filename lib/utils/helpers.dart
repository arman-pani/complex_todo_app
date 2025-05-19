import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDateTimetoString(DateTime dateTime) {
  return DateFormat('d MMM').format(dateTime);
}

String formatTimeOfDayToString(TimeOfDay time) {
  final now = DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
  return DateFormat('h a').format(dt);
}

String formatTaskDateTime(DateTime date, TimeOfDay time) {
  final now = DateTime.now();
  final taskDate = DateTime(date.year, date.month, date.day);
  final today = DateTime(now.year, now.month, now.day);
  final tomorrow = today.add(Duration(days: 1));

  String dayLabel;
  if (taskDate == today) {
    dayLabel = 'Today';
  } else if (taskDate == tomorrow) {
    dayLabel = 'Tomorrow';
  } else {
    dayLabel = DateFormat('d MMM').format(taskDate);
  }

  final formattedTime = time.minute.toString().padLeft(2, '0');
  return '$dayLabel at ${time.hour}:${formattedTime}';
}
