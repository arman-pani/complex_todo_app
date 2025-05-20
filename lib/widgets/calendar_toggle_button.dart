import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';

class CalendarToggleButton extends StatelessWidget {
  final bool showCompleted;
  final ValueChanged<bool> onToggle;
  const CalendarToggleButton({
    super.key,
    required this.showCompleted,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    bool isCompleted = showCompleted;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: ColorConstants.appBarBgColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => onToggle(false),
              child: toggleButton(
                'Today',
                isCompleted ? Colors.transparent : ColorConstants.purple,
                isCompleted ? Colors.white : ColorConstants.purple,
              ),
            ),
            GestureDetector(
              onTap: () => onToggle(true),
              child: toggleButton(
                'Completed',
                isCompleted ? ColorConstants.purple : Colors.transparent,
                isCompleted ? ColorConstants.purple : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget toggleButton(String label, Color bgColor, Color borderColor) {
    return Container(
      width: 140,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(label, style: TextstyleConstants.buttonText),
    );
  }
}
