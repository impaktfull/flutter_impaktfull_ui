import 'package:material_ui/material_ui.dart';
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
    final theme = ImpaktfullUiTheme.of(context);
    return [
      ImpaktfullUiIconButton(
        onTap: () => ImpaktfullUiNotification.show(title: 'IconButton tapped'),
        asset: ImpaktfullUiAsset.icon(inputs.icon.value!),
        tooltip: inputs.tooltip.value,
        color: theme.colors.text,
        showNotificationBadge: true,
      ),
      // Disabled: without onTap.
      ImpaktfullUiIconButton(
        onTap: null,
        asset: ImpaktfullUiAsset.icon(inputs.icon.value!),
        tooltip: inputs.tooltip.value,
        color: theme.colors.text,
      ),
    ];
  }

  @override
  IconButtonLibraryVariantInputs inputs() => IconButtonLibraryVariantInputs();
}

class IconButtonOutlinedLibraryVariant
    extends ComponentLibraryVariant<IconButtonLibraryVariantInputs> {
  IconButtonOutlinedLibraryVariant();

  @override
  String get title => 'Outlined';

  @override
  List<Widget> build(
      BuildContext context, IconButtonLibraryVariantInputs inputs) {
    final theme = ImpaktfullUiTheme.of(context);
    final iconButtonTheme = theme.components.iconButton;
    // An outlined icon button for every icon button of the app: a border
    // colour in the theme.
    final outlinedTheme = iconButtonTheme.copyWith(
      colors: iconButtonTheme.colors.copyWith(border: theme.colors.border),
    );
    return [
      ImpaktfullUiIconButton(
        onTap: () => ImpaktfullUiNotification.show(title: 'IconButton tapped'),
        asset: ImpaktfullUiAsset.icon(inputs.icon.value!),
        tooltip: inputs.tooltip.value,
        color: theme.colors.text,
        theme: outlinedTheme,
      ),
      // One outlined icon button: a borderColor on the widget.
      ImpaktfullUiIconButton(
        onTap: () => ImpaktfullUiNotification.show(title: 'IconButton tapped'),
        asset: ImpaktfullUiAsset.icon(inputs.icon.value!),
        tooltip: inputs.tooltip.value,
        color: theme.colors.accent,
        borderColor: theme.colors.accent,
      ),
      // A thicker border with a rounded square shape.
      ImpaktfullUiIconButton(
        onTap: () => ImpaktfullUiNotification.show(title: 'IconButton tapped'),
        asset: ImpaktfullUiAsset.icon(inputs.icon.value!),
        tooltip: inputs.tooltip.value,
        color: theme.colors.text,
        theme: outlinedTheme.copyWith(
          dimens: outlinedTheme.dimens.copyWith(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderWidth: 2,
          ),
        ),
      ),
      // Disabled: without onTap.
      ImpaktfullUiIconButton(
        onTap: null,
        asset: ImpaktfullUiAsset.icon(inputs.icon.value!),
        tooltip: inputs.tooltip.value,
        color: theme.colors.text,
        theme: outlinedTheme,
      ),
    ];
  }

  @override
  IconButtonLibraryVariantInputs inputs() => IconButtonLibraryVariantInputs();
}

class IconButtonLibraryVariantInputs extends IconButtonLibraryInputs {}
