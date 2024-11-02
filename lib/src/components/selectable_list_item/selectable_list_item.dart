import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/selectable_list_item/selectable_list_item_style.dart';
import 'package:impaktfull_ui_2/src/components/simple_list_item/simple_list_item.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'selectable_list_item_style.dart';

part 'selectable_list_item.describe.dart';

class ImpaktfullUiSelectableListItem extends StatelessWidget
    with ComponentDescriptorMixin {
  final String title;
  final String? subtitle;
  final bool isSelected;
  final ImpaktfullUiAsset? leading;
  final Widget Function(BuildContext context, bool isSelected)? trailingBuilder;
  final ValueChanged<bool>? onChanged;
  final ImpaktfullUiSelectableListItemTheme? theme;

  const ImpaktfullUiSelectableListItem({
    required this.title,
    required this.isSelected,
    this.subtitle,
    this.leading,
    this.trailingBuilder,
    this.onChanged,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<
        ImpaktfullUiSelectableListItemTheme>(
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
        trailingWidgetBuilder: (context) {
          final widget = trailingBuilder?.call(context, isSelected);
          if (widget != null) {
            return widget;
          }
          return TweenAnimationBuilder<Color?>(
            tween: ColorTween(
              begin: componentTheme.colors.unselected,
              end: isSelected
                  ? componentTheme.colors.selected
                  : componentTheme.colors.unselected,
            ),
            curve: Curves.easeInOut,
            duration: componentTheme.durations.color,
            builder: (context, color, child) => ImpaktfullUiAssetWidget(
              asset: componentTheme.assets.check,
              color: color,
            ),
          );
        },
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  void _onTap() => onChanged?.call(!isSelected);
}
