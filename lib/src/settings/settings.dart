import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/settings/views/language_settings_card.dart';
import 'package:little_teyvat/src/settings/views/theme_settings_card.dart';
import 'package:little_teyvat/src/shared/scaffolds/basic_scaffold.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      title: context.tr.settings,
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const <Widget>[
          ThemeSettingsCard(),
          SizedBox(height: 5.0),
          LanguageSettingsCard(),
        ],
      ),
    );
  }
}
