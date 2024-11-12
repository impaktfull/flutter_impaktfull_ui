import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/asset/asset_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AssetLibraryItem extends ComponentLibraryItem {
  const AssetLibraryItem();

  @override
  String get title => 'ImpaktfullUiAssetWidget';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    final assets = [
      ImpaktfullUiAsset.icon(PhosphorIcons.heart(PhosphorIconsStyle.fill)),
      const ImpaktfullUiAsset.svg('heart.svg', directory: 'assets/images'),
      const ImpaktfullUiAsset.pixel('heart.webp', directory: 'assets/images'),
      const ImpaktfullUiAsset.pixel('heart.png', directory: 'assets/images'),
      const ImpaktfullUiAsset.rive('heart.riv', directory: 'assets/rive'),
      const ImpaktfullUiAsset.lottie('heart.json', directory: 'assets/lottie'),
    ];
    return [
      for (final asset in assets) ...[
        AssetLibraryVariant(
          asset: asset,
        ),
      ],
    ];
  }
}

class AssetLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
