import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/adaptive_safe_area/adaptive_safe_area.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui/src/components/localization/localization_provider.dart';
import 'package:impaktfull_ui/src/components/nav_bar/nav_bar.localization.dart';
import 'package:impaktfull_ui/src/components/nav_bar/nav_bar.style.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/util/extension/widget_list_extensions.dart';

export 'nav_bar.style.dart';

part 'nav_bar.describe.dart';

class ImpaktfullUiNavBar extends StatelessWidget with ComponentDescriptorMixin {
  final String? title;
  final String? subtitle;
  final VoidCallback? onBackTapped;
  final VoidCallback? onDrawerTapped;
  final bool isDrawerOpen;
  final bool isFullScreen;
  final Widget? bottomChild;
  final List<Widget> actions;
  final bool centerTitle;
  final ImpaktfullUiNavBarLocalizations? localizations;
  final ImpaktfullUiNavBarTheme? theme;

  const ImpaktfullUiNavBar({
    this.title,
    this.subtitle,
    this.onBackTapped,
    this.onDrawerTapped,
    this.isDrawerOpen = false,
    this.bottomChild,
    this.isFullScreen = false,
    this.centerTitle = false,
    this.actions = const [],
    this.localizations,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiLocalizationProvider(
      localizations: localizations,
      builder: (context, localizations) =>
          ImpaktfullUiComponentThemeBuilder<ImpaktfullUiNavBarTheme>(
        overrideComponentTheme: theme,
        builder: (context, componentTheme) {
          final leadingActions = [
            if (onDrawerTapped != null) ...[
              ImpaktfullUiIconButton(
                onTap: onDrawerTapped!,
                asset: componentTheme.assets.drawerMenu,
                color: componentTheme.colors.icons,
                tooltip: isDrawerOpen
                    ? localizations.drawerCloseTooltip
                    : localizations.drawerOpenTooltip,
              ),
            ] else if (!isFullScreen && onBackTapped != null) ...[
              ImpaktfullUiIconButton(
                onTap: onBackTapped!,
                asset: componentTheme.assets.back,
                color: componentTheme.colors.icons,
                tooltip: localizations.backTooltip,
              ),
            ],
          ];
          final trailingActions = [
            ...actions.overrideColorOnWidgets(componentTheme.colors.icons),
            if (isFullScreen && onBackTapped != null) ...[
              ImpaktfullUiIconButton(
                onTap: onBackTapped!,
                asset: componentTheme.assets.close,
                color: componentTheme.colors.icons,
                tooltip: localizations.closeTooltip,
              ),
            ],
          ];
          final maxAmountOfActions =
              max(leadingActions.length, trailingActions.length);
          final actionsSize = maxAmountOfActions * 44.0;
          return Container(
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
            child: ImpaktfullUiAdaptiveSafeArea(
              bottom: false,
              child: ImpaktfullUiAutoLayout.vertical(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      start: leadingActions.isEmpty ? 16 : 6,
                      end: trailingActions.isEmpty ? 16 : 6,
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
                        if (centerTitle && actionsSize > 0) ...[
                          SizedBox(
                            width: actionsSize,
                            child: ImpaktfullUiAutoLayout.horizontal(
                              mainAxisSize: MainAxisSize.min,
                              children: leadingActions,
                            ),
                          ),
                        ] else ...[
                          ...leadingActions,
                        ],
                        Expanded(
                          child: ImpaktfullUiAutoLayout.vertical(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: centerTitle
                                ? CrossAxisAlignment.center
                                : CrossAxisAlignment.start,
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
                        if (centerTitle && actionsSize > 0) ...[
                          SizedBox(
                            width: actionsSize,
                            child: ImpaktfullUiAutoLayout.horizontal(
                              mainAxisSize: MainAxisSize.min,
                              children: trailingActions,
                            ),
                          ),
                        ] else ...[
                          ...trailingActions,
                        ],
                      ],
                    ),
                  ),
                  if (bottomChild != null) bottomChild!,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
