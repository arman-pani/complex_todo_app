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
