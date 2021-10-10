import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/strapi/strapi.dart';

part 'queries.dart';

final Provider<CharacterService> characterService = Provider<CharacterService>(
  (ProviderRef<CharacterService> ref) => CharacterService(ref.read),
);

class CharacterService {
  final Reader read;
  final Strapi strapi = Strapi();

  CharacterService(this.read);

  /// Returns a single character's statistical data on ascension and talent modifiers.
  Future<IMap<String, dynamic>> getCharacter(String id) async {
    final GraphQLClient client = strapi.getGraphQLClient();
    final QueryResult result = await client.query(
      QueryOptions(
        document: gql(
          _getCharacter(id),
        ),
      ),
    );

    return Map<String, dynamic>.from(result.data!['character']).lock;
  }
}
