import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/extensions/iterable_extension.dart';
import 'package:little_teyvat/helpers/helpers.dart' as helper;
import 'package:little_teyvat/src/settings/services/language_service.dart';

final Provider<CharacterService> characterService = Provider<CharacterService>(
  (ProviderRef<CharacterService> ref) => CharacterService(ref.read),
);

class CharacterService {
  final Reader read;

  CharacterService(this.read);

  /// Returns a single character's details.
  Future<IMap<String, dynamic>> getCharacter(String id) async {
    final String languageCode = read(languageService).getLanguageKey();
    final IList<String> jsonPath = helper.getCharacterPath(languageCode, id);

    final Map<String, dynamic> json = await helper.getJson(jsonPath[0]);
    final Map<String, dynamic> statsJson = await helper.getJson(jsonPath[1]);

    // Add each talent stats in statsJson to json['talents'].
    (json['talents'] as List<dynamic>).forEachIndex(
      (dynamic talent, int i) => (talent['stats'] as List<dynamic>).forEachIndex(
        (dynamic stats, int j) => json['talents'][i]['stats'][j]['stats'] = statsJson['talentStats'][i][j],
      ),
    );

    // Add other stats in statsJson (i.e., ascension, materials) to json.
    json.addEntries(statsJson.entries);

    return json.lock;
  }
}
