import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/app_asset_paths.dart' as assets;
import 'package:transparent_image/transparent_image.dart';

const double _sizedBoxHeight = 20.0;

/// The view to be displayed when an error is caught.
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
      color: Colors.red.shade900,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 2.0,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: const AssetImage(assets.appErrorImagePath),
            ),
          ),
          Text(
            context.tr.error,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          if (errorDescription.isNotEmpty) ...<Widget>[
            const SizedBox(height: _sizedBoxHeight),
            Text(
              errorDescription,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
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
                    style: const TextStyle(fontSize: 20.0),
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
