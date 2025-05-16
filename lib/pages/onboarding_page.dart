import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/app_router_constants.dart';
import 'package:todo_app/constants/image_constants.dart';
import 'package:todo_app/constants/string_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/widgets/custom_text_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentTabIndex = 0;

  List<String> onboardingImages = [
    ImageConstants.onboarding1,
    ImageConstants.onboarding2,
    ImageConstants.onboarding3,
  ];

  List<String> onboardingTitles = [
    StringConstants.onboardingTitle1,
    StringConstants.onboardingTitle2,
    StringConstants.onboardingTitle3,
  ];

  List<String> onboardingSubTitles = [
    StringConstants.onboardingSubTitle1,
    StringConstants.onboardingSubTitle2,
    StringConstants.onboardingSubTitle3,
  ];

  void onBackButtonPressed() {
    setState(() {
      currentTabIndex--;
    });
  }

  void onNextButtonPressed() {
    setState(() {
      currentTabIndex++;
    });
  }

  void onGetStartedButtonPressed() {
    context.pushNamed(AppRouterConstants.start);
  }

  void onSkipButtonPressed() {
    context.pushNamed(AppRouterConstants.start);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leadingWidth: 90,
        leading: CustomTextButton(
          label: 'SKIP',
          onPressed: onSkipButtonPressed,
          isBlack: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          children: [
            SvgPicture.asset(
              onboardingImages[currentTabIndex],
              height: 250,
              width: 250,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: List.generate(3, (index) {
                return Container(
                  height: 4,
                  width: 25,
                  decoration: BoxDecoration(
                    color: index == currentTabIndex
                        ? Colors.white
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }),
            ),
            Spacer(),
            Text(
              onboardingTitles[currentTabIndex],
              style: TextstyleConstants.onboardingTitle,
            ),
            Spacer(),
            Text(
              onboardingSubTitles[currentTabIndex],
              style: TextstyleConstants.onboardingSubTitle,
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentTabIndex != 0
                    ? CustomTextButton(
                        label: 'BACK',
                        onPressed: onBackButtonPressed,
                        isBlack: true,
                      )
                    : const SizedBox(),
                CustomTextButton(
                  label: currentTabIndex == 2 ? 'GET STARTED' : 'NEXT',
                  onPressed: currentTabIndex == 2
                      ? onGetStartedButtonPressed
                      : onNextButtonPressed,
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
