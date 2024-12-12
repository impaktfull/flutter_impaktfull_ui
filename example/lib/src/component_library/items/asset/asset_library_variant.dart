import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/asset/asset_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class AssetLibraryVariant
    extends ComponentLibraryVariant<AssetLibraryPrimaryInputs> {
  final ImpaktfullUiAsset asset;

  const AssetLibraryVariant({
    required this.asset,
  });

  @override
  String get title => asset.getAssetName();

  @override
  List<Widget> build(BuildContext context, AssetLibraryPrimaryInputs inputs) {
    return [
      AspectRatio(
        aspectRatio: 16 / 9,
        child: ImpaktfullUiAssetWidget(
          asset: asset,
          color: Colors.red,
        ),
      ),
    ];
  }

  @override
  AssetLibraryPrimaryInputs inputs() => AssetLibraryPrimaryInputs();
}

class AssetLibraryPrimaryInputs extends AssetLibraryInputs {}
