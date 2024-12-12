import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/selectable_list_item/selectable_list_item_style.dart';
import 'package:impaktfull_ui/src/components/simple_list_item/simple_list_item.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export 'selectable_list_item_style.dart';

part 'selectable_list_item.describe.dart';

class ImpaktfullUiSelectableListItem extends StatefulWidget
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
  State<ImpaktfullUiSelectableListItem> createState() =>
      _ImpaktfullUiSelectableListItemState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiSelectableListItemState
    extends State<ImpaktfullUiSelectableListItem> {
  late bool _previousIsSelected;

  @override
  void initState() {
    super.initState();
    _previousIsSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<
        ImpaktfullUiSelectableListItemTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiSimpleListItem(
        title: widget.title,
        subtitle: widget.subtitle,
        onTap: widget.onChanged == null ? null : _onTap,
        type: ImpaktfullUiSimpleListItemType.neutral,
        leadingWidgetBuilder: widget.leading == null
            ? null
            : (context) => ImpaktfullUiAssetWidget(
                  asset: widget.leading,
                  color: componentTheme.colors.icons,
                ),
        trailingWidgetBuilder: (context) {
          final customWidget =
              widget.trailingBuilder?.call(context, widget.isSelected);
          if (customWidget != null) {
            return customWidget;
          }

          _previousIsSelected = widget.isSelected;
          return TweenAnimationBuilder<Color?>(
            tween: ColorTween(
              begin: _previousIsSelected
                  ? componentTheme.colors.selected
                  : componentTheme.colors.unselected,
              end: widget.isSelected
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

  void _onTap() => widget.onChanged?.call(!widget.isSelected);
}
