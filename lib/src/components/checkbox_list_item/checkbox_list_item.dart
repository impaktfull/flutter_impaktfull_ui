import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/checkbox_list_item/checkbox_list_item.dart';
import 'package:impaktfull_ui/src/components/checkbox/checkbox.dart';
import 'package:impaktfull_ui/src/components/simple_list_item/simple_list_item.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'checkbox_list_item_style.dart';

enum ImpaktfullUiCheckboxListItemType {
  normal,
  indeterminate,
}

class ImpaktfullUiCheckboxListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool? value;
  final ImpaktfullUiAsset? leading;
  final ValueChanged<bool>? onChanged;
  final ValueChanged<bool?>? onChangedIndeterminate;
  final ImpaktfullUiCheckboxListItemTheme? theme;
  final ImpaktfullUiCheckboxListItemType type;

  const ImpaktfullUiCheckboxListItem({
    required this.title,
    required bool this.value,
    required this.onChanged,
    this.subtitle,
    this.leading,
    this.theme,
    super.key,
  })  : type = ImpaktfullUiCheckboxListItemType.normal,
        onChangedIndeterminate = null;

  const ImpaktfullUiCheckboxListItem.indeterminate({
    required this.title,
    required this.value,
    required ValueChanged<bool?>? onChanged,
    this.subtitle,
    this.leading,
    this.theme,
    super.key,
  })  : type = ImpaktfullUiCheckboxListItemType.indeterminate,
        onChangedIndeterminate = onChanged,
        onChanged = null;

  @Deprecated(
      'Use ImpaktfullUiCheckboxListItem.indeterminate instead. Will be removed in 1.0.0.')
  const ImpaktfullUiCheckboxListItem.indermediate({
    required String title,
    required bool? value,
    required ValueChanged<bool?>? onChanged,
    String? subtitle,
    ImpaktfullUiAsset? leading,
    ImpaktfullUiCheckboxListItemTheme? theme,
    Key? key,
  }) : this.indeterminate(
          title: title,
          value: value,
          onChanged: onChanged,
          subtitle: subtitle,
          leading: leading,
          theme: theme,
          key: key,
        );

  @Deprecated('Use onChangedIndeterminate instead. Will be removed in 1.0.0.')
  ValueChanged<bool?>? get onChangedInterpediate => onChangedIndeterminate;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiSimpleListItem(
        title: title,
        subtitle: subtitle,
        onTap:
            onChanged == null && onChangedIndeterminate == null ? null : _onTap,
        type: ImpaktfullUiSimpleListItemType.neutral,
        leadingWidgetBuilder: leading == null
            ? null
            : (context) => ImpaktfullUiAssetWidget(
                  asset: leading,
                  color: componentTheme.colors.icons,
                ),
        trailingWidgetBuilder: (context) {
          if (type == ImpaktfullUiCheckboxListItemType.normal) {
            return ImpaktfullUiCheckbox(
              value: value ?? false,
              onChanged: onChanged == null ? null : _onChanged,
            );
          } else {
            return ImpaktfullUiCheckbox.indeterminate(
              value: value,
              onChanged: onChangedIndeterminate == null
                  ? null
                  : (value) => _onChanged(value),
            );
          }
        },
      ),
    );
  }

  void _onTap() {
    final value = this.value ?? false;
    _onChanged(!value);
  }

  void _onChanged(bool? value) {
    if (type == ImpaktfullUiCheckboxListItemType.normal) {
      onChanged?.call(value ?? false);
    } else {
      onChangedIndeterminate?.call(value);
    }
  }
}
