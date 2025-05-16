import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/app_router_constants.dart';
import 'package:todo_app/constants/image_constants.dart';
import 'package:todo_app/constants/string_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/utils/show_snackbar.dart';
import 'package:todo_app/widgets/custom_app_bar.dart';
import 'package:todo_app/widgets/custom_text_button2.dart';
import 'package:todo_app/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onLoginPressed() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    if (username == 'arman' && password == '1234') {
      showSnackBar(context, 'Login Successfully!');
      context.pushNamed(AppRouterConstants.home);
    } else {
      showSnackBar(context, 'Login Failed!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              StringConstants.loginTitle,
              style: TextstyleConstants.onboardingTitle,
            ),
            Spacer(flex: 2),

            CustomTextField(
              controller: usernameController,
              hintText: StringConstants.userNameHint,
              labelText: StringConstants.userNameLabel,
            ),
            Spacer(),

            CustomTextField(
              isPassword: true,
              controller: passwordController,
              hintText: StringConstants.passwordHint,
              labelText: StringConstants.passwordLabel,
            ),
            Spacer(flex: 2),

            CustomTextButton2(
              label: StringConstants.loginTitle,
              onPressed: onLoginPressed,
            ),
            Spacer(),

            OrDivider(),
            Spacer(),

            CustomTextButton2(
              label: StringConstants.loginGoogleButton,
              iconPath: IconConstants.google,
              isBlack: true,
              onPressed: () {},
            ),
            Spacer(),

            CustomTextButton2(
              label: StringConstants.loginAppleButton,
              iconPath: IconConstants.apple,
              isBlack: true,
              onPressed: () {},
            ),
            Spacer(flex: 2),

            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextstyleConstants.underText.copyWith(
                    color: ColorConstants.grey1,
                  ),
                  children: [
                    TextSpan(
                      text: 'Register',
                      style: TextstyleConstants.underText,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Divider(color: ColorConstants.grey1, thickness: 1, height: 20),
        Center(
          child: Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'or',
              style: TextstyleConstants.hintText.copyWith(
                color: ColorConstants.grey1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
