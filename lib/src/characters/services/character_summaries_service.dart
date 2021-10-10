import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/strapi/strapi.dart';
import 'package:little_teyvat/src/settings/services/language_service.dart';

part 'queries.dart';

final Provider<CharacterSummariesService> characterSummariesService = Provider<CharacterSummariesService>(
  (ProviderRef<CharacterSummariesService> ref) => CharacterSummariesService(ref.read),
);

class CharacterSummariesService {
  final Reader read;
  final Strapi strapi = Strapi();

  CharacterSummariesService(this.read);

  /// Returns all characters' summary data.
  Future<IList<Map<String, dynamic>>> getCharacterSummaries() async {
    final String languageCode = read(languageService).getLanguageKey();
    final GraphQLClient client = strapi.getGraphQLClient();
    final QueryResult result = await client.query(
      QueryOptions(
        document: gql(_getCharacterSummaries(languageCode)),
      ),
    );

    return List<Map<String, dynamic>>.from(result.data!['characters']).lock;
  }
}
