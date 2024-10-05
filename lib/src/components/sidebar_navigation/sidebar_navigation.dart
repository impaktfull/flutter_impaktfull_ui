import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui_2/src/components/sidebar_navigation/sidebar_navigation_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'sidebar_navigation_style.dart';

part 'sidebar_navigation.describe.dart';

class ImpaktfullUiSidebarNavigation extends StatelessWidget with ComponentDescriptorMixin {
  final ImpaktfullUiAsset? asset;
  final Widget? header;
  final Widget? content;
  final List<Widget> items;
  final List<Widget> footerItems;
  final Widget? footer;
  final ImpaktfullUiSidebarNavigationTheme? theme;

  const ImpaktfullUiSidebarNavigation({
    this.asset,
    this.header,
    this.content,
    this.items = const [],
    this.footerItems = const [],
    this.footer,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiSidebarNavigationTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) {
        final hasHeader = asset != null || header != null;
        return Container(
          color: componentTheme.colors.backgroundColor,
          padding: componentTheme.dimens.padding,
          child: ImpaktfullUiAutoLayout.vertical(
            spacing: 8,
            children: [
              if (hasHeader) ...[
                ImpaktfullUiAutoLayout.vertical(
                  spacing: 8,
                  children: [
                    if (asset != null) ...[
                      const SizedBox(height: 10),
                      ImpaktfullUiAssetWidget(
                        asset: asset!,
                        height: 40,
                      ),
                    ],
                    if (header != null) ...[
                      header!,
                    ],
                  ],
                ),
                const SizedBox(height: 16),
              ],
              if (content != null) ...[
                content!
              ] else ...[
                if (items.isNotEmpty) ...[
                  Expanded(
                    child: ImpaktfullUiListView(
                      spacing: 8,
                      children: items,
                    ),
                  ),
                ],
                ...footerItems,
                const ImpaktfullUiDivider(),
              ],
              if (footer != null) ...[
                footer!,
              ],
            ],
          ),
        );
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
