import 'package:little_teyvat/src/app_asset_paths.dart' as assets;

String getElementPath(String element) {
  return '${assets.elementImagesPath}/$element.png';
}

String getWeaponTypePath(String weaponType) {
  return '${assets.weaponTypeImagesPath}/$weaponType.png';
}

String getRegionPath(String region) {
  return '${assets.regionImagesPath}/$region.png';
}