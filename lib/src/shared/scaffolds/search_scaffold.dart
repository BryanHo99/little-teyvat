import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/app_drawer/app_drawer.dart';
import 'package:little_teyvat/themes/themes.dart';

class SearchScaffold extends HookWidget {
  final String title;
  final Widget body;
  final String hintText;
  final ValueChanged<String> onTextChanged;
  final VoidCallback onOpenFilterSheet;

  const SearchScaffold({
    Key? key,
    required this.title,
    required this.body,
    required this.hintText,
    required this.onTextChanged,
    required this.onOpenFilterSheet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isDrawerOpened = useState(false);
    final ValueNotifier<bool> searching = useState(false);
    final FocusNode focusNode = useFocusNode();
    final TextEditingController textEditingController = useTextEditingController();

    return WillPopScope(
      onWillPop: () async => _onBackPressed(textEditingController, searching, isDrawerOpened.value),
      child: GestureDetector(
        onPanCancel: () => focusNode.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: searching.value
                ? TextField(
                    focusNode: focusNode,
                    controller: textEditingController,
                    onTap: () => focusNode.requestFocus(),
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: ktBody,
                    ),
                    onChanged: onTextChanged,
                  )
                : Text(title),
            centerTitle: true,
            titleSpacing: 0,
            leading: searching.value
                ? IconButton(
                    onPressed: () => _onBackPressed(textEditingController, searching, isDrawerOpened.value),
                    icon: const Icon(Icons.arrow_back),
                  )
                : null,
            actions: <Widget>[
              searching.value
                  ? textEditingController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            _reset(textEditingController);
                            focusNode.requestFocus();
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : const SizedBox()
                  : IconButton(
                      onPressed: () {
                        searching.value = true;
                        focusNode.requestFocus();
                      },
                      tooltip: context.tr.search,
                      icon: const Icon(Icons.search),
                    ),
              IconButton(
                onPressed: onOpenFilterSheet,
                tooltip: context.tr.filter,
                icon: const Icon(Icons.tune),
              ),
            ],
          ),
          drawer: const AppDrawer(),
          drawerEdgeDragWidth: context.width,
          onDrawerChanged: (bool isOpened) => isDrawerOpened.value = isOpened,
          body: body,
        ),
      ),
    );
  }

  /// Closes the search bar on back press if it is present.
  bool _onBackPressed(TextEditingController textEditingController, ValueNotifier<bool> searching, bool isDrawerOpened) {
    bool willPop = true;

    // Reverts scaffold to display the title.
    if (searching.value && !isDrawerOpened) {
      _reset(textEditingController);
      searching.value = false;
      willPop = false;
    }

    return willPop;
  }

  /// Clears the text on the search bar.
  void _reset(TextEditingController textEditingController) {
    textEditingController.clear();
    onTextChanged('');
  }
}
