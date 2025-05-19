import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 4)
class CategoryModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int iconCodePoint; // Store codePoint instead of IconData

  @HiveField(2)
  final int colorValue; // Store color as int

  CategoryModel({
    required this.name,
    required this.iconCodePoint,
    required this.colorValue,
  });

  IconData get icon => IconData(iconCodePoint, fontFamily: 'MaterialIcons');
  Color get color => Color(colorValue);
}

final List<CategoryModel> initialCategories = [
  CategoryModel(
    name: 'Grocery',
    iconCodePoint: Icons.local_grocery_store.codePoint,
    colorValue: Colors.lightGreenAccent.value,
  ),
  CategoryModel(
    name: 'Work',
    iconCodePoint: Icons.work.codePoint,
    colorValue: Colors.orangeAccent.value,
  ),
  CategoryModel(
    name: 'Sport',
    iconCodePoint: Icons.fitness_center.codePoint,
    colorValue: Colors.cyanAccent.value,
  ),
  CategoryModel(
    name: 'Design',
    iconCodePoint: Icons.gamepad.codePoint,
    colorValue: Colors.tealAccent.value,
  ),
  CategoryModel(
    name: 'University',
    iconCodePoint: Icons.school.codePoint,
    colorValue: Colors.indigoAccent.value,
  ),
  CategoryModel(
    name: 'Social',
    iconCodePoint: Icons.campaign.codePoint,
    colorValue: Colors.pinkAccent.value,
  ),
  CategoryModel(
    name: 'Music',
    iconCodePoint: Icons.music_note.codePoint,
    colorValue: Colors.deepPurpleAccent.value,
  ),
  CategoryModel(
    name: 'Health',
    iconCodePoint: Icons.favorite.codePoint,
    colorValue: Colors.lightGreen.value,
  ),
  CategoryModel(
    name: 'Movie',
    iconCodePoint: Icons.videocam.codePoint,
    colorValue: Colors.lightBlueAccent.value,
  ),
  CategoryModel(
    name: 'Home',
    iconCodePoint: Icons.home.codePoint,
    colorValue: Colors.amberAccent.value,
  ),
];
