import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/app_asset_paths.dart' as assets;
import 'package:little_teyvat/themes/themes.dart';
import 'package:transparent_image/transparent_image.dart';

const double _sizedBoxHeight = 20.0;

/// The view to be displayed when an exception is caught.
///
/// Provides a stack trace to troubleshoot issues.
class ErrorView extends StatelessWidget {
  final String errorDescription;
  final String? stackTrace;

  const ErrorView({
    Key? key,
    this.errorDescription = '',
    this.stackTrace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kcRed900,
      width: context.width,
      height: context.height,
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: const AssetImage(assets.appErrorImagePath),
                  height: context.height / 4.0,
                  width: context.width,
                  fit: BoxFit.fitHeight,
                ),
                Text(
                  context.tr.error,
                  textAlign: TextAlign.center,
                  style: ktHeading3.copyWith(
                    color: kcWhite,
                  ),
                ),
                if (errorDescription.isNotEmpty) ...<Widget>[
                  const SizedBox(height: _sizedBoxHeight),
                  Text(
                    errorDescription,
                    textAlign: TextAlign.center,
                    style: ktHeading4.copyWith(
                      color: kcWhite,
                    ),
                  ),
                ],
                const SizedBox(height: _sizedBoxHeight),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: context.theme.primaryColor),
                  onPressed: () => _openBottomSheet(context, stackTrace ?? StackTrace.current.toString()),
                  child: Text(context.tr.showStackTrace),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  void _openBottomSheet(BuildContext context, String stackTrace) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      builder: (BuildContext context) => DraggableScrollableSheet(
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) => ListView(
          controller: scrollController,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    context.tr.stackTrace,
                    style: ktHeading1,
                  ),
                  const Divider(
                    height: 30.0,
                    thickness: 1.5,
                  ),
                  Text(stackTrace),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
