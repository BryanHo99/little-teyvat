import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/character_details/controllers/character_details_controller.dart';
import 'package:little_teyvat/src/character_details/models/character_model.dart';
import 'package:little_teyvat/src/character_details/views/character_constellations.dart';
import 'package:little_teyvat/src/character_details/views/character_profile.dart';
import 'package:little_teyvat/src/character_details/views/character_talents.dart';
import 'package:little_teyvat/src/shared/views/error_view.dart';
import 'package:little_teyvat/src/shared/views/loading_view.dart';
import 'package:little_teyvat/src/shared/wrappers/keep_alive_wrapper.dart';

class CharacterDetails extends HookConsumerWidget {
  final String id;
  final String name;

  const CharacterDetails({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<CharacterModel> character = ref.watch(characterDetailsController(id));
    final ValueNotifier<int> bottomTabIndex = useState(0);
    final PageController pageController = usePageController();

    pageController.addListener(() {
      bottomTabIndex.value = pageController.page!.toInt();
    });

    return character.when(
      data: (CharacterModel state) => Scaffold(
        appBar: AppBar(
          title: Text(name),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
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
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            KeepAliveWrapper(
              child: CharacterProfile(character: state),
            ),
            KeepAliveWrapper(
              child: CharacterTalents(character: state),
            ),
            KeepAliveWrapper(
              child: CharacterConstellations(character: state),
            ),
          ],
        ),
      ),
      loading: () => AbsorbPointer(
        child: Scaffold(
          appBar: AppBar(
            title: Text(name),
            centerTitle: true,
          ),
          body: const LoadingView(),
        ),
      ),
      error: (Object error, StackTrace? stack) => Scaffold(
        appBar: AppBar(
          title: Text(name),
          centerTitle: true,
        ),
        body: ErrorView(
          errorDescription: error.toString(),
          stackTrace: stack.toString(),
        ),
      ),
    );
  }
}
