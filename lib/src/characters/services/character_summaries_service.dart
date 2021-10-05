import 'package:little_teyvat/helpers/json.dart' as helper;
import 'package:little_teyvat/src/app_asset_paths.dart' as assets;
import 'package:little_teyvat/src/settings/services/language_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<CharacterSummariesService> characterSummariesService = Provider<CharacterSummariesService>(
  (ProviderRef<CharacterSummariesService> ref) => CharacterSummariesService(ref.read),
);

class CharacterSummariesService {
  final Reader read;

  const CharacterSummariesService(this.read);

  /// Returns the absolute path of a character's summary data.
  String _getPath(String jsonFileName) {
    final String languageCode = read(languageService).getLanguageKey();
    final String path = '${assets.localizationPath}/$languageCode/${assets.characterSummariesPath}/$jsonFileName';
    return path;
  }

  /// Returns all characters' summary data.zzxzx
  Future<List<Map<String, dynamic>>> getCharacterSummaries() async {
    final List<Map<String, dynamic>> jsonList = <Map<String, dynamic>>[];

    for (String jsonFileName in assets.charactersJsonPaths) {
      jsonList.add(await helper.getJson(_getPath(jsonFileName)));
    }

    return jsonList;
  }
}
