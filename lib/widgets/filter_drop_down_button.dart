import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';

class FilterDropDownButton extends StatelessWidget {
  final String label;
  const FilterDropDownButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: ColorConstants.hintTextColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Text(label, style: TextstyleConstants.underText),
          Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white),
        ],
      ),
    );
  }
}
