import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui_2/src/components/screen/screen.dart';
import 'package:impaktfull_ui_2/src/components/sidebar_navigation_item/sidebar_navigation_item_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'sidebar_navigation_item_style.dart';

part 'sidebar_navigation_item.describe.dart';

class ImpaktfullUiSidebarNavigationItem extends StatefulWidget
    with ComponentDescriptorMixin {
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
  State<ImpaktfullUiSidebarNavigationItem> createState() =>
      _ImpaktfullUiSidebarNavigationItemState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiSidebarNavigationItemState
    extends State<ImpaktfullUiSidebarNavigationItem>
    with SingleTickerProviderStateMixin {
  var _expanded = false;
  late AnimationController _controller;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _expanded = widget.items.any(
        (item) => item is ImpaktfullUiSidebarNavigationItem && item.isSelected);
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    if (_expanded) {
      _controller.forward(from: 1);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<
        ImpaktfullUiSidebarNavigationItemTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        return ImpaktfullUiAutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            ImpaktfullUiTouchFeedback(
              onTap: _onTap,
              color:
                  widget.isSelected ? componentTheme.colors.background : null,
              borderRadius: componentTheme.dimens.borderRadius,
              child: Padding(
                padding: widget.items.isEmpty
                    ? componentTheme.dimens.padding
                    : componentTheme.dimens.paddingWithSubItems,
                child: ImpaktfullUiAutoLayout.horizontal(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 12,
                  children: [
                    if (widget.leading != null) ...[
                      ImpaktfullUiAssetWidget(
                        asset: widget.leading,
                        color: componentTheme.colors.icons,
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
                          color: componentTheme.colors.icons,
                          onTap: _onExpandedTapped,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            if (widget.items.isNotEmpty) ...[
              SizeTransition(
                sizeFactor: _expandAnimation,
                axisAlignment: 1,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16),
                  child: ImpaktfullUiAutoLayout.vertical(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: widget.items,
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  void _onTap() {
    widget.onTap?.call();
    _onExpandedTapped();
    if (widget.items.isEmpty) {
      ImpaktfullUiScreen.of(context).closeDrawer();
    }
  }

  void _onExpandedTapped() {
    if (widget.items.isNotEmpty) {
      setState(() {
        _expanded = !_expanded;
        if (_expanded) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      });
    }
  }
}
