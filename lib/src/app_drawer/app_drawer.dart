import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/src/app_drawer/controllers/app_drawer_controller.dart';
import 'package:little_teyvat/src/app_drawer/controllers/navigation_controller.dart';
import 'package:little_teyvat/src/app_drawer/models/drawer_item_model.dart';
import 'package:little_teyvat/src/app_drawer/views/app_drawer_header.dart';
import 'package:little_teyvat/src/app_drawer/views/app_drawer_list_tile.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final IList<DrawerItemModel> drawerItems = ref.watch(appDrawerController(context));

    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          const AppDrawerHeader(),
          ...drawerItems.map(
            (DrawerItemModel drawerItem) => AppDrawerListTile(
              drawerItemImageIcon: drawerItem.imageIcon,
              drawerItemTitle: drawerItem.title,
              drawerItemRoute: drawerItem.routeName,
              onTap: () => ref.read(navigationController).navigateDrawer(context, drawerItem.routeName),
            ),
          ),
        ],
      ),
    );
  }
}
