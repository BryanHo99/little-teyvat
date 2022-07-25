import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/routes/route_constants.dart' as routes;

final StateNotifierProvider<NavigationController, String> navigationController = StateNotifierProvider<NavigationController, String>(
    (StateNotifierProviderRef<NavigationController, String> ref) => NavigationController._(routes.home));

class NavigationController extends StateNotifier<String> {
  NavigationController._(String route) : super(route);

  /// Pops the current scope.
  void back(BuildContext context) {
    Navigator.pop(context);
  }

  /// Pushes [routeName] to the navigation stack. Does not change the state.
  void navigate(BuildContext context, String routeName, [Object? arguments]) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  /// Navigate to a new route from the drawer.
  ///
  /// It dismisses the drawer then replaces the current route with [routeName].
  void navigateDrawer(BuildContext context, String routeName) {
    // Dismiss the drawer.
    Navigator.pop(context);

    if (state != routeName) {
      state = routeName;
      Navigator.pushReplacementNamed(context, routeName);
    }
  }
}
