import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/divider/divider.dart';
import 'package:impaktfull_ui/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui/src/components/sidebar_navigation/sidebar_navigation_style.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/util/extension/edge_insets_geometry_extension.dart';

export 'sidebar_navigation_style.dart';

part 'sidebar_navigation.describe.dart';

class ImpaktfullUiSidebarNavigation extends StatelessWidget
    with ComponentDescriptorMixin {
  final ImpaktfullUiAsset? asset;
  final Widget? header;
  final Widget? content;
  final double? width;
  final List<Widget> items;
  final List<Widget> secondaryItems;
  final Widget? secondaryContent;
  final List<Widget> footerItems;
  final Widget? footer;
  final ImpaktfullUiSidebarNavigationTheme? theme;

  const ImpaktfullUiSidebarNavigation({
    this.asset,
    this.header,
    this.content,
    this.width = 350,
    this.items = const [],
    this.secondaryContent,
    this.secondaryItems = const [],
    this.footerItems = const [],
    this.footer,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<
        ImpaktfullUiSidebarNavigationTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final hasHeader = asset != null || header != null;
        final hasFooter = footer != null;
        final hasFooterItems = footerItems.isNotEmpty;
        return LayoutBuilder(builder: (context, constraints) {
          return Container(
            color: componentTheme.colors.backgroundColor,
            child: ImpaktfullUiAutoLayout.horizontal(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: min(width ?? double.infinity, constraints.maxWidth),
                  child: ImpaktfullUiAutoLayout.vertical(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      if (hasHeader) ...[
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: componentTheme.dimens.padding.start,
                            end: componentTheme.dimens.padding.end,
                            top: componentTheme.dimens.padding.top,
                            bottom: 32,
                          ),
                          child: ImpaktfullUiAutoLayout.vertical(
                            spacing: 8,
                            children: [
                              if (asset != null) ...[
                                const SizedBox(height: 10),
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 150,
                                    maxHeight: 40,
                                  ),
                                  child: ImpaktfullUiAssetWidget(
                                    asset: asset!,
                                  ),
                                ),
                              ],
                              if (header != null) ...[
                                header!,
                              ],
                            ],
                          ),
                        ),
                      ],
                      if (content != null) ...[
                        content!
                      ] else ...[
                        if (items.isNotEmpty) ...[
                          Expanded(
                            child: ImpaktfullUiListView(
                              spacing: 8,
                              padding: EdgeInsetsDirectional.only(
                                start: componentTheme.dimens.padding.start,
                                end: componentTheme.dimens.padding.end,
                                top: hasHeader
                                    ? 0
                                    : componentTheme.dimens.padding.top,
                                bottom: hasFooter || hasFooterItems
                                    ? 0
                                    : componentTheme.dimens.padding.bottom,
                              ),
                              children: items,
                            ),
                          ),
                        ],
                      ],
                      if (footer != null || footerItems.isNotEmpty) ...[
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: componentTheme.dimens.padding.start,
                            end: componentTheme.dimens.padding.end,
                            top: componentTheme.dimens.padding.top,
                            bottom: componentTheme.dimens.padding.bottom,
                          ),
                          child: ImpaktfullUiAutoLayout.vertical(
                            spacing: 8,
                            children: [
                              ...footerItems,
                              if (footer != null) ...[
                                const ImpaktfullUiDivider(),
                                footer!,
                              ],
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (secondaryContent != null || secondaryItems.isNotEmpty) ...[
                  Container(
                    color: componentTheme.colors.border,
                    width: 1,
                    height: double.infinity,
                  ),
                  if (secondaryContent != null) ...[
                    secondaryContent!,
                  ] else ...[
                    SizedBox(
                      width: 300,
                      child: ImpaktfullUiListView(
                        spacing: 8,
                        padding: componentTheme.dimens.padding,
                        children: secondaryItems,
                      ),
                    ),
                  ],
                ],
              ],
            ),
          );
        });
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
