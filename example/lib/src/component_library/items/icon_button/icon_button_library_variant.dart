import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/icon_button/icon_button_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class IconButtonTypeLibraryVariant
    extends ComponentLibraryVariant<IconButtonLibraryVariantInputs> {
  IconButtonTypeLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, IconButtonLibraryVariantInputs inputs) {
    return [
      ImpaktfullUiIconButton(
        onTap: () => ImpaktfullUiNotification.show(title: 'IconButton tapped'),
        asset: ImpaktfullUiAsset.icon(inputs.icon.value!),
        tooltip: inputs.tooltip.value,
        color: theme.colors.text,
        showNotificationBadge: true,
      ),
    ];
  }

  @override
  IconButtonLibraryVariantInputs inputs() => IconButtonLibraryVariantInputs();
}

class IconButtonLibraryVariantInputs extends IconButtonLibraryInputs {}
