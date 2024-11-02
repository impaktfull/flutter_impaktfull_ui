import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/radio_button/radio_button.dart';
import 'package:impaktfull_ui_2/src/components/radio_button_list_item/radio_button_list_item_style.dart';
import 'package:impaktfull_ui_2/src/components/simple_list_item/simple_list_item.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'radio_button_list_item_style.dart';

part 'radio_button_list_item.describe.dart';

class ImpaktfullUiRadioButtonListItem<T> extends StatelessWidget
    with ComponentDescriptorMixin {
  final String title;
  final String? subtitle;
  final T value;
  final T groupValue;
  final ImpaktfullUiAsset? leading;
  final ValueChanged<T>? onChanged;
  final ImpaktfullUiRadioButtonListItemTheme? theme;

  const ImpaktfullUiRadioButtonListItem({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.subtitle,
    this.leading,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<
        ImpaktfullUiRadioButtonListItemTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiSimpleListItem(
        title: title,
        subtitle: subtitle,
        onTap: onChanged == null ? null : _onTap,
        type: ImpaktfullUiSimpleListItemType.neutral,
        leadingWidgetBuilder: leading == null
            ? null
            : (context) => ImpaktfullUiAssetWidget(
                  asset: leading,
                  color: componentTheme.colors.icons,
                ),
        trailingWidgetBuilder: (context) => ImpaktfullUiRadioButton(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged == null ? null : _onChanged,
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  void _onTap() => _onChanged(value);

  void _onChanged(T value) => onChanged?.call(value);
}
