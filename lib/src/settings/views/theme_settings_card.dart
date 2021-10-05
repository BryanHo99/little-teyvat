import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/settings/controllers/theme_controller.dart';
import 'package:little_teyvat/src/settings/views/theme_icon.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeSettingsCard extends HookWidget {
  const ThemeSettingsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                const ThemeIcon(),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    context.tr.darkMode,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    final bool darkModeEnabled = ref.watch(themeController).darkModeEnabled;

                    return Switch.adaptive(
                      value: darkModeEnabled,
                      onChanged: (bool value) => ref.read(themeController.notifier).changeTheme(value),
                    );
                  },
                ),
              ],
            ),
            const Divider(thickness: 1.1),
            Text(context.tr.darkModeDescription),
          ],
        ),
      ),
    );
  }
}
