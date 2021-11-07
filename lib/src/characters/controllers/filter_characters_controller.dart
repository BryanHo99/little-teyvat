import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/src/characters/characters_constants.dart' as constants;
import 'package:little_teyvat/src/characters/models/character_card_model.dart';
import 'package:little_teyvat/src/filters/controllers/element_filter_controller.dart';
import 'package:little_teyvat/src/filters/controllers/rarity_filter_controller.dart';
import 'package:little_teyvat/src/filters/controllers/sort_filter_controller.dart';
import 'package:little_teyvat/src/filters/controllers/states/element_filter_state.dart';
import 'package:little_teyvat/src/filters/controllers/states/rarity_filter_state.dart';
import 'package:little_teyvat/src/filters/controllers/states/sort_filter_state.dart';
import 'package:little_teyvat/src/filters/controllers/states/weapon_filter_state.dart';
import 'package:little_teyvat/src/filters/controllers/weapon_filter_controller.dart';
import 'package:little_teyvat/src/filters/models/element_filter_model.dart';
import 'package:little_teyvat/src/filters/models/weapon_filter_model.dart';

final AutoDisposeStateNotifierProvider<RarityFilterController, RarityFilterState> characterRarityFilterController =
    StateNotifierProvider.autoDispose<RarityFilterController, RarityFilterState>(
  (AutoDisposeStateNotifierProviderRef<RarityFilterController, RarityFilterState> ref) => RarityFilterController(),
);

final AutoDisposeStateNotifierProvider<ElementFilterController, ElementFilterState> characterElementFilterController =
    StateNotifierProvider.autoDispose<ElementFilterController, ElementFilterState>(
  (AutoDisposeStateNotifierProviderRef<ElementFilterController, ElementFilterState> ref) => ElementFilterController(),
);

final AutoDisposeStateNotifierProvider<WeaponFilterController, WeaponFilterState> characterWeaponFilterController =
    StateNotifierProvider.autoDispose<WeaponFilterController, WeaponFilterState>(
  (AutoDisposeStateNotifierProviderRef<WeaponFilterController, WeaponFilterState> ref) => WeaponFilterController(),
);

final AutoDisposeStateNotifierProvider<SortFilterController, SortFilterState> characterSortFilterController =
    StateNotifierProvider.autoDispose<SortFilterController, SortFilterState>(
  (AutoDisposeStateNotifierProviderRef<SortFilterController, SortFilterState> ref) => SortFilterController(constants.name),
);

final AutoDisposeStateNotifierProviderFamily<FilterCharactersController, IList<CharacterCardModel>, IList<CharacterCardModel>>
    filterCharactersController =
    StateNotifierProvider.family.autoDispose<FilterCharactersController, IList<CharacterCardModel>, IList<CharacterCardModel>>(
  (
    AutoDisposeStateNotifierProviderRef<FilterCharactersController, IList<CharacterCardModel>> ref,
    IList<CharacterCardModel> characters,
  ) =>
      FilterCharactersController._(ref.read, characters),
);

class FilterCharactersController extends StateNotifier<IList<CharacterCardModel>> {
  final IList<CharacterCardModel> characters;
  final Reader read;

  FilterCharactersController._(
    this.read,
    this.characters,
  ) : super(characters) {
    _sortCharacters();
  }

  /// Filter characters by rarity, element and weapon.
  void _filterCharacters() {
    final double rarityFilter = read(characterRarityFilterController).filter;
    final ElementFilterModel elementFilter = read(characterElementFilterController).filter;
    final WeaponFilterModel weaponFilter = read(characterWeaponFilterController).filter;

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
    final String selected = read(characterSortFilterController).filter.selected;
    final bool isAscendingOrder = read(characterSortFilterController).filter.isAscendingOrder;

    state = state.sort((CharacterCardModel a, CharacterCardModel b) {
      final int sortByName = isAscendingOrder
          ? a.name.toLowerCase().compareTo(b.name.toLowerCase())
          : b.name.toLowerCase().compareTo(a.name.toLowerCase());

      final int sortByElement = isAscendingOrder
          ? a.element.toLowerCase().compareTo(b.element.toLowerCase())
          : b.element.toLowerCase().compareTo(a.element.toLowerCase());

      final int sortByWeaponType = isAscendingOrder
          ? a.weaponType.toLowerCase().compareTo(b.weaponType.toLowerCase())
          : b.weaponType.toLowerCase().compareTo(a.weaponType.toLowerCase());

      final int sortByRarity = isAscendingOrder ? a.rarity.compareTo(b.rarity) : b.rarity.compareTo(a.rarity);

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
