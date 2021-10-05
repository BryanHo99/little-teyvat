import 'package:little_teyvat/hive/hive_constants.dart' as hive;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  await Hive.openBox(hive.settingsBox);
}