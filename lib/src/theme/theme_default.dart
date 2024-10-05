import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/badge/badge.dart';
import 'package:impaktfull_ui_2/src/components/bottom_navigation/bottom_navigation.dart';
import 'package:impaktfull_ui_2/src/components/bottom_navigation_item/bottom_navigation_item.dart';
import 'package:impaktfull_ui_2/src/components/bottom_sheet/bottom_sheet.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/card/card.dart';
import 'package:impaktfull_ui_2/src/components/checkbox/checkbox.dart';
import 'package:impaktfull_ui_2/src/components/cms_header/cms_header.dart';
import 'package:impaktfull_ui_2/src/components/color_picker/color_picker.dart';
import 'package:impaktfull_ui_2/src/components/command_menu/command_menu.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/dropdown/dropdown.dart';
import 'package:impaktfull_ui_2/src/components/grid_view/grid_view.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tab/horizontal_tab.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tabs/horizontal_tabs.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/list_item/list_item.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui_2/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui_2/src/components/modal/modal.dart';
import 'package:impaktfull_ui_2/src/components/network_image/network_image.dart';
import 'package:impaktfull_ui_2/src/components/notification/notification.dart';
import 'package:impaktfull_ui_2/src/components/notification_badge/notification_badge.dart';
import 'package:impaktfull_ui_2/src/components/refresh_indicator/refresh_indicator.dart';
import 'package:impaktfull_ui_2/src/components/sidebar_navigation/sidebar_navigation.dart';
import 'package:impaktfull_ui_2/src/components/sidebar_navigation_item/sidebar_navigation_item.dart';
import 'package:impaktfull_ui_2/src/components/simple_list_item/simple_list_item.dart';
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
import 'package:impaktfull_ui_2/src/util/extension/border_radius_geometry_extension.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DefaultTheme {
  static ImpaktfullUiTheme withMinimalChanges({
    required Color primary,
    required Color accent,
    required Color secondary,
    String? label,
    Color? tertiary,
    Color? canvas,
    Color? card,
    Color? border,
    Color? shadow,
    Color? text,
    Color? textOnPrimary,
    Color? textOnDestructive,
    Color? textOnAccent,
    Color? textOnSecondary,
    Color? warning,
    Color? error,
    Color? success,
    Color? info,
    Color? destructive,
    BorderRadiusGeometry? borderRadiusExtraSmall,
    BorderRadiusGeometry? borderRadiusSmall,
    BorderRadiusGeometry? borderRadius,
    BorderRadiusGeometry? borderRadiusLarge,
    BorderRadiusGeometry? borderRadiusExtraLarge,
    String fontFamilyDisplay = 'Ubuntu',
    String fontFamilyText = 'Geologica',
    String? package,
    String? assetSuffix,
  }) {
    final colors = ImpaktfullUiColorTheme(
      primary: primary,
      accent: accent,
      secondary: secondary,
      tertiary: tertiary ?? const Color(0xFF475467),
      canvas: canvas ?? const Color(0xFFF9FAFB),
      card: card ?? const Color(0xFFFFFFFF),
      border: border ?? Colors.grey.withOpacity(0.2),
      shadow: shadow ?? const Color(0xFF101828).withOpacity(0.5),
      text: text ?? const Color(0xFF344054),
      //todo check if color requires white or black if not provided
      textOnPrimary: textOnPrimary ?? const Color(0xFFFFFFFF),
      textOnDestructive: textOnDestructive ?? const Color(0xFFFFFFFF),
      textOnAccent: textOnAccent ?? const Color(0xFFFFFFFF),
      textOnSecondary: textOnSecondary ?? const Color(0xFF344054),
      warning: warning ?? const Color(0xFFFFA733),
      error: error ?? const Color(0xFFEB2F21),
      info: info ?? const Color(0xFF1C90D4),
      success: success ?? const Color(0xFF34B81F),
      destructive: destructive ?? const Color(0xFFBD0D00),
    );
    final dimens = ImpaktfullUiDimensTheme(
      borderRadiusExtraSmall:
          borderRadiusExtraSmall ?? BorderRadius.circular(4),
      borderRadiusSmall: borderRadiusSmall ?? BorderRadius.circular(6),
      borderRadius: borderRadiusSmall ?? BorderRadius.circular(8),
      borderRadiusLarge: borderRadiusLarge ?? BorderRadius.circular(12),
      borderRadiusExtraLarge:
          borderRadiusExtraLarge ?? BorderRadius.circular(16),
      borderRadiusCircle: BorderRadius.circular(99999999),
    );
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
        color: colors.textOnPrimary,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
      onSecondary: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.textOnSecondary,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
      onDestructive: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.textOnDestructive,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
    );
    final shadows = ImpaktfullUiShadowsTheme.getDefault(
      shadowBase: colors.shadow,
    );
    final assets = ImpaktfullUiAssetTheme.getDefault(
      package: package,
      assetSuffix: assetSuffix,
    );
    final duration = ImpaktfullUiDurationTheme.getDefault();
    return ImpaktfullUiTheme(
      label: label,
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
            borderRadius: dimens.borderRadiusCircle,
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
        bottomSheet: ImpaktfullUiBottomSheetTheme(
          assets: ImpaktfullUiBottomSheetAssetsTheme(
            close: assets.icons.close,
          ),
          colors: ImpaktfullUiBottomSheetColorTheme(
            background: colors.card,
            handle: colors.text,
            icon: colors.text,
          ),
          dimens: ImpaktfullUiBottomSheetDimensTheme(
            borderRadius: dimens.borderRadius.copyWith(
              bottomStart: Radius.zero,
              bottomEnd: Radius.zero,
            ),
            padding: const EdgeInsetsDirectional.all(16),
            closeIconButtonPadding: const EdgeInsetsDirectional.all(4),
            handleBorderRadius: dimens.borderRadiusExtraSmall,
          ),
          textStyles: ImpaktfullUiBottomSheetTextStyleTheme(
            title: textStyles.onCanvas.display.small.semiBold,
            subtitle: textStyles.onCanvas.text.small,
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
          textStyles: ImpaktfullUiButtonTextStylesTheme(
            primary: textStyles.onPrimary.text.small.bold,
            alternative: textStyles.onCardPrimary.text.small.bold,
            grey: textStyles.onCard.text.small.bold,
            destructivePrimary: textStyles.onDestructive.text.small.bold,
            destructiveAlternative:
                textStyles.onCardDestructive.text.small.bold,
          ),
        ),
        card: ImpaktfullUiCardTheme(
          colors: ImpaktfullUiCardColorTheme(
            background: colors.card,
            border: colors.border,
          ),
          dimens: ImpaktfullUiCardDimensTheme(
            borderRadius: dimens.borderRadius,
            padding: const EdgeInsets.all(16),
          ),
          shadows: ImpaktfullUiCardShadowsTheme(
            card: shadows.small,
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
            icon: colors.text,
          ),
          dimens: const ImpaktfullUiCmsHeaderDimensTheme(),
          assets: ImpaktfullUiCmsHeaderAssetsTheme(
            back: assets.icons.arrowLeft,
          ),
        ),
        colorPicker: ImpaktfullUiColorPickerTheme(
          assets: const ImpaktfullUiColorPickerAssetsTheme(),
          colors: const ImpaktfullUiColorPickerColorTheme(),
          dimens: ImpaktfullUiColorPickerDimensTheme(
            simpleColorPickerItemBorderRadius: dimens.borderRadiusCircle,
            simpleColorPickerItemSize: 32,
          ),
          textStyles: const ImpaktfullUiColorPickerTextStyleTheme(),
        ),
        commandMenu: ImpaktfullUiCommandMenuTheme(
          assets: const ImpaktfullUiCommandMenuAssetsTheme(),
          colors: const ImpaktfullUiCommandMenuColorTheme(),
          dimens: ImpaktfullUiCommandMenuDimensTheme(
            windowBorderRadius: dimens.borderRadiusLarge,
          ),
          textStyles: const ImpaktfullUiCommandMenuTextStyleTheme(),
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
        gridView: const ImpaktfullUiGridViewTheme(
          assets: ImpaktfullUiGridViewAssetsTheme(),
          colors: ImpaktfullUiGridViewColorTheme(),
          dimens: ImpaktfullUiGridViewDimensTheme(),
          textStyles: ImpaktfullUiGridViewTextStyleTheme(),
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
        listItem: ImpaktfullUiListItemTheme(
          assets: ImpaktfullUiListItemAssetsTheme(
            chevronRight: assets.icons.chevronRight,
          ),
          colors: ImpaktfullUiListItemColorTheme(
            icons: colors.primary,
            danger: colors.destructive,
          ),
          dimens: const ImpaktfullUiListItemDimensTheme(),
          textStyles: const ImpaktfullUiListItemTextStyleTheme(),
        ),
        listView: ImpaktfullUiListViewTheme(
          dimens: ImpaktfullUiListViewDimensTheme(
            borderRadius: dimens.borderRadius,
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
        networkImage: const ImpaktfullUiNetworkImageTheme(
          assets: ImpaktfullUiNetworkImageAssetsTheme(),
          colors: ImpaktfullUiNetworkImageColorTheme(),
          dimens: ImpaktfullUiNetworkImageDimensTheme(),
          textStyles: ImpaktfullUiNetworkImageTextStyleTheme(),
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
        sidebarNavigation: ImpaktfullUiSidebarNavigationTheme(
          assets: const ImpaktfullUiSidebarNavigationAssetsTheme(),
          colors: ImpaktfullUiSidebarNavigationColorTheme(
            backgroundColor: colors.card,
            border: colors.border,
          ),
          dimens: const ImpaktfullUiSidebarNavigationDimensTheme(
            padding: EdgeInsetsDirectional.all(16),
          ),
          textStyles: const ImpaktfullUiSidebarNavigationTextStyleTheme(),
        ),
        sidebarNavigationItem: ImpaktfullUiSidebarNavigationItemTheme(
          assets: ImpaktfullUiSidebarNavigationItemAssetsTheme(
            chevronUp: assets.icons.chevronUp,
          ),
          colors: ImpaktfullUiSidebarNavigationItemColorTheme(
            background: colors.canvas,
            icon: colors.text,
          ),
          dimens: ImpaktfullUiSidebarNavigationItemDimensTheme(
            borderRadius: dimens.borderRadius,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            paddingWithSubItems: const EdgeInsetsDirectional.only(
              start: 16,
              end: 4,
            ),
          ),
          durations: ImpaktfullUiSidebarNavigationItemDurationTheme(
            dropdownRotation: duration.short,
          ),
          textStyles: ImpaktfullUiSidebarNavigationItemTextStyleTheme(
            title: textStyles.onCard.text.medium.medium,
          ),
        ),
        simpleListItem: ImpaktfullUiSimpleListItemTheme(
          assets: const ImpaktfullUiSimpleListItemAssetsTheme(),
          colors: ImpaktfullUiSimpleListItemColorTheme(
            background: colors.card,
          ),
          dimens: const ImpaktfullUiSimpleListItemDimensTheme(
            padding: EdgeInsets.all(16),
            borderRadius: BorderRadius.zero,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          textStyles: ImpaktfullUiSimpleListItemTextStyleTheme(
            title: textStyles.onCard.text.small.medium,
            titleDanger: textStyles.onCardDestructive.text.small.medium,
            subtitle: textStyles.onCard.text.small.light,
            subtitleDanger: textStyles.onCardDestructive.text.small.light,
          ),
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
            borderRadius: dimens.borderRadius,
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
            background: colors.canvas,
          ),
          dimens: ImpaktfullUiTableHeaderDimensTheme(
            borderRadius: BorderRadiusDirectional.only(
              topStart: dimens.borderRadius.topStart,
              topEnd: dimens.borderRadius.topEnd,
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
