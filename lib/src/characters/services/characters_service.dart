import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/helpers/helpers.dart' as helper;
import 'package:little_teyvat/src/settings/services/language_service.dart';

final Provider<CharactersService> charactersService = Provider<CharactersService>(
  (ProviderRef<CharactersService> ref) => CharactersService(ref.read),
);

class CharactersService {
  final Reader read;

  const CharactersService(this.read);

  /// Returns a list of characters.
  Future<IList<Map<String, dynamic>>> getCharacters() async {
    final String languageCode = read(languageService).getLanguageKey();
    final List<Map<String, dynamic>> jsonList = <Map<String, dynamic>>[];

    for (String characterPath in await helper.getCharacterPaths(languageCode)) {
      jsonList.add(await helper.getJson(characterPath));
    }

    return jsonList.lock;
  }
}
