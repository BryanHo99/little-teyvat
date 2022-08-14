import 'dart:convert';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/services.dart';
import 'package:little_teyvat/src/app_asset_paths.dart' as assets;

/// Get list of files from directory.
Future<IList<String>> getDirectoryContents(String directoryPath) async {
  final String manifestJson = await rootBundle.loadString('AssetManifest.json');
  final List<String> contents = json.decode(manifestJson).keys.where((String key) => key.startsWith(directoryPath)).toList();
  return contents.lock;
}

/// Decodes a locally stored JSON file.
Future<Map<String, dynamic>> getJson(String jsonFilePath) async {
  final String response = await rootBundle.loadString(jsonFilePath);
  return await json.decode(response);
}

/// Get character icon image path.
String getCharacterIconImagePath(String characterKey) {
  return '${assets.characterIconImagesPath}/$characterKey.webp';
}

/// Get character full body image path.
String getCharacterImagePath(String characterKey) {
  return '${assets.characterImagesPath}/$characterKey.webp';
}

/// Get element image path.
String getElementImagePath(String element) {
  return '${assets.elementImagesPath}/$element.png';
}

/// Get item (i.e., ascension materials, food) image path.
String getItemImagePath(String item) {
  return '${assets.itemImagesPath}/$item.webp';
}

/// Get character skill (i.e., talent, passive, constellation) image path.
String getSkillImagePath(String skill) {
  return '${assets.skillImagesPath}/$skill.webp';
}

/// Get character weapon type image path.
String getWeaponTypeImagePath(String weaponType) {
  return '${assets.weaponTypeImagesPath}/$weaponType.png';
}

/// Get region image path.
String getRegionImagePath(String region) {
  return '${assets.regionImagesPath}/$region.png';
}

/// Get all character paths.
Future<IList<String>> getCharacterPaths(String languageCode) async {
  final String path = '${assets.localizationPath}/$languageCode/${assets.charactersPath}/';
  return await getDirectoryContents(path);
}

/// Get localized json and stats json file paths of a character.
IList<String> getCharacterPath(String languageCode, String id) {
  return <String>[
    '${assets.localizationPath}/$languageCode/${assets.charactersPath}/$id.json',
    '${assets.characterStatsDataPath}/$id.json',
  ].lock;
}
