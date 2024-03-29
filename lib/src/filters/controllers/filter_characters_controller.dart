import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/src/characters/characters_constants.dart' as constants;
import 'package:little_teyvat/src/characters/models/character_card_model.dart';
import 'package:little_teyvat/src/filters/controllers/filter_element_controller.dart';
import 'package:little_teyvat/src/filters/controllers/filter_rarity_controller.dart';
import 'package:little_teyvat/src/filters/controllers/filter_sort_controller.dart';
import 'package:little_teyvat/src/filters/controllers/filter_weapon_controller.dart';
import 'package:little_teyvat/src/filters/models/element_filter_model.dart';
import 'package:little_teyvat/src/filters/models/weapon_filter_model.dart';

final AutoDisposeStateNotifierProviderFamily<FilterCharactersController, IList<CharacterCardModel>, IList<CharacterCardModel>> filterCharactersController =
    StateNotifierProvider.family.autoDispose<FilterCharactersController, IList<CharacterCardModel>, IList<CharacterCardModel>>(
        (AutoDisposeStateNotifierProviderRef<FilterCharactersController, IList<CharacterCardModel>> ref, IList<CharacterCardModel> characters) =>
            FilterCharactersController._(ref.read, characters));

class FilterCharactersController extends StateNotifier<IList<CharacterCardModel>> {
  final IList<CharacterCardModel> characters;
  final Reader read;

  FilterCharactersController._(this.read, this.characters) : super(characters) {
    _sortCharacters();
  }

  /// Filter characters by rarity, element and weapon.
  void _filterCharacters() {
    final double rarityFilter = read(filterRarityController).filter;
    final ElementFilterModel elementFilter = read(filterElementController).filter;
    final WeaponFilterModel weaponFilter = read(filterWeaponController).filter;

    final IMap<String, bool> elementFilters = <String, bool>{
      constants.pyro: elementFilter.pyro,
      constants.hydro: elementFilter.hydro,
      constants.electro: elementFilter.electro,
      constants.cryo: elementFilter.cryo,
      constants.anemo: elementFilter.anemo,
      constants.geo: elementFilter.geo,
      constants.dendro: elementFilter.dendro,
    }.lock;

    final IMap<String, bool> weaponFilters = <String, bool>{
      constants.sword: weaponFilter.sword,
      constants.claymore: weaponFilter.claymore,
      constants.polearm: weaponFilter.polearm,
      constants.catalyst: weaponFilter.catalyst,
      constants.bow: weaponFilter.bow,
    }.lock;

    state = IList<CharacterCardModel>(
      characters.where((CharacterCardModel character) {
        final String element = character.element.toLowerCase();
        final String weaponType = character.weaponType.toLowerCase();
        final double rarity = character.rarity.toDouble();

        final bool isRarity = (rarityFilter == 0.0) || (rarity == rarityFilter);
        final bool isElement = elementFilters[element] ?? true;
        final bool isWeaponType = weaponFilters[weaponType] ?? true;

        return isRarity && isElement && isWeaponType;
      }),
    );
  }

  /// Sorts characters in ascending or descending order by name or element.
  void _sortCharacters() {
    final String selected = read(filterSortController).filter.selected;
    final bool isAscendingOrder = read(filterSortController).filter.isAscendingOrder;

    state = state.sort((CharacterCardModel a, CharacterCardModel b) {
      final int sortByName;
      final int sortByElement;
      final int sortByWeaponType;
      final int sortByRarity;
      CharacterCardModel temp = a;

      if (!isAscendingOrder) {
        a = b;
        b = temp;
      }

      sortByName = a.name.toLowerCase().compareTo(b.name.toLowerCase());
      sortByElement = a.element.toLowerCase().compareTo(b.element.toLowerCase());
      sortByWeaponType = a.weaponType.toLowerCase().compareTo(b.weaponType.toLowerCase());
      sortByRarity = a.rarity.compareTo(b.rarity);

      final IMap<String, int> sortFilters = <String, int>{
        constants.name: sortByName,
        constants.element: sortByElement,
        constants.weaponType: sortByWeaponType,
        constants.rarity: sortByRarity,
      }.lock;

      return sortFilters[selected] ?? sortByName;
    });
  }

  /// Filters and sorts the characters based on the selected filter options.
  void onSubmit() {
    _filterCharacters();
    _sortCharacters();
  }

  /// Searches for characters based on name or element.
  void searchCharacters(String searchInput) {
    _filterCharacters();
    _sortCharacters();

    state = IList<CharacterCardModel>(
      state.where((CharacterCardModel character) {
        final String query = searchInput.toLowerCase();
        final String name = character.name.toLowerCase();
        final String element = character.element.toLowerCase();

        return name.contains(query) || element.contains(query);
      }),
    );
  }
}
