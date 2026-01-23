import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/adaptive_safe_area/adaptive_safe_area.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/badge/badge.dart';
import 'package:impaktfull_ui/src/components/cms_header/cms_header_style.dart';
import 'package:impaktfull_ui/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui/src/util/extension/widget_list_extensions.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'cms_header_style.dart';

class ImpaktfullUiCmsHeader extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final VoidCallback? onBackTapped;
  final VoidCallback? onDrawerTapped;
  final bool isDrawerOpen;
  final List<Widget> actions;
  final ImpaktfullUiCmsHeaderTheme? theme;
  final String? badge;
  final Widget? bottomChild;

  const ImpaktfullUiCmsHeader({
    this.title,
    this.subtitle,
    this.onBackTapped,
    this.actions = const [],
    this.onDrawerTapped,
    this.isDrawerOpen = false,
    this.bottomChild,
    this.badge,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiCmsHeader> createState() => _ImpaktfullUiCmsHeaderState();
}

class _ImpaktfullUiCmsHeaderState extends State<ImpaktfullUiCmsHeader> {
  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => Container(
        decoration: BoxDecoration(
          color: componentTheme.colors.background,
          border: componentTheme.colors.border == null
              ? null
              : Border(
                  bottom: BorderSide(
                    color: componentTheme.colors.border!,
                    width: 1,
                  ),
                ),
          boxShadow: componentTheme.shadows.background,
        ),
        child: ImpaktfullUiAdaptiveSafeArea(
          bottom: false,
          hasMacOsMenuBar: false,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 64,
            ),
            child: ImpaktfullUiAutoLayout.vertical(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 16,
                    right: 16,
                    bottom: 8,
                  ),
                  child: ImpaktfullUiAutoLayout.horizontal(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      if (widget.onDrawerTapped != null) ...[
                        ImpaktfullUiIconButton(
                          onTap: widget.onDrawerTapped!,
                          asset: componentTheme.assets.drawerMenu,
                          color: componentTheme.colors.icons,
                          tooltip: widget.isDrawerOpen
                              ? 'Close drawer'
                              : 'Open drawer',
                        ),
                      ] else if (widget.onBackTapped != null) ...[
                        ImpaktfullUiIconButton(
                          onTap: widget.onBackTapped!,
                          asset: componentTheme.assets.back,
                          color: componentTheme.colors.icons,
                          tooltip: 'Back',
                        ),
                      ],
                      Expanded(
                        child: ImpaktfullUiAutoLayout.vertical(
                          spacing: 2,
                          children: [
                            ImpaktfullUiAutoLayout.horizontal(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 8,
                              children: [
                                if (widget.title != null) ...[
                                  Text(
                                    widget.title!,
                                    style: componentTheme.textStyles.title,
                                  ),
                                ],
                                if (widget.badge != null) ...[
                                  ImpaktfullUiBadge(
                                    type: ImpaktfullUiBadgeType.primary,
                                    label: widget.badge!,
                                  ),
                                ],
                              ],
                            ),
                            if (widget.subtitle != null) ...[
                              Text(
                                widget.subtitle!,
                                style: componentTheme.textStyles.subtitle,
                              ),
                            ],
                          ],
                        ),
                      ),
                      if (widget.actions.isNotEmpty) ...[
                        ImpaktfullUiAutoLayout.horizontal(
                          spacing: 8,
                          children: widget.actions.overrideColorOnWidgets(
                              componentTheme.colors.icons),
                        ),
                      ],
                    ],
                  ),
                ),
                if (widget.bottomChild != null) ...[
                  widget.bottomChild!,
                  const SizedBox(height: 12),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
