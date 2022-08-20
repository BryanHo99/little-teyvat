import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/routes/route_constants.dart' as routes;
import 'package:little_teyvat/src/app_asset_paths.dart' as assets;
import 'package:little_teyvat/src/app_drawer/models/drawer_item_model.dart';

final AutoDisposeProviderFamily<IList<DrawerItemModel>, BuildContext> appDrawerController = Provider.autoDispose.family<IList<DrawerItemModel>, BuildContext>((
  AutoDisposeProviderRef<IList<DrawerItemModel>> ref,
  BuildContext context,
) =>
    <DrawerItemModel>[
      DrawerItemModel(
        title: context.tr.home,
        routeName: routes.home,
        imageIcon: assets.drawerHomePath,
      ),
      DrawerItemModel(
        title: context.tr.characters,
        routeName: routes.characters,
        imageIcon: assets.drawerCharactersPath,
      ),
      DrawerItemModel(
        title: context.tr.reminders,
        routeName: routes.reminders,
        imageIcon: assets.drawerRemindersPath,
      ),
      DrawerItemModel(
        title: context.tr.settings,
        routeName: routes.settings,
        imageIcon: assets.drawerSettingsPath,
      ),
    ].lock);
