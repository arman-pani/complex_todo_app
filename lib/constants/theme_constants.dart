import 'package:flutter/material.dart';

class TextstyleConstants {
  static const TextStyle onboardingTitle = TextStyle(
    color: Colors.white,
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle homePlaceHolderTitle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle onboardingSubTitle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle buttonText = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle hintText = TextStyle(
    color: ColorConstants.hintTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle underText = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle boldUnderText = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle addTaskHintText = TextStyle(
    color: ColorConstants.hintTextColor2,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle mediumText = TextStyle(
    color: ColorConstants.hintTextColor2,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle smallText = TextStyle(
    color: ColorConstants.grey1,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
}

class ColorConstants {
  static const Color purple = Color(0xFF8875FF);
  static const Color hintTextColor = Color(0xFF535353);
  static const Color grey1 = Color(0xFF979797);
  static const Color black1 = Color(0xFF1D1D1D);
  static const Color appBarBgColor = Color(0xFF363636);
  static const Color hintTextColor2 = Color(0xFFAFAFAF);
  static const Color priority = Color(0xFF272727);
}
