import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/models/category_model.dart';
import 'package:uuid/uuid.dart';

part 'task_model.g.dart';

@HiveType(typeId: 5)
class TaskModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final TimeOfDay time;

  @HiveField(5)
  final int priority;

  @HiveField(6)
  final CategoryModel category;

  @HiveField(7)
  final bool isComplete;

  TaskModel({
    String? id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.priority,
    required this.category,
    this.isComplete = false,
  }) : id = id ?? const Uuid().v4();

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? date,
    TimeOfDay? time,
    int? priority,
    CategoryModel? category,
    bool? isComplete,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      time: time ?? this.time,
      priority: priority ?? this.priority,
      category: category ?? this.category,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, description: $description, date: $date, time: $time, priority: $priority, category: $category, isComplete: $isComplete)';
  }
}
