import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/app_asset_paths.dart' as assets;
import 'package:little_teyvat/src/app_drawer/app_drawer_constants.dart' as constants;
import 'package:little_teyvat/themes/themes.dart';

class AppDrawerHeader extends StatelessWidget {
  const AppDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assets.drawerBackgroundPath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const CircleAvatar(
            radius: 40.0,
            backgroundImage: AssetImage(assets.appIconImagePath),
            backgroundColor: kcTransparent,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  context.tr.appName,
                  style: ktHeading1.copyWith(
                    color: kcWhite,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  context.tr.version(constants.version),
                  style: ktBody.copyWith(
                    color: kcWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
