import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

export 'switch_list_item_style.dart';

part 'switch_list_item.describe.dart';

class ImpaktfullUiSwitchListItem extends StatelessWidget
    with ComponentDescriptorMixin {
  final String title;
  final String? subtitle;
  final bool value;
  final ImpaktfullUiAsset? leading;
  final ValueChanged<bool>? onChanged;
  final ImpaktfullUiSwitchListItemTheme? theme;

  const ImpaktfullUiSwitchListItem({
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.leading,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiSwitchListItemTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) => ImpaktfullUiSimpleListItem(
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
        trailingWidgetBuilder: (context) => ImpaktfullUiSwitch(
          value: value,
          onChanged: onChanged == null ? null : _onChanged,
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  void _onTap() => _onChanged(!value);

  void _onChanged(bool value) => onChanged?.call(value);
}
