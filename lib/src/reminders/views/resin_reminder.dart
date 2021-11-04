import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:little_teyvat/src/reminders/reminders_constants.dart' as constants;
import 'package:little_teyvat/src/reminders/views/circular_slider.dart';
import 'package:little_teyvat/themes/themes.dart';

const double _minResin = 0.0;
const double _maxResin = 160.0;

class ResinReminder extends HookWidget {
  const ResinReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // @TODO: Need to use state management for current resin value.
    final ValueNotifier<double> trackValue = useState(0.0);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircularSlider(
          min: _minResin,
          max: _maxResin,
          value: trackValue.value,
          itemKey: constants.resin,
          innerWidget: Text(
            '${trackValue.value.toInt()} / ${_maxResin.toInt()}',
            style: ktHeading1,
          ),
        ),
      ],
    );
  }
}
