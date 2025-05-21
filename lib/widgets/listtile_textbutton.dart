import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';

class ListTileTextButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;
  const ListTileTextButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      iconColor: color ?? Colors.white,
      onTap: onTap,
      leading: Icon(icon, size: 24),
      title: Text(
        label,
        style: TextstyleConstants.buttonText.copyWith(
          color: color ?? Colors.white,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 24),
    );
  }
}
