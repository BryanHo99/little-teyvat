import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/app_drawer/controllers/navigation_controller.dart';
import 'package:little_teyvat/src/filters/controllers/filter_controller.dart';
import 'package:little_teyvat/src/filters/controllers/filter_submit_controller.dart';
import 'package:little_teyvat/themes/themes.dart';

class FilterBottomSheet extends HookConsumerWidget {
  final List<Widget> children;
  final IList<AutoDisposeStateNotifierProvider<FilterController<Object>, Object>> controllers;
  final VoidCallback onSubmit;

  const FilterBottomSheet({
    Key? key,
    required this.children,
    required this.controllers,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<bool> hasSubmit = useState(false);

    return WillPopScope(
      onWillPop: () async {
        if (!hasSubmit.value) {
          ref.read(filterSubmitController(controllers)).cancelControllers();
        }
        return true;
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    context.tr.filter,
                    style: ktHeading1,
                  ),
                  const Divider(
                    height: 30.0,
                    thickness: 1.5,
                  ),
                  ...children,
                  const SizedBox(
                    height: 20.0,
                  ),
                  Wrap(
                    alignment: WrapAlignment.end,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: context.theme.backgroundColor,
                        ),
                        onPressed: () {
                          ref.read(filterSubmitController(controllers)).cancelControllers();
                          ref.read(navigationController.notifier).back(context);
                        },
                        child: Text(
                          context.tr.cancel,
                          style: ktHeading3.copyWith(
                            color: context.theme.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: context.theme.backgroundColor,
                        ),
                        onPressed: () => ref.read(filterSubmitController(controllers)).resetControllers(),
                        child: Text(
                          context.tr.reset,
                          style: ktHeading3.copyWith(
                            color: context.theme.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: context.theme.primaryColor,
                        ),
                        onPressed: () {
                          onSubmit();
                          hasSubmit.value = true;
                          ref.read(filterSubmitController(controllers)).submitControllers();
                          ref.read(navigationController.notifier).back(context);
                        },
                        child: Text(
                          context.tr.filter,
                          style: ktHeading3.copyWith(
                            color: context.theme.colorScheme.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
