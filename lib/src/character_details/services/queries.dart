part of 'character_service.dart';

String _getCharacter(String id) {
  return '''
    query {
      character(id: "$id") {
        name
        title
        affiliation
        region
        rarity
        weaponType
        substat
        element
        birthday
        constellation
        cv {
          english
          chinese
          japanese
          korean
        }
        description
        cardImage {
          name
          url
        }
    		characterImage {
          name
          url
        }
        ascensionStats {
          level
          baseHp
          baseAtk
          baseDef
          bonus
          isAscension
        }
        ascensionMaterials {
          level
          materials {
            amount
            image {
              name
              url
            }
          }
        }
        talents {
          name
          description
          image {
            name
            url
          }
          stats {
            attribute
            textFormat
            stats
          }
        }
        talentMaterials {
          level
          materials {
            amount
            image {
              name
              url
            }
          }
        }
        passives {
          name
          description
          image {
            name
            url
          }
        }
        constellations {
          name
          description
          image {
            name
            url
          }
        }
      }
    }
  ''';
}
