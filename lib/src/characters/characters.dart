import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/characters/controllers/characters_controller.dart';
import 'package:little_teyvat/src/characters/models/character_card_model.dart';
import 'package:little_teyvat/src/characters/views/character_card.dart';
import 'package:little_teyvat/src/characters/views/character_filter_bottom_sheet.dart';
import 'package:little_teyvat/src/filters/controllers/abstracts/filter_element_controller.dart';
import 'package:little_teyvat/src/filters/controllers/abstracts/filter_rarity_controller.dart';
import 'package:little_teyvat/src/filters/controllers/abstracts/filter_sort_controller.dart';
import 'package:little_teyvat/src/filters/controllers/abstracts/filter_weapon_controller.dart';
import 'package:little_teyvat/src/filters/controllers/filter_characters_controller.dart';
import 'package:little_teyvat/src/shared/views/basic_scaffold.dart';
import 'package:little_teyvat/src/shared/views/error_view.dart';
import 'package:little_teyvat/src/shared/views/fade_wrapper.dart';
import 'package:little_teyvat/src/shared/views/loading_view.dart';
import 'package:little_teyvat/src/shared/views/search_scaffold.dart';

class Characters extends ConsumerWidget {
  const Characters({Key? key}) : super(key: key);

  void _openBottomSheet(BuildContext context, IList<CharacterCardModel> characters) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      builder: (BuildContext context) => CharacterFilterBottomSheet(
        characters: characters,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<IList<CharacterCardModel>> characters = ref.watch(charactersController);

    // Maintain all filter controllers until this view is exited.
    ref.watch(filterRarityController);
    ref.watch(filterElementController);
    ref.watch(filterWeaponController);
    ref.watch(filterSortController);

    return characters.when(
      data: (IList<CharacterCardModel> state) {
        final IList<CharacterCardModel> characters = ref.watch(filterCharactersController(state));
        final FilterCharactersController filterController = ref.watch(filterCharactersController(state).notifier);

        return SearchScaffold(
          title: context.tr.characters,
          body: FadeWrapper(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              itemCount: characters.length,
              itemBuilder: (BuildContext context, int index) => CharacterCard(
                id: characters[index].id,
                name: characters[index].name,
                element: characters[index].element,
                rarity: characters[index].rarity,
                materials: characters[index].materials,
              ),
            ),
          ),
          hintText: context.tr.searchCharacter,
          onOpenFilterSheet: () => _openBottomSheet(context, state),
          onTextChanged: (String value) => filterController.searchCharacters(value),
        );
      },
      loading: () => BasicScaffold(
        title: context.tr.characters,
        body: const LoadingView(),
        absorbing: true,
      ),
      error: (Object error, StackTrace? stack) => BasicScaffold(
        title: context.tr.characters,
        body: ErrorView(
          errorDescription: error.toString(),
          stackTrace: stack.toString(),
        ),
      ),
    );
  }
}
