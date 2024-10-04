import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui_2/src/components/sidebar_navigation_item/sidebar_navigation_item_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'sidebar_navigation_item_style.dart';

part 'sidebar_navigation_item.describe.dart';

class ImpaktfullUiSidebarNavigationItem extends StatefulWidget with ComponentDescriptorMixin {
  final ImpaktfullUiAsset? leading;
  final String title;
  final List<Widget> items;
  final bool isSelected;
  final VoidCallback? onTap;
  final ImpaktfullUiSidebarNavigationItemTheme? theme;

  const ImpaktfullUiSidebarNavigationItem({
    required this.title,
    this.onTap,
    this.leading,
    this.isSelected = false,
    this.items = const [],
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiSidebarNavigationItem> createState() => _ImpaktfullUiSidebarNavigationItemState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiSidebarNavigationItemState extends State<ImpaktfullUiSidebarNavigationItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiSidebarNavigationItemTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, theme, componentTheme) => ImpaktfullUiAutoLayout.vertical(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          ImpaktfullUiTouchFeedback(
            onTap: _onTap,
            color: widget.isSelected ? componentTheme.colors.background : null,
            borderRadius: componentTheme.dimens.borderRadius,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ImpaktfullUiAutoLayout.horizontal(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8,
                children: [
                  if (widget.leading != null) ...[
                    ImpaktfullUiAssetWidget(
                      asset: widget.leading,
                      color: componentTheme.colors.icon,
                    ),
                  ],
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      child: Text(
                        widget.title,
                        style: componentTheme.textStyles.title,
                      ),
                    ),
                  ),
                  if (widget.items.isNotEmpty) ...[
                    AnimatedRotation(
                      turns: _expanded ? 0.5 : 0,
                      duration: componentTheme.durations.dropdownRotation,
                      child: ImpaktfullUiIconButton(
                        asset: componentTheme.assets.chevronUp,
                        color: componentTheme.colors.icon,
                        onTap: _onExpandedTapped,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (widget.items.isNotEmpty && _expanded) ...[
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: ImpaktfullUiAutoLayout.vertical(
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: widget.items,
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _onTap() {
    widget.onTap?.call();
    _onExpandedTapped();
  }

  void _onExpandedTapped() {
    if (widget.items.isNotEmpty) {
      setState(() => _expanded = !_expanded);
    }
  }
}
