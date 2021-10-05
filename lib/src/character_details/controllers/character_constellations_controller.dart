import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:little_teyvat/src/character_details/controllers/states/character_constellations_state.dart';
import 'package:little_teyvat/src/character_details/controllers/states/character_state.dart';
import 'package:little_teyvat/src/character_details/models/character_constellation_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final AutoDisposeStateNotifierProviderFamily<CharacterConstellationsController, AsyncValue<CharacterConstellationsState>,
        CharacterState> characterConstellationsController =
    StateNotifierProvider.autoDispose
        .family<CharacterConstellationsController, AsyncValue<CharacterConstellationsState>, CharacterState>(
  (AutoDisposeProviderRefBase ref, CharacterState characterState) => CharacterConstellationsController._(characterState),
);

class CharacterConstellationsController extends StateNotifier<AsyncValue<CharacterConstellationsState>> {
  final CharacterState characterState;

  CharacterConstellationsController._(this.characterState) : super(const AsyncValue<CharacterConstellationsState>.loading()) {
    _initState();
  }

  IList<CharacterConstellationModel> get _constellations {
    return (characterState.characterJson['constellations'] as List<dynamic>)
        .map((dynamic json) => CharacterConstellationModel.fromJson(json as Map<String, dynamic>))
        .toIList();
  }

  void _initState() async {
    state = const AsyncValue<CharacterConstellationsState>.loading();

    state = await AsyncValue.guard(() async {
      return CharacterConstellationsState(
        constellations: _constellations,
      );
    });
  }
}
