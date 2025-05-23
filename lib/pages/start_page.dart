import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/app_router_constants.dart';
import 'package:todo_app/constants/string_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/widgets/custom_app_bar.dart';
import 'package:todo_app/widgets/custom_text_button2.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onLoginPressed() {
      context.pushNamed(AppRouterConstants.login);
    }

    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Spacer(flex: 2),
            Text(
              StringConstants.startTitle,
              style: TextstyleConstants.onboardingTitle,
            ),
            Spacer(),
            Text(
              StringConstants.startSubTitle,
              style: TextstyleConstants.onboardingSubTitle,
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 10),
            CustomTextButton2(label: 'LOGIN', onPressed: onLoginPressed),
            Spacer(),
            CustomTextButton2(
              label: 'CREATE ACCOUNT',
              isBlack: true,
              onPressed: () => context.pushNamed(AppRouterConstants.register),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
