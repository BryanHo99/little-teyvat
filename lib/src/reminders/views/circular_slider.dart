import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/helpers/helpers.dart' as helper;
import 'package:little_teyvat/themes/themes.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:transparent_image/transparent_image.dart';

class CircularSlider extends StatelessWidget {
  final double min;
  final double max;
  final double value;
  final String itemKey;
  final Widget innerWidget;

  const CircularSlider({
    Key? key,
    required this.min,
    required this.max,
    required this.value,
    required this.itemKey,
    required this.innerWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      initialValue: value,
      min: min,
      max: max,
      appearance: CircularSliderAppearance(
        size: context.width,
        customColors: CustomSliderColors(
          hideShadow: true,
          progressBarColors: <Color>[
            kcBlueGrey,
            kcCyan50,
          ],
          trackColor: context.theme.primaryColor.withAlpha(50),
        ),
        customWidths: CustomSliderWidths(
          progressBarWidth: 25.0,
        ),
      ),
      innerWidget: (double percentage) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.2,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage(
                helper.getItemImagePath(itemKey),
              ),
            ),
          ),
          innerWidget,
        ],
      ),
    );
  }
}
