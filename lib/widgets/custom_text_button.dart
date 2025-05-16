import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isBlack;
  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isBlack = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        foregroundColor: isBlack ? Colors.grey : Colors.white,
        backgroundColor: isBlack ? Colors.black : ColorConstants.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Text(label, style: TextstyleConstants.buttonText),
    );
  }
}
