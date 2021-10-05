import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/character_details/controllers/character_details_controller.dart';
import 'package:little_teyvat/src/character_details/controllers/states/character_state.dart';
import 'package:little_teyvat/src/character_details/views/character_constellations.dart';
import 'package:little_teyvat/src/character_details/views/character_profile.dart';
import 'package:little_teyvat/src/character_details/views/character_talents.dart';
import 'package:little_teyvat/src/shared/views/error_view.dart';
import 'package:little_teyvat/src/shared/wrappers/keep_alive_wrapper.dart';
import 'package:little_teyvat/src/shared/views/loading_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CharacterDetails extends HookConsumerWidget {
  final String characterKey;
  final String characterName;

  const CharacterDetails({
    Key? key,
    required this.characterKey,
    required this.characterName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<CharacterState> characterState = ref.watch(characterDetailsController(characterKey));
    final ValueNotifier<int> bottomTabIndex = useState(0);
    final PageController pageController = usePageController();

    pageController.addListener(() {
      bottomTabIndex.value = pageController.page!.toInt();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(characterName),
        centerTitle: true,
      ),
      bottomNavigationBar: characterState.when(
        data: (CharacterState state) => BottomNavigationBar(
          currentIndex: bottomTabIndex.value,
          onTap: (int index) => pageController.jumpToPage(index),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
              label: context.tr.profile,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.spa),
              label: context.tr.talents,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.insights),
              label: context.tr.constellations,
            ),
          ],
        ),
        loading: () => null,
        error: (Object error, StackTrace? stack) => null,
      ),
      body: characterState.when(
        data: (CharacterState state) => PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            KeepAliveWrapper(
              child: CharacterProfile(
                characterState: state,
              ),
            ),
            KeepAliveWrapper(
              child: CharacterTalents(
                characterKey: characterKey,
                characterState: state,
              ),
            ),
            KeepAliveWrapper(
              child: CharacterConstellations(
                characterKey: characterKey,
                characterState: state,
              ),
            ),
          ],
        ),
        loading: () => const LoadingView(),
        error: (Object error, StackTrace? stack) => ErrorView(
          errorDescription: error.toString(),
          stackTrace: stack.toString(),
        ),
      ),
    );
  }
}
