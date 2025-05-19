import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      style: TextstyleConstants.hintText.copyWith(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Search for your task...',
        prefixIcon: Icon(
          Icons.search_rounded,
          color: ColorConstants.hintTextColor2,
        ),
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
      ),
    );
  }
}
