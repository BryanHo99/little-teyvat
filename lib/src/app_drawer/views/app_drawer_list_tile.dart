import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';

class AppDrawerListTile extends StatelessWidget {
  final String drawerItemImageIcon;
  final String drawerItemRoute;
  final String drawerItemTitle;
  final VoidCallback onTap;

  const AppDrawerListTile({
    Key? key,
    required this.drawerItemImageIcon,
    required this.drawerItemTitle,
    required this.drawerItemRoute,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageIcon(
        AssetImage(drawerItemImageIcon),
        color: context.theme.iconTheme.color,
      ),
      title: Text(drawerItemTitle),
      onTap: onTap,
    );
  }
}
