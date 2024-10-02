import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/badge/badge.dart';
import 'package:impaktfull_ui_2/src/components/bottom_navigation/bottom_navigation.dart';
import 'package:impaktfull_ui_2/src/components/bottom_navigation_item/bottom_navigation_item.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/card/card.dart';
import 'package:impaktfull_ui_2/src/components/checkbox/checkbox.dart';
import 'package:impaktfull_ui_2/src/components/cms_header/cms_header.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/dropdown/dropdown.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tab/horizontal_tab.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tabs/horizontal_tabs.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui_2/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui_2/src/components/modal/modal.dart';
import 'package:impaktfull_ui_2/src/components/notification/notification.dart';
import 'package:impaktfull_ui_2/src/components/notification_badge/notification_badge.dart';
import 'package:impaktfull_ui_2/src/components/refresh_indicator/refresh_indicator.dart';
import 'package:impaktfull_ui_2/src/components/snacky/snacky_configurator.dart';
import 'package:impaktfull_ui_2/src/components/switch/switch.dart';
import 'package:impaktfull_ui_2/src/components/table/table.dart';
import 'package:impaktfull_ui_2/src/components/table_header/table_header.dart';
import 'package:impaktfull_ui_2/src/components/table_header_item/table_header_item.dart';
import 'package:impaktfull_ui_2/src/components/table_row/table_row.dart';
import 'package:impaktfull_ui_2/src/components/table_row_item/table_row_item.dart';
import 'package:impaktfull_ui_2/src/components/tooltip/tooltip.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/asset_theme.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DefaultTheme {
  static ImpaktfullUiTheme withMinimalChanges({
    required Color primary,
    required Color accent,
    required Color secondary,
    required BorderRadius borderRadiusExtraSmall,
    required BorderRadius borderRadiusSmall,
    required BorderRadius borderRadius,
    required BorderRadius borderRadiusLarge,
    required BorderRadius borderRadiusExtraLarge,
    String package = 'impaktfull_ui_2',
  }) {
    final colors = ImpaktfullUiColorTheme(
      primary: primary,
      accent: accent,
      secondary: secondary,
      tertiary: const Color(0xFF475467),
      canvas: const Color(0xFFF9FAFB),
      card: const Color(0xFFFFFFFF),
      header: const Color(0xFFF9FAFB),
      border: Colors.grey.withOpacity(0.2),
      shadow: const Color(0xFF101828),
      text: const Color(0xFF344054),
      textOnAccent: const Color(0xFFFFFFFF),
      textOnSecondary: const Color(0xFF344054),
      warning: const Color(0xFFFFA733),
      error: const Color(0xFFEB2F21),
      info: const Color(0xFF1C90D4),
      success: const Color(0xFF34B81F),
      destructive: const Color(0xFFEB2F21),
    );
    final dimens = ImpaktfullUiDimensTheme(
      borderRadiusExtraSmall: borderRadiusExtraSmall,
      borderRadiusSmall: borderRadiusSmall,
      borderRadius: borderRadius,
      borderRadiusLarge: borderRadiusLarge,
      borderRadiusExtraLarge: borderRadiusExtraLarge,
    );
    const fontFamilyDisplay = 'Ubuntu';
    const fontFamilyText = 'Geologica';
    final textStyles = ImpaktfullUiTextStylesTheme(
      onCanvas: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.text,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
      onCanvasPrimary: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.accent,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
      onCanvasSecondary: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.secondary,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
      onCanvasTertiary: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.tertiary,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
      onCard: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.text,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
      onCardPrimary: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.accent,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
      onCardSecondary: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.secondary,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
      onCardTertiary: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.tertiary,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
      onCardDestructive: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.destructive,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
      onPrimary: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.card,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
      onSecondary: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.text,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
      onDestructive: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.card,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
    );
    final shadows = ImpaktfullUiShadowsTheme.getDefault(
      shadowBase: colors.shadow,
    );
    final assets = ImpaktfullUiAssetTheme.getDefault(
      package: package,
    );
    final duration = ImpaktfullUiDurationTheme.getDefault();
    return ImpaktfullUiTheme(
      assets: assets,
      colors: colors,
      textStyles: textStyles,
      dimens: dimens,
      durations: duration,
      shadows: shadows,
      components: ImpaktfullUiComponentsTheme(
        badge: ImpaktfullUiBadgeTheme(
          colors: const ImpaktfullUiBadgeColorTheme(),
          dimens: ImpaktfullUiBadgeDimensTheme(
            borderRadius: BorderRadius.circular(999),
          ),
          assets: ImpaktfullUiBadgeAssetsTheme(
            close: assets.icons.close,
          ),
        ),
        bottomNavigation: ImpaktfullUiBottomNavigationTheme(
          assets: const ImpaktfullUiBottomNavigationAssetsTheme(),
          colors: ImpaktfullUiBottomNavigationColorTheme(
            background: colors.card,
          ),
          dimens: const ImpaktfullUiBottomNavigationDimensTheme(),
          textStyles: const ImpaktfullUiBottomNavigationTextStyleTheme(),
          shadows: ImpaktfullUiBottomNavigationShadowsTheme(
            background: shadows.medium,
          ),
        ),
        bottomNavigationItem: ImpaktfullUiBottomNavigationItemTheme(
          assets: const ImpaktfullUiBottomNavigationItemAssetsTheme(),
          colors: ImpaktfullUiBottomNavigationItemColorTheme(
            active: colors.accent,
            inactive: colors.tertiary,
            badgeActive: colors.tertiary,
            badgeInActive: colors.accent,
          ),
          dimens: const ImpaktfullUiBottomNavigationItemDimensTheme(),
          textStyles: ImpaktfullUiBottomNavigationItemTextStyleTheme(
            activeLabel: textStyles.onCardPrimary.text.small.bold,
            inActiveLabel: textStyles.onCardTertiary.text.small.bold,
          ),
        ),
        button: ImpaktfullUiButtonTheme(
          colors: ImpaktfullUiButtonColorTheme(
            primary: colors.accent,
            primaryBorder: colors.accent,
            secondary: colors.card,
            secondaryBorder: colors.border,
            tertiary: null,
            tertiaryBorder: null,
            destructive: colors.destructive,
            destructiveBorder: colors.destructive,
          ),
          dimens: ImpaktfullUiButtonDimensTheme(
            borderRadius: dimens.borderRadius,
          ),
        ),
        card: ImpaktfullUiCardTheme(
          colors: ImpaktfullUiCardColorTheme(
            background: Colors.white,
            border: colors.border,
            shadow: Colors.black12,
          ),
          dimens: ImpaktfullUiCardDimensTheme(
            borderRadius: dimens.borderRadius,
            padding: const EdgeInsets.all(16),
          ),
        ),
        checkbox: ImpaktfullUiCheckboxTheme(
          colors: ImpaktfullUiCheckboxColorTheme(
            borderColor: colors.border,
            activeColor: colors.accent,
            inactiveColor: colors.card,
            checkMarkColor: colors.textOnAccent,
            backgroundColor: colors.card,
          ),
          dimens: ImpaktfullUiCheckboxDimensTheme(
            borderRadius: dimens.borderRadiusSmall,
          ),
          assets: ImpaktfullUiCheckboxAssetsTheme(
            check: assets.icons.check,
            indermediate: assets.icons.minus,
          ),
        ),
        cmsHeader: ImpaktfullUiCmsHeaderTheme(
          colors: ImpaktfullUiCmsHeaderColorTheme(
            background: colors.card,
            border: colors.border,
          ),
          dimens: const ImpaktfullUiCmsHeaderDimensTheme(),
          assets: ImpaktfullUiCmsHeaderAssetsTheme(
            back: assets.icons.arrowLeft,
          ),
        ),
        divider: ImpaktfullUiDividerTheme(
          colors: ImpaktfullUiDividerColorTheme(
            color: colors.border,
          ),
        ),
        dropdown: ImpaktfullUiDropdownTheme(
          colors: ImpaktfullUiDropdownColorTheme(
            menuBackground: colors.card,
            menuBorder: colors.border,
          ),
          shadows: ImpaktfullUiDropdownShadowTheme(
            menuShadow: shadows.medium,
          ),
          dimens: ImpaktfullUiDropdownDimensTheme(
            borderRadius: dimens.borderRadius,
          ),
          assets: ImpaktfullUiDropdownAssetsTheme(
            dropUp: assets.icons.chevronUp,
            dropDown: assets.icons.chevronDown,
          ),
        ),
        horizontalTab: ImpaktfullUiHorizontalTabTheme(
          colors: ImpaktfullUiHorizontalTabColorTheme(
            backgroundUnSelectedTab: colors.card,
            backgroundSelectedTab: colors.accent.withOpacity(0.33),
          ),
          dimens: ImpaktfullUiHorizontalTabDimensTheme(
            borderRadius: dimens.borderRadius,
          ),
          textStyles: ImpaktfullUiHorizontalTabTextStylesTheme(
            selected: textStyles.onCardPrimary.text.small.semiBold,
            unselected: textStyles.onCard.text.small.semiBold,
          ),
        ),
        horizontalTabs: const ImpaktfullUiHorizontalTabsTheme(
          colors: ImpaktfullUiHorizontalTabsColorTheme(),
          dimens: ImpaktfullUiHorizontalTabsDimensTheme(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
        inputField: ImpaktfullUiInputFieldTheme(
          colors: ImpaktfullUiInputFieldColorTheme(
            background: colors.card,
            border: colors.border,
            cursor: colors.accent,
            selection: colors.accent.withOpacity(0.3),
            selectionHandle: colors.accent,
          ),
          dimens: ImpaktfullUiInputFieldDimensTheme(
            borderRadius: dimens.borderRadius,
          ),
          textStyles: ImpaktfullUiInputFieldTextStylesTheme(
            text: textStyles.onCard.text.medium,
            hint: textStyles.onCardSecondary.text.medium.copyWith(
                color: textStyles.onCardTertiary.text.medium.color
                    ?.withOpacity(0.5)),
            label: textStyles.onCard.text.small.medium,
          ),
        ),
        listView: ImpaktfullUiListViewTheme(
          dimens: ImpaktfullUiListViewDimensTheme(
            borderRadius: borderRadius,
            padding: const EdgeInsets.all(16),
          ),
          textStyles: ImpaktfullUiListViewTextStylesTheme(
            title: textStyles.onCanvas.display.small,
          ),
        ),
        loadingIndicator: ImpaktfullUiLoadingIndicatorTheme(
          colors: ImpaktfullUiLoadingIndicatorColorTheme(color: colors.accent),
          assets: ImpaktfullUiLoadingIndicatorAssetTheme(
            lottie: assets.lotties.loading,
          ),
        ),
        modal: ImpaktfullUiModalTheme(
          colors: ImpaktfullUiModalColorTheme(
            background: colors.card,
            closeIcon: colors.text,
            leadingHeaderIcon: colors.accent,
          ),
          textStyles: ImpaktfullUiModalTextStyleTheme(
            title: textStyles.onCanvas.display.small.semiBold,
            subtitle: textStyles.onCanvas.text.small,
          ),
          dimens: ImpaktfullUiModalDimensTheme(
            borderRadius: dimens.borderRadius,
            padding: const EdgeInsets.all(16),
            closeIconButtonPadding: const EdgeInsets.all(4),
            leadingIconPadding: const EdgeInsets.all(8),
          ),
          assets: ImpaktfullUiModalAssetsTheme(
            close: assets.icons.close,
          ),
        ),
        notification: ImpaktfullUiNotificationTheme(
          colors: ImpaktfullUiNotificationColorTheme(
            background: colors.card,
            border: colors.border,
            branded: colors.accent,
            error: colors.error,
            info: colors.info,
            success: colors.success,
            warning: colors.warning,
          ),
          textStyles: ImpaktfullUiNotificationTextStyleTheme(
            title: textStyles.onCard.text.medium.bold,
            subtitle: textStyles.onCard.text.small,
          ),
          dimens: ImpaktfullUiNotificationDimensTheme(
            borderRadius: dimens.borderRadius,
          ),
          assets: ImpaktfullUiNotificationAssetsTheme(
            branded: assets.icons.confetti,
            chevronRight: assets.icons.chevronRight,
            close: assets.icons.close,
            error: assets.icons.error,
            info: assets.icons.info,
            success: assets.icons.success,
            warning: assets.icons.warning,
          ),
        ),
        notificationBadge: ImpaktfullUiNotificationBadgeTheme(
          assets: const ImpaktfullUiNotificationBadgeAssetsTheme(),
          colors: ImpaktfullUiNotificationBadgeColorTheme(
            background: colors.primary,
            border: colors.card,
          ),
          dimens: ImpaktfullUiNotificationBadgeDimensTheme(
            borderRadius: dimens.borderRadius,
          ),
          durations: ImpaktfullUiNotificationBadgeDurationTheme(
            opacity: duration.short,
          ),
          textStyles: ImpaktfullUiNotificationBadgeTextStyleTheme(
            text: textStyles.onPrimary.text.small,
          ),
        ),
        refreshIndicator: ImpaktfullUiRefreshIndicatorTheme(
          colors: ImpaktfullUiRefreshIndicatorColorTheme(
              loadingIndicator: colors.accent),
        ),
        snackyConfigurator: ImpaktfullUiSnackyConfiguratorTheme(
          colors: ImpaktfullUiSnackyConfiguratorColorTheme(
            background: colors.card,
            border: colors.border,
            brand: colors.accent,
            error: colors.error,
            info: colors.info,
            warning: colors.warning,
            success: colors.success,
          ),
          dimens: ImpaktfullUiSnackyConfiguratorDimensTheme(
            borderRadius: borderRadius,
          ),
          textStyles: const ImpaktfullUiSnackyConfiguratorTextStylesTheme(),
          assets: ImpaktfullUiSnackyConfiguratorAssetsTheme(
            close: assets.icons.close,
            chevronRight: assets.icons.chevronRight,
            success: assets.icons.success,
            error: assets.icons.error,
            warning: assets.icons.warning,
            info: assets.icons.info,
            branded: ImpaktfullUiAsset.icon(PhosphorIcons.confetti()),
          ),
        ),
        switchTheme: ImpaktfullUiSwitchTheme(
          colors: ImpaktfullUiSwitchColorTheme(
            activeBackgroundColor: colors.accent,
            inactiveBackgroundColor: colors.border,
            active: colors.card,
            inactive: colors.card,
            border: colors.border,
          ),
          textStyles: const ImpaktfullUiSwitchTextStyleTheme(),
          dimens: ImpaktfullUiSwitchDimensTheme(
            borderRadius: dimens.borderRadius,
            thumbBorderRadius: dimens.borderRadiusExtraSmall,
            borderWidth: 0,
          ),
          assets: ImpaktfullUiSwitchAssetsTheme(
            active: assets.icons.check,
            inactive: assets.icons.close,
          ),
        ),
        tableHeader: ImpaktfullUiTableHeaderTheme(
          colors: ImpaktfullUiTableHeaderColorTheme(
            background: colors.header,
          ),
          dimens: ImpaktfullUiTableHeaderDimensTheme(
            borderRadius: BorderRadius.only(
              topLeft: borderRadius.topLeft,
              topRight: borderRadius.topRight,
            ),
          ),
        ),
        table: ImpaktfullUiTableTheme(
          colors: ImpaktfullUiTableColorTheme(
            background: colors.card,
            border: colors.border,
          ),
          dimens: ImpaktfullUiTableDimensTheme(
            borderRadius: dimens.borderRadius,
          ),
        ),
        tableHeaderItem: ImpaktfullUiTableHeaderItemTheme(
          colors: const ImpaktfullUiTableHeaderItemColorTheme(),
          dimens: const ImpaktfullUiTableHeaderItemDimensTheme(),
          textStyles: ImpaktfullUiTableHeaderItemTextStylesTheme(
            title: textStyles.onCanvas.text.extraSmall.medium,
          ),
        ),
        tableRow: const ImpaktfullUiTableRowTheme(
          colors: ImpaktfullUiTableRowColorTheme(),
          dimens: ImpaktfullUiTableRowDimensTheme(),
          textStyles: ImpaktfullUiTableRowTextStylesTheme(),
        ),
        tableRowItem: ImpaktfullUiTableRowItemTheme(
          colors: const ImpaktfullUiTableRowItemColorTheme(),
          dimens: const ImpaktfullUiTableRowItemDimensTheme(),
          textStyles: ImpaktfullUiTableRowItemTextStylesTheme(
            title: textStyles.onCanvas.text.small.medium,
            subtitle: textStyles.onCanvas.text.small,
          ),
        ),
        tooltip: ImpaktfullUiTooltipTheme(
          colors: ImpaktfullUiTooltipColorTheme(
            background: colors.primary,
          ),
          textStyles: const ImpaktfullUiTooltipTextStyleTheme(),
          dimens: ImpaktfullUiTooltipDimensTheme(
            borderRadius: dimens.borderRadiusSmall,
          ),
          durations: ImpaktfullUiTooltipDurationTheme(
            wait: duration.long,
          ),
          assets: const ImpaktfullUiTooltipAssetsTheme(),
        ),
      ),
    );
  }
}
