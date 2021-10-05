import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:little_teyvat/helpers/json.dart' as helper;
import 'package:little_teyvat/src/app_asset_paths.dart' as assets;
import 'package:little_teyvat/src/settings/services/language_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<CharacterService> characterService = Provider<CharacterService>(
  (ProviderRef<CharacterService> ref) => CharacterService(ref.read),
);

class CharacterService {
  final Reader read;

  const CharacterService(this.read);

  String _getJsonFileName(String characterKey) {
    return '$characterKey.json';
  }

  /// Returns a single character's biography, talents, and constellations.
  Future<IMap<String, dynamic>> getCharacterInfo(String characterKey) async {
    final String languageCode = read(languageService).getLanguageKey();
    final String jsonFileName = _getJsonFileName(characterKey);
    final String jsonFilePath = '${assets.localizationPath}/$languageCode/${assets.charactersPath}/$jsonFileName';
    return (await helper.getJson(jsonFilePath)).lock;
  }

  /// Returns a single character's statistical data on ascension and talent modifiers.
  Future<IMap<String, dynamic>> getCharacterStats(String characterKey) async {
    final String jsonFileName = _getJsonFileName(characterKey);
    final String jsonFilePath = '${assets.characterStatsDataPath}/$jsonFileName';
    return (await helper.getJson(jsonFilePath)).lock;
  }
}
