import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql/client.dart';
import 'package:little_teyvat/strapi/strapi_constants.dart' as constants;

class Strapi {
  static final Strapi _instance = Strapi._();

  final GraphQLClient _client = GraphQLClient(
    link: HttpLink(dotenv.env[constants.strapiGql]!),
    cache: GraphQLCache(),
  );

  /// Returns a singleton of the Strapi API object.
  factory Strapi() {
    return _instance;
  }

  Strapi._();

  GraphQLClient getGraphQLClient() {
    return _client;
  }
}
