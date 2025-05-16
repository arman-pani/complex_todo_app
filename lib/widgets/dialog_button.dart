import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';

class DialogButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isTransparent;
  const DialogButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isTransparent = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,

      style: TextButton.styleFrom(
        maximumSize: Size.fromHeight(50),
        backgroundColor: isTransparent
            ? Colors.transparent
            : ColorConstants.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Text(
        label,
        style: TextstyleConstants.buttonText.copyWith(
          color: isTransparent ? ColorConstants.purple : Colors.white,
        ),
      ),
    );
  }
}
