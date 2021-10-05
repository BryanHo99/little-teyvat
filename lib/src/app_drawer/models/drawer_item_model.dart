import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawer_item_model.freezed.dart';

@freezed
class DrawerItemModel with _$DrawerItemModel {
  const factory DrawerItemModel({
    required String title,
    required String routeName,
    required String imageIcon,
  }) = _DrawerItemModel;
}
