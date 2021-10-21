part of 'character_summaries_service.dart';

String _getCharacterSummaries(String languageCode) {
  return '''
      query {
        characters(locale: "$languageCode", sort: "name") {
          id
          name
          rarity
          element
          weaponType
          cardImage {
            name
            url
          }
          materialsSummary {
            name
            url
          }
        }
      }
    ''';
}
