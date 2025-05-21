import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/string_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/widgets/listtile_textbutton.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings', style: TextstyleConstants.homePlaceHolderTitle),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text('Settings', style: TextstyleConstants.mediumText),
            ListTileTextButton(
              label: StringConstants.settingsLabel1,
              icon: Icons.edit_rounded,
              onTap: () {},
            ),
            ListTileTextButton(
              label: StringConstants.settingsLabel2,
              icon: Icons.format_italic_rounded,
              onTap: () {},
            ),
            ListTileTextButton(
              label: StringConstants.settingsLabel3,
              icon: Icons.language_outlined,
              onTap: () {},
            ),
            Text('Import', style: TextstyleConstants.mediumText),
            ListTileTextButton(
              label: StringConstants.settingsLabel4,
              icon: Icons.file_download_outlined,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
