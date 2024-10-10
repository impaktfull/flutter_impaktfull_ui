import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui_2/src/components/nav_bar/nav_bar_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui_2/src/util/extension/widget_list_extensions.dart';

export 'nav_bar_style.dart';

part 'nav_bar.describe.dart';

class ImpaktfullUiNavBar extends StatelessWidget with ComponentDescriptorMixin {
  final String? title;
  final String? subtitle;
  final VoidCallback? onBackTapped;
  final bool isFullScreen;
  final Widget? bottomChild;
  final List<Widget> actions;
  final ImpaktfullUiNavBarTheme? theme;

  const ImpaktfullUiNavBar({
    this.title,
    this.subtitle,
    this.onBackTapped,
    this.bottomChild,
    this.isFullScreen = false,
    this.actions = const [],
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiNavBarTheme>(
      overrideComponentTheme: theme,
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
          boxShadow: componentTheme.shadows.shadow,
        ),
        child: SafeArea(
          bottom: false,
          child: ImpaktfullUiAutoLayout.vertical(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(
                  start: isFullScreen || onBackTapped == null ? 16 : 6,
                  end: !isFullScreen || onBackTapped == null ? 16 : 6,
                  top: 4,
                  bottom: 4,
                ),
                constraints: const BoxConstraints(
                  minHeight: 56,
                ),
                child: ImpaktfullUiAutoLayout.horizontal(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    if (!isFullScreen && onBackTapped != null) ...[
                      ImpaktfullUiIconButton(
                        onTap: onBackTapped!,
                        asset: componentTheme.assets.back,
                        color: componentTheme.colors.icons,
                      ),
                    ],
                    Expanded(
                      child: ImpaktfullUiAutoLayout.vertical(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title ?? '',
                            style: componentTheme.textStyles.title,
                          ),
                          if (subtitle != null) ...[
                            Text(
                              subtitle ?? '',
                              style: componentTheme.textStyles.subtitle,
                            ),
                          ],
                        ],
                      ),
                    ),
                    ...actions
                        .overrideColorOnWidgets(componentTheme.colors.icons),
                    if (isFullScreen && onBackTapped != null) ...[
                      ImpaktfullUiIconButton(
                        onTap: onBackTapped!,
                        asset: componentTheme.assets.close,
                        color: componentTheme.colors.icons,
                      ),
                    ],
                  ],
                ),
              ),
              if (bottomChild != null) bottomChild!,
            ],
          ),
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
