import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/generated/l10n.dart';
import 'package:little_teyvat/routes/route_constants.dart' as routes;
import 'package:little_teyvat/routes/router.dart' as router;
import 'package:little_teyvat/src/settings/controllers/language_controller.dart';
import 'package:little_teyvat/src/settings/controllers/theme_controller.dart';
import 'package:little_teyvat/src/shared/views/error_view.dart';
import 'package:little_teyvat/themes/themes.dart' as themes;

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode themeMode = ref.watch(themeController).themeMode;
    final Locale locale = ref.watch(languageController).locale;

    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return ErrorView(
        errorDescription: errorDetails.exceptionAsString(),
        stackTrace: errorDetails.stack.toString(),
      );
    };

    return MaterialApp(
      onGenerateTitle: (BuildContext context) => AppLocalizations.of(context).appName,
      themeMode: themeMode,
      theme: themes.lightTheme,
      darkTheme: themes.darkTheme,
      initialRoute: routes.home,
      onGenerateRoute: router.generateRoute,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: locale,
      supportedLocales: AppLocalizations.delegate.supportedLocales,
    );
  }
}
