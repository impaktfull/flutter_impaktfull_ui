import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/badge/badge.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/cms_header/cms_header_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'cms_header_style.dart';

part 'cms_header.describe.dart';

class ImpaktfullUiCmsHeader extends StatefulWidget with ComponentDescriptorMixin {
  final String title;
  final String? subtitle;
  final VoidCallback? onBackTapped;
  final List<ImpaktfullUiButton> actions;
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
  String describe() => _describeInstance(this);
}

class _ImpaktfullUiCmsHeaderState extends State<ImpaktfullUiCmsHeader> {
  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiCmsHeaderTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, theme, componentTheme) => Container(
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
          boxShadow: theme.shadows.extraSmall,
        ),
        child: ImpaktfullUiAutoLayout.vertical(
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
                    ImpaktfullUiTouchFeedback(
                      borderRadius: BorderRadius.circular(9999),
                      onTap: widget.onBackTapped,
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.arrow_back,
                          size: 16,
                        ),
                      ),
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
                              style: theme.textStyles.onCard.text.large,
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
                            style: theme.textStyles.onCardTertiary.text.small,
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (widget.actions.isNotEmpty) ...[
                    const SizedBox(width: 16),
                    for (var i = 0; i < widget.actions.length; ++i) ...[
                      widget.actions[i],
                      if (i < widget.actions.length - 1) ...[
                        const SizedBox(width: 8),
                      ]
                    ],
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
    );
  }
}
