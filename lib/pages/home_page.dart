import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/constants/image_constants.dart';
import 'package:todo_app/constants/string_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(flex: 5),
        SvgPicture.asset(
          ImageConstants.homePlaceholder,
          height: 250,
          width: 250,
        ),
        Spacer(flex: 2),
        Text(
          StringConstants.homePlaceHolderTitle,
          style: TextstyleConstants.homePlaceHolderTitle,
        ),
        Spacer(flex: 1),
        Text(
          StringConstants.homePlaceHolderSubTitle,
          style: TextstyleConstants.onboardingSubTitle,
        ),
        Spacer(flex: 12),
      ],
    );
  }
}
