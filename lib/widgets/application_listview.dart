import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/models/application_model.dart';

class ApplicationListview extends StatelessWidget {
  const ApplicationListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text('Applications', style: TextstyleConstants.homePlaceHolderTitle),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: dummyApplicationList.length,
          itemBuilder: (context, index) {
            final app = dummyApplicationList[index];
            return applicationListTile(app);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        ),
      ],
    );
  }

  Widget applicationListTile(ApplicationModel app) {
    return ListTile(
      tileColor: ColorConstants.appBarBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
      titleAlignment: ListTileTitleAlignment.center,
      leading: SvgPicture.network(app.logoLink, height: 32, width: 32),
      title: Text(
        app.name,
        style: TextstyleConstants.mediumText.copyWith(color: Colors.white),
      ),
      subtitle: Text(
        'You spent ${app.hrsSpent}h on ${app.name} today',
        style: TextstyleConstants.underText,
      ),
      trailing: Icon(Icons.info_outline_rounded, color: Colors.white, size: 24),
    );
  }
}
