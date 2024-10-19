import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/adaptive_safe_area/adaptive_safe_area.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/badge/badge.dart';
import 'package:impaktfull_ui_2/src/components/cms_header/cms_header_style.dart';
import 'package:impaktfull_ui_2/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui_2/src/util/extension/widget_list_extensions.dart';

export 'cms_header_style.dart';

part 'cms_header.describe.dart';

class ImpaktfullUiCmsHeader extends StatefulWidget
    with ComponentDescriptorMixin {
  final String title;
  final String? subtitle;
  final VoidCallback? onBackTapped;
  final List<Widget> actions;
  final ImpaktfullUiCmsHeaderTheme? theme;
  final String? badge;
  final Widget? bottom;

  const ImpaktfullUiCmsHeader({
    required this.title,
    this.subtitle,
    this.onBackTapped,
    this.actions = const [],
    this.bottom,
    this.badge,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiCmsHeader> createState() => _ImpaktfullUiCmsHeaderState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiCmsHeaderState extends State<ImpaktfullUiCmsHeader> {
  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiCmsHeaderTheme>(
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
          child: ImpaktfullUiAutoLayout.vertical(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                  bottom: widget.bottom == null ? 16 : 12,
                ),
                child: ImpaktfullUiAutoLayout.horizontal(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.onBackTapped != null) ...[
                      ImpaktfullUiIconButton(
                        onTap: widget.onBackTapped!,
                        asset: componentTheme.assets.back,
                        color: componentTheme.colors.icons,
                        tooltip: 'Back',
                      ),
                      const SizedBox(width: 8),
                    ],
                    Expanded(
                      child: ImpaktfullUiAutoLayout.vertical(
                        spacing: 4,
                        children: [
                          ImpaktfullUiAutoLayout.horizontal(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Text(
                                widget.title,
                                style: componentTheme.textStyles.title,
                              ),
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
                      const SizedBox(width: 16),
                      ImpaktfullUiAutoLayout.horizontal(
                        spacing: 8,
                        children: widget.actions.overrideColorOnWidgets(
                            componentTheme.colors.icons),
                      ),
                    ],
                  ],
                ),
              ),
              if (widget.bottom != null) ...[
                widget.bottom!,
                const SizedBox(height: 12),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
