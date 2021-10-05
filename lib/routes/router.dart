import 'package:flutter/material.dart' hide Characters;
import 'package:little_teyvat/routes/arguments/character_details_arguments.dart';
import 'package:little_teyvat/routes/route_constants.dart' as constants;
import 'package:little_teyvat/src/character_details/character_details.dart';
import 'package:little_teyvat/src/characters/characters.dart';
import 'package:little_teyvat/src/home/home.dart';
import 'package:little_teyvat/src/settings/settings.dart';
import 'package:little_teyvat/src/shared/views/error_view.dart';

/// Generates the route to be navigated in the app.
///
/// Used by [MaterialApp.onGenerateRoute].
/// All routes should be declared here and only named routes should be used.
Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case constants.home:
      return _createRoute(routeSettings, const Home());
    case constants.characters:
      return _createRoute(routeSettings, const Characters());
    case constants.characterDetails:
      final CharacterDetailsArguments args = routeSettings.arguments as CharacterDetailsArguments;
      return _createRoute(
        routeSettings,
        CharacterDetails(
          characterKey: args.characterKey,
          characterName: args.characterName,
        ),
      );
    case constants.settings:
      return _createRoute(routeSettings, const Settings());
    default:
      return _createRoute(
        routeSettings,
        ErrorView(
          errorDescription: 'Undefined route',
          stackTrace: StackTrace.current.toString(),
        ),
      );
  }
}

/// Returns a [Route] that has a fade transition when navigating between views.
Route<Widget> _createRoute(RouteSettings settings, Widget page) {
  return PageRouteBuilder<Widget>(
    settings: settings,
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) =>
        page,
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}
