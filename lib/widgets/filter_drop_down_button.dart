import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';

class FilterDropDownButton extends StatelessWidget {
  const FilterDropDownButton({super.key});

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
          Text('Today', style: TextstyleConstants.underText),
          Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white),
        ],
      ),
    );
  }
}
