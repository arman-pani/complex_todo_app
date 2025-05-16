import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/constants/theme_constants.dart';

class CustomTextButton2 extends StatelessWidget {
  final String label;
  final String? iconPath;
  final VoidCallback onPressed;
  final Color borderColor;
  final bool isBlack;
  const CustomTextButton2({
    super.key,
    required this.label,
    required this.onPressed,
    this.iconPath,
    this.isBlack = false,
    this.borderColor = ColorConstants.purple,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,

      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        foregroundColor: Colors.white,
        backgroundColor: isBlack ? Colors.black : ColorConstants.purple,
        side: BorderSide(color: borderColor, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconPath != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(iconPath!),
                )
              : SizedBox(),
          Text(label, style: TextstyleConstants.buttonText),
        ],
      ),
    );
  }
}
