import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/app_router_constants.dart';
import 'package:todo_app/models/user_model.dart';
import 'package:todo_app/utils/dialogs/logout_dialog.dart';
import 'package:todo_app/utils/prefs_methods.dart';
import 'package:todo_app/utils/show_snackbar.dart';

class AuthController extends GetxController {
  UserModel user = UserModel(username: '', password: '');

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String get _userNameInput => usernameController.text.trim();
  String get _passwordInput => passwordController.text.trim();
  String get _confirmPasswordInput => confirmPasswordController.text.trim();

  @override
  void onClose() {
    super.onClose();
    usernameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void onInit() {
    super.onInit();
    _loadUserInfo();
  }

  void _loadUserInfo() async {
    final username = await SharedPrefsMethods.getUsername() ?? '';
    final password = await SharedPrefsMethods.getPassword() ?? '';
    user = UserModel(username: username, password: password);
  }

  void registerUser({required BuildContext context}) async {
    if (_passwordInput == _confirmPasswordInput) {
      user = UserModel(username: _userNameInput, password: _passwordInput);
      update();
      await SharedPrefsMethods.setUserInfo(_userNameInput, _passwordInput);

      showSnackBar(context, 'Registered Successfully!');
      context.pushNamed(AppRouterConstants.home);

      onClose();
    } else {
      showSnackBar(context, "Password and Confirm Password doesn't match!");
    }
  }

  void loginUser({required BuildContext context}) async {
    if (_userNameInput == 'arman' && _passwordInput == '1234') {
      user = UserModel(username: _userNameInput, password: _passwordInput);
      update();
      await SharedPrefsMethods.setUserInfo(_userNameInput, _passwordInput);

      showSnackBar(context, 'Login Successfully!');
      context.pushNamed(AppRouterConstants.home);

      onClose();
    } else {
      showSnackBar(context, 'Login Failed!');
    }
  }

  void logoutUser(BuildContext context) async {
    showLogoutDialog(
      context: context,
      onPressed: () async {
        await SharedPrefsMethods.removeLoginState();
        update();
        context.goNamed(AppRouterConstants.login);
      },
    );
  }

  void changeAccountName(BuildContext context, String newName) {
    if (newName != '') {
      user = user.copyWith(username: newName);
      update();

      context.pop();
      showSnackBar(context, 'Name changed!');
    } else {
      showSnackBar(context, 'Field is empty!');
    }
  }

  void changeAccountPassword(
    BuildContext context,
    String newPassword,
    String oldPassword,
  ) {
    if (newPassword != '' && oldPassword != '') {
      if (user.password == oldPassword) {
        user = user.copyWith(password: newPassword);
        update();

        context.pop();
        showSnackBar(context, 'Password changed!');
      } else {
        showSnackBar(context, 'Old Password is wrong!');
      }
    } else {
      showSnackBar(context, 'Field is empty!');
    }
  }
}
