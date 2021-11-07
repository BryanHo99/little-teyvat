import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:little_teyvat/src/app_asset_paths.dart' as assets;

String getCharacterCardImagePath(String characterKey) {
  return '${assets.characterCardImagesPath}/$characterKey.webp';
}

String getCharacterImagePath(String characterKey) {
  return '${assets.characterImagesPath}/$characterKey.webp';
}

String getElementPath(String element) {
  return '${assets.elementImagesPath}/$element.png';
}

String getItemPath(String item) {
  return '${assets.itemImagesPath}/$item.webp';
}

String getSkillPath(String skill) {
  return '${assets.skillImagesPath}/$skill.webp';
}

String getWeaponTypePath(String weaponType) {
  return '${assets.weaponTypeImagesPath}/$weaponType.png';
}

String getRegionPath(String region) {
  return '${assets.regionImagesPath}/$region.png';
}

IList<String> getCharacterPaths(String languageCode) {
  final List<String> characterPaths = <String>[];

  for (String jsonFileName in assets.charactersJsonPaths) {
    characterPaths.add('${assets.localizationPath}/$languageCode/${assets.charactersPath}/$jsonFileName');
  }

  return characterPaths.lock;
}

IList<String> getCharacterPath(String languageCode, String id) {
  return <String>[
    '${assets.localizationPath}/$languageCode/${assets.charactersPath}/$id.json',
    '${assets.characterStatsDataPath}/$id.json',
  ].lock;
}
