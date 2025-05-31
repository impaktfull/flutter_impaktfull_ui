import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/check_box_list_item/check_box_list_item.dart';
import 'package:impaktfull_ui/src/components/checkbox/checkbox.dart';
import 'package:impaktfull_ui/src/components/simple_list_item/simple_list_item.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component.dart';

export 'check_box_list_item_style.dart';

part 'check_box_list_item.describe.dart';

enum ImpaktfullUiCheckBoxListItemType {
  normal,
  indeterminate,
}

class ImpaktfullUiCheckBoxListItem extends StatelessWidget
    with ComponentDescriptorMixin {
  final String title;
  final String? subtitle;
  final bool? value;
  final ImpaktfullUiAsset? leading;
  final ValueChanged<bool>? onChanged;
  final ValueChanged<bool?>? onChangedInterpediate;
  final ImpaktfullUiCheckBoxListItemTheme? theme;
  final ImpaktfullUiCheckBoxListItemType type;

  const ImpaktfullUiCheckBoxListItem({
    required this.title,
    required bool this.value,
    required this.onChanged,
    this.subtitle,
    this.leading,
    this.theme,
    super.key,
  })  : type = ImpaktfullUiCheckBoxListItemType.normal,
        onChangedInterpediate = null;

  const ImpaktfullUiCheckBoxListItem.indermediate({
    required this.title,
    required this.value,
    required ValueChanged<bool?>? onChanged,
    this.subtitle,
    this.leading,
    this.theme,
    super.key,
  })  : type = ImpaktfullUiCheckBoxListItemType.indeterminate,
        onChangedInterpediate = onChanged,
        onChanged = null;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiSimpleListItem(
        title: title,
        subtitle: subtitle,
        onTap:
            onChanged == null && onChangedInterpediate == null ? null : _onTap,
        type: ImpaktfullUiSimpleListItemType.neutral,
        leadingWidgetBuilder: leading == null
            ? null
            : (context) => ImpaktfullUiAssetWidget(
                  asset: leading,
                  color: componentTheme.colors.icons,
                ),
        trailingWidgetBuilder: (context) {
          if (type == ImpaktfullUiCheckBoxListItemType.normal) {
            return ImpaktfullUiCheckBox(
              value: value ?? false,
              onChanged: onChanged == null ? null : _onChanged,
            );
          } else {
            return ImpaktfullUiCheckBox.indermediate(
              value: value,
              onChanged: onChangedInterpediate == null
                  ? null
                  : (value) => _onChanged(value),
            );
          }
        },
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  void _onTap() {
    final value = this.value ?? false;
    _onChanged(!value);
  }

  void _onChanged(bool? value) {
    if (type == ImpaktfullUiCheckBoxListItemType.normal) {
      onChanged?.call(value ?? false);
    } else {
      onChangedInterpediate?.call(value);
    }
  }
}
