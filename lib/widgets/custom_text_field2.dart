import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';

class CustomTextField2 extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField2({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      controller: controller,
      style: TextstyleConstants.hintText.copyWith(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: ColorConstants.black1,
        hintStyle: TextstyleConstants.addTaskHintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: ColorConstants.grey1, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: ColorConstants.grey1, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1),
        ),
      ),
    );
  }
}
