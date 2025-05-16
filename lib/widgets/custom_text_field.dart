import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.isPassword = false,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    isVisible = !widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: TextstyleConstants.buttonText),
        SizedBox(height: 5),
        TextField(
          cursorColor: Colors.white,
          controller: widget.controller,
          obscureText: widget.isPassword ? isVisible : false,
          style: TextstyleConstants.hintText.copyWith(color: Colors.white),
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : SizedBox(),
            hintText: widget.hintText,
            fillColor: ColorConstants.black1,
            hintStyle: TextstyleConstants.hintText,
            contentPadding: EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: ColorConstants.grey1, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.white, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
