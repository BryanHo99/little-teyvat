import 'package:fast_immutable_collections/fast_immutable_collections.dart';

// Language name constants.
const String english = 'English';
const String chinese = '中文（简体）';

// Language codes.
const String en = 'en';
const String zh = 'zh';

// Consolidated languages.
const IMap<String, String> languages = IMapConst<String, String>(
  <String, String>{
    en: english,
    zh: chinese,
  },
);

// Theme icon transition.
const int themeIconTransitionDuration = 350;
