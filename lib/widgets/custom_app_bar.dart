import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

PreferredSizeWidget customAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () => context.pop(),
      icon: Icon(Icons.arrow_back_ios_new_rounded),
    ),
  );
}
