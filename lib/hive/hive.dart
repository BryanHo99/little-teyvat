import 'package:hive_flutter/hive_flutter.dart';
import 'package:little_teyvat/hive/hive_constants.dart' as hive;

Future<void> initHive() async {
  await Hive.initFlutter();
  await Hive.openBox(hive.settingsBox);
}
