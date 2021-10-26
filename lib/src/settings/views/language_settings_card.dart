import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/settings/controllers/language_controller.dart';
import 'package:little_teyvat/src/settings/controllers/locales_controller.dart';
import 'package:little_teyvat/src/settings/models/locale_model.dart';
import 'package:little_teyvat/themes/themes.dart';

class LanguageSettingsCard extends StatelessWidget {
  const LanguageSettingsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                const Icon(
                  Icons.language,
                ),
                const SizedBox(width: 10.0),
                Text(
                  context.tr.language,
                  style: ktHeading1,
                ),
              ],
            ),
            const SizedBox(height: 3.0),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final IMap<String, LocaleModel> locales = ref.watch(localesController);
                final LocaleModel localeModel = ref.watch(languageController);

                return DropdownButtonHideUnderline(
                  child: DropdownButton<LocaleModel>(
                    isExpanded: true,
                    value: localeModel,
                    items: locales.entries
                        .map((MapEntry<String, LocaleModel> locale) => DropdownMenuItem<LocaleModel>(
                              value: locale.value,
                              child: Text(locale.key),
                            ))
                        .toList(),
                    onChanged: (LocaleModel? value) => ref.read(languageController.notifier).changeLocale(value!),
                  ),
                );
              },
            ),
            const Divider(thickness: 1.1),
            Text(context.tr.languageDescription),
          ],
        ),
      ),
    );
  }
}
