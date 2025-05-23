import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/app_router_constants.dart';
import 'package:todo_app/constants/image_constants.dart';
import 'package:todo_app/constants/string_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/controllers/auth_controller.dart';
import 'package:todo_app/widgets/custom_app_bar.dart';
import 'package:todo_app/widgets/custom_text_button2.dart';
import 'package:todo_app/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(context),
      body: GetBuilder<AuthController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  StringConstants.registerTitle,
                  style: TextstyleConstants.onboardingTitle,
                ),
                Spacer(flex: 2),

                CustomTextField(
                  controller: controller.usernameController,
                  hintText: StringConstants.userNameHint,
                  labelText: StringConstants.userNameLabel,
                ),
                Spacer(),

                CustomTextField(
                  isPassword: true,
                  controller: controller.passwordController,
                  hintText: StringConstants.passwordHint,
                  labelText: StringConstants.passwordLabel,
                ),
                Spacer(),

                CustomTextField(
                  isPassword: true,
                  controller: controller.confirmPasswordController,
                  hintText: StringConstants.confirmPasswordHint,
                  labelText: StringConstants.confirmPasswordLabel,
                ),
                Spacer(flex: 2),

                CustomTextButton2(
                  label: StringConstants.registerTitle,
                  onPressed: () => controller.registerUser(context: context),
                ),
                Spacer(),

                OrDivider(),
                Spacer(),

                CustomTextButton2(
                  label: StringConstants.registerGoogleButton,
                  iconPath: IconConstants.google,
                  isBlack: true,
                  onPressed: () {},
                ),
                Spacer(),

                CustomTextButton2(
                  label: StringConstants.registerAppleButton,
                  iconPath: IconConstants.apple,
                  isBlack: true,
                  onPressed: () {},
                ),
                Spacer(flex: 2),

                Center(
                  child: RichText(
                    text: TextSpan(
                      text: StringConstants.registerUnderText,
                      style: TextstyleConstants.underText.copyWith(
                        color: ColorConstants.grey1,
                      ),
                      children: [
                        TextSpan(
                          text: StringConstants.loginTitle,
                          style: TextstyleConstants.underText,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.goNamed(AppRouterConstants.login);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          );
        },
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
