import 'package:flutter/material.dart';

class TaskModel {
  final String title;
  final String description;
  final DateTime date;
  final TimeOfDay time;
  final int priority;
  final String tag;

  TaskModel({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.priority,
    required this.tag,
  });
}
