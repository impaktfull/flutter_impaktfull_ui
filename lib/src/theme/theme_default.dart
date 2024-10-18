import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/accordion/accordion.dart';
import 'package:impaktfull_ui_2/src/components/auto_complete/auto_complete.dart';
import 'package:impaktfull_ui_2/src/components/avatar/avatar.dart';
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
import 'package:impaktfull_ui_2/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/dropdown/dropdown.dart';
import 'package:impaktfull_ui_2/src/components/file_picker/file_picker.dart';
import 'package:impaktfull_ui_2/src/components/floating_action_button/floating_action_button.dart';
import 'package:impaktfull_ui_2/src/components/fluid_padding/fluid_padding.dart';
import 'package:impaktfull_ui_2/src/components/grid_view/grid_view.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tab/horizontal_tab.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tabs/horizontal_tabs.dart';
import 'package:impaktfull_ui_2/src/components/image_crop/image_crop.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/list_item/list_item.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui_2/src/components/loading_error_data/loading_error_data.dart';
import 'package:impaktfull_ui_2/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui_2/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui_2/src/components/modal/modal.dart';
import 'package:impaktfull_ui_2/src/components/nav_bar/nav_bar.dart';
import 'package:impaktfull_ui_2/src/components/network_image/network_image.dart';
import 'package:impaktfull_ui_2/src/components/notification/notification.dart';
import 'package:impaktfull_ui_2/src/components/notification_badge/notification_badge.dart';
import 'package:impaktfull_ui_2/src/components/number_input/number_input.dart';
import 'package:impaktfull_ui_2/src/components/pagination/pagination.dart';
import 'package:impaktfull_ui_2/src/components/placeholder_state/placeholder_state.dart';
import 'package:impaktfull_ui_2/src/components/progress_indicator/progress_indicator_style.dart';
import 'package:impaktfull_ui_2/src/components/radio_button/radio_button.dart';
import 'package:impaktfull_ui_2/src/components/radio_button_list_item/radio_button_list_item.dart';
import 'package:impaktfull_ui_2/src/components/refresh_indicator/refresh_indicator.dart';
import 'package:impaktfull_ui_2/src/components/screen/screen.dart';
import 'package:impaktfull_ui_2/src/components/section_title/section_title.dart';
import 'package:impaktfull_ui_2/src/components/selectable_list_item/selectable_list_item.dart';
import 'package:impaktfull_ui_2/src/components/separated_column/separated_column.dart';
import 'package:impaktfull_ui_2/src/components/sidebar_navigation/sidebar_navigation.dart';
import 'package:impaktfull_ui_2/src/components/sidebar_navigation_item/sidebar_navigation_item.dart';
import 'package:impaktfull_ui_2/src/components/simple_list_item/simple_list_item.dart';
import 'package:impaktfull_ui_2/src/components/skeleton/skeleton.dart';
import 'package:impaktfull_ui_2/src/components/snacky/snacky_configurator.dart';
import 'package:impaktfull_ui_2/src/components/switch/switch.dart';
import 'package:impaktfull_ui_2/src/components/switch_list_item/switch_list_item.dart';
import 'package:impaktfull_ui_2/src/components/tab_bar/tab_bar.dart';
import 'package:impaktfull_ui_2/src/components/tab_bar_item/tab_bar_item.dart';
import 'package:impaktfull_ui_2/src/components/table/table.dart';
import 'package:impaktfull_ui_2/src/components/table_header/table_header.dart';
import 'package:impaktfull_ui_2/src/components/table_header_item/table_header_item.dart';
import 'package:impaktfull_ui_2/src/components/table_row/table_row.dart';
import 'package:impaktfull_ui_2/src/components/table_row_item/table_row_item.dart';
import 'package:impaktfull_ui_2/src/components/time_picker/time_picker.dart';
import 'package:impaktfull_ui_2/src/components/tooltip/tooltip.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/wysiwyg.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/asset_theme.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';
import 'package:impaktfull_ui_2/src/util/extension/border_radius_geometry_extension.dart';
import 'package:impaktfull_ui_2/src/util/extension/text_style_extension.dart';
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
    Color? card2,
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
      card2: card2 ?? Colors.grey.withOpacity(0.2),
      shadow: shadow ?? Colors.black12,
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
      onAccent: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.textOnAccent,
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
    final durations = ImpaktfullUiDurationTheme.getDefault();
    return ImpaktfullUiTheme(
      label: label,
      assets: assets,
      colors: colors,
      textStyles: textStyles,
      dimens: dimens,
      durations: durations,
      shadows: shadows,
      components: ImpaktfullUiComponentsTheme(
        accordion: ImpaktfullUiAccordionTheme(
          assets: ImpaktfullUiAccordionAssetsTheme(
            arrow: assets.icons.chevronDown,
          ),
          colors: const ImpaktfullUiAccordionColorTheme(),
          dimens: const ImpaktfullUiAccordionDimensTheme(),
          textStyles: const ImpaktfullUiAccordionTextStyleTheme(),
        ),
        avatar: ImpaktfullUiAvatarTheme(
          assets: ImpaktfullUiAvatarAssetsTheme(
            placeholder: assets.icons.user,
          ),
          colors: ImpaktfullUiAvatarColorTheme(
            border: colors.border,
            background: colors.canvas,
            placeholder: colors.text,
          ),
          dimens: ImpaktfullUiAvatarDimensTheme(
            borderRadius: dimens.borderRadiusCircle,
          ),
          textStyles: const ImpaktfullUiAvatarTextStyleTheme(),
        ),
        autoComplete: ImpaktfullUiAutoCompleteTheme(
          assets: const ImpaktfullUiAutoCompleteAssetsTheme(),
          colors: const ImpaktfullUiAutoCompleteColorTheme(),
          dimens: const ImpaktfullUiAutoCompleteDimensTheme(),
          shadows: ImpaktfullUiAutoCompleteShadowTheme(
            overlay: shadows.large,
          ),
          textStyles: const ImpaktfullUiAutoCompleteTextStyleTheme(),
        ),
        badge: ImpaktfullUiBadgeTheme(
          assets: ImpaktfullUiBadgeAssetsTheme(
            close: assets.icons.close,
          ),
          colors: ImpaktfullUiBadgeColorTheme(
            primaryText: colors.accent,
            primaryBorder: colors.accent,
            primaryBackground: colors.accent.withOpacity(0.05),
            secondaryText: colors.secondary,
            secondaryBorder: colors.secondary.withOpacity(0.5),
            secondaryBackground: colors.secondary.withOpacity(0.05),
            neutralText: colors.text,
            neutralBorder: colors.border,
            neutralBackground: colors.border.withOpacity(0.05),
            errorText: colors.error,
            errorBorder: colors.error.withOpacity(0.5),
            errorBackground: colors.error.withOpacity(0.05),
            warningText: colors.warning,
            warningBorder: colors.warning.withOpacity(0.5),
            warningBackground: colors.warning.withOpacity(0.05),
            successText: colors.success,
            successBorder: colors.success.withOpacity(0.5),
            successBackground: colors.success.withOpacity(0.05),
          ),
          dimens: ImpaktfullUiBadgeDimensTheme(
            borderRadius: dimens.borderRadiusCircle,
          ),
          textStyles: ImpaktfullUiBadgeTextStylesTheme(
            small: textStyles.onCard.text.small,
            medium: textStyles.onCard.text.small,
            large: textStyles.onCard.text.small,
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
            icons: colors.text,
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
          durations: ImpaktfullUiButtonDurationsTheme(
            loading: durations.short,
          ),
          textStyles: ImpaktfullUiButtonTextStylesTheme(
            primary: textStyles.onAccent.text.small.bold,
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
            borderError: colors.error,
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
          assets: ImpaktfullUiCheckboxAssetsTheme(
            check: assets.icons.check,
            indermediate: assets.icons.minus,
          ),
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
          durations: ImpaktfullUiCheckboxDurationsTheme(
            selected: durations.short,
          ),
        ),
        cmsHeader: ImpaktfullUiCmsHeaderTheme(
          assets: ImpaktfullUiCmsHeaderAssetsTheme(
            back: assets.icons.arrowLeft,
          ),
          colors: ImpaktfullUiCmsHeaderColorTheme(
            background: colors.card,
            border: colors.border,
            icons: colors.text,
          ),
          dimens: const ImpaktfullUiCmsHeaderDimensTheme(),
          shadows: ImpaktfullUiCmsHeaderShadowsTheme(
            background: shadows.extraSmall,
          ),
          textStyles: ImpaktfullUiCmsHeaderTextStylesTheme(
            title: textStyles.onCard.text.large,
            subtitle: textStyles.onCard.text.small.light,
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
        datePicker: ImpaktfullUiDatePickerTheme(
          assets: ImpaktfullUiDatePickerAssetsTheme(
            arrowLeft: assets.icons.arrowLeft,
            arrowRight: assets.icons.arrowRight,
          ),
          colors: ImpaktfullUiDatePickerColorTheme(
            selected: colors.accent,
            inRange: colors.accent.withOpacity(0.33),
          ),
          dimens: ImpaktfullUiDatePickerDimensTheme(
            borderRadius: dimens.borderRadius,
            borderRadiusRangeStart: dimens.borderRadius.copyWith(
              topEnd: Radius.zero,
              bottomEnd: Radius.zero,
            ),
            borderRadiusRangeEnd: dimens.borderRadius.copyWith(
              topStart: Radius.zero,
              bottomStart: Radius.zero,
            ),
            borderRadiusRangeBetween: BorderRadius.zero,
          ),
          textStyles: ImpaktfullUiDatePickerTextStyleTheme(
            headerTitle: textStyles.onCard.text.small.semiBold,
            weekday: textStyles.onCard.text.small.medium,
            cellInActive: textStyles.onCardTertiary.text.small.withOpacity(0.5),
            cell: textStyles.onCard.text.small,
            cellSelected: textStyles.onPrimary.text.small.semiBold,
          ),
        ),
        divider: ImpaktfullUiDividerTheme(
          colors: ImpaktfullUiDividerColorTheme(
            color: colors.border,
          ),
          dimens: const ImpaktfullUiDividerDimensTheme(
            margin: EdgeInsets.zero,
          ),
        ),
        dropdown: ImpaktfullUiDropdownTheme(
          colors: ImpaktfullUiDropdownColorTheme(
            menuBackground: colors.card,
            menuBorder: colors.border,
          ),
          shadows: ImpaktfullUiDropdownShadowTheme(
            overlay: shadows.large,
          ),
          dimens: ImpaktfullUiDropdownDimensTheme(
            borderRadius: dimens.borderRadius,
          ),
          assets: ImpaktfullUiDropdownAssetsTheme(
            dropDown: assets.icons.chevronDown,
            dropUp: assets.icons.chevronUp,
          ),
        ),
        filePicker: ImpaktfullUiFilePickerTheme(
          assets: ImpaktfullUiFilePickerAssetsTheme(
            delete: assets.icons.delete,
            file: assets.icons.file,
            upload: assets.icons.cloudUpload,
          ),
          colors: ImpaktfullUiFilePickerColorTheme(
            background: colors.card,
            icons: colors.text,
            progressIndicator: colors.accent,
            border: colors.border,
            borderDrop: colors.accent,
            borderError: colors.error,
          ),
          dimens: ImpaktfullUiFilePickerDimensTheme(
            borderRadius: dimens.borderRadius,
          ),
          textStyles: ImpaktfullUiFilePickerTextStyleTheme(
            title: textStyles.onCard.text.medium,
            subtitle: textStyles.onCard.text.small.light.withOpacity(0.66),
          ),
        ),
        floatingActionButton: ImpaktfullUiFloatingActionButtonTheme(
          assets: const ImpaktfullUiFloatingActionButtonAssetsTheme(),
          colors: ImpaktfullUiFloatingActionButtonColorTheme(
            background: colors.accent,
            backgroundDisabled: colors.accent.withOpacity(0.66),
            icon: colors.textOnAccent,
          ),
          dimens: ImpaktfullUiFloatingActionButtonDimensTheme(
            // borderRadius: dimens.borderRadius,
            borderRadius: dimens.borderRadiusCircle,
          ),
          textStyles: ImpaktfullUiFloatingActionButtonTextStyleTheme(
            label: textStyles.onAccent.text.small.bold,
          ),
        ),
        fluidPadding: const ImpaktfullUiFluidPaddingTheme(
          assets: ImpaktfullUiFluidPaddingAssetsTheme(),
          colors: ImpaktfullUiFluidPaddingColorTheme(),
          dimens: ImpaktfullUiFluidPaddingDimensTheme(
            breakPoints: [
              ImpaktfullUiFluidPaddingBreakPoint(
                label: 'Mobile',
                maxWidth: 600,
                padding: 16,
              ),
              ImpaktfullUiFluidPaddingBreakPoint(
                label: 'Tablet',
                minWidth: 600,
                maxWidth: 1024,
                paddingMin: 16,
                paddingMax: 64,
              ),
              ImpaktfullUiFluidPaddingBreakPoint(
                label: 'Desktop',
                minWidth: 1024,
                maxWidth: 1400,
                paddingMin: 64,
                paddingMax: 128,
              ),
              ImpaktfullUiFluidPaddingBreakPoint(
                label: 'Large Desktop',
                minWidth: 1400,
                maxWidth: 2000,
                paddingMin: 128,
                paddingMax: 256,
              ),
              ImpaktfullUiFluidPaddingBreakPoint(
                label: 'Ultra Wide Desktop',
                minWidth: 2000,
                paddingMin: 256,
                paddingMax: 512,
              ),
            ],
          ),
          textStyles: ImpaktfullUiFluidPaddingTextStyleTheme(),
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
        imageCrop: ImpaktfullUiImageCropTheme(
          assets: ImpaktfullUiImageCropAssetsTheme(
            delete: assets.icons.delete,
          ),
          colors: ImpaktfullUiImageCropColorTheme(
            deleteIcon: colors.card,
          ),
          dimens: const ImpaktfullUiImageCropDimensTheme(),
          textStyles: const ImpaktfullUiImageCropTextStyleTheme(),
        ),
        inputField: ImpaktfullUiInputFieldTheme(
          colors: ImpaktfullUiInputFieldColorTheme(
            background: colors.card,
            border: colors.border,
            borderError: colors.error,
            cursor: colors.accent,
            selection: colors.accent.withOpacity(0.3),
            selectionHandle: colors.accent,
          ),
          dimens: ImpaktfullUiInputFieldDimensTheme(
            borderRadius: dimens.borderRadius,
          ),
          textStyles: ImpaktfullUiInputFieldTextStylesTheme(
            text: textStyles.onCard.text.medium,
            placeholder: textStyles.onCardTertiary.text.medium.copyWith(
                color: textStyles.onCardTertiary.text.medium.color
                    ?.withOpacity(0.5)),
            hint: textStyles.onCardTertiary.text.small,
            error: textStyles.onCardDestructive.text.small.medium
                .copyWith(color: colors.error),
            label: textStyles.onCard.text.small.medium,
            action: textStyles.onCard.text.small.medium,
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
        loadingErrorData: ImpaktfullUiLoadingErrorDataTheme(
          assets: const ImpaktfullUiLoadingErrorDataAssetsTheme(),
          colors: const ImpaktfullUiLoadingErrorDataColorTheme(),
          dimens: const ImpaktfullUiLoadingErrorDataDimensTheme(),
          textStyles: ImpaktfullUiLoadingErrorDataTextStyleTheme(
            noDataTitle: textStyles.onCanvas.display.small.semiBold,
            noDataMessage: textStyles.onCanvas.text.small.light,
            errorTitle: textStyles.onCanvas.display.small.semiBold,
            errorMessage: textStyles.onCanvas.text.small.light,
          ),
        ),
        loadingIndicator: ImpaktfullUiLoadingIndicatorTheme(
          colors: ImpaktfullUiLoadingIndicatorColorTheme(color: colors.accent),
          assets: ImpaktfullUiLoadingIndicatorAssetTheme(
            lottie: assets.lotties.loading,
          ),
        ),
        markdown: ImpaktfullUiMarkdownTheme(
          assets: ImpaktfullUiMarkdownAssetsTheme(
            unorderedListBullet: assets.icons.wysiwygUnorderedListItem,
          ),
          colors: ImpaktfullUiMarkdownColorTheme(
            code: colors.card2,
            error: colors.error,
          ),
          dimens: ImpaktfullUiMarkdownDimensTheme(
            code: dimens.borderRadiusSmall,
          ),
          textStyles: ImpaktfullUiMarkdownTextStyleTheme(
            h1: textStyles.onCanvas.display.large.bold,
            h2: textStyles.onCanvas.display.medium.bold,
            h3: textStyles.onCanvas.display.small.bold,
            h4: textStyles.onCanvas.display.extraSmall.bold,
            h5: textStyles.onCanvas.display.extraSmall.medium,
            h6: textStyles.onCanvas.display.extraSmall,
            paragraph: textStyles.onCanvas.text.small,
            link: textStyles.onCanvasPrimary.text.small.bold.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: colors.accent,
              decorationThickness: 2,
            ),
            orderedList: textStyles.onCanvas.text.small.medium,
            unorderedList: textStyles.onCanvas.text.small.medium,
            code: textStyles.onCanvas.text.small,
            alt: textStyles.onCanvas.text.small.medium,
            error: textStyles.onCanvas.text.extraSmall
                .copyWith(color: colors.error),
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
        navBar: ImpaktfullUiNavBarTheme(
          assets: ImpaktfullUiNavBarAssetsTheme(
            back: assets.icons.arrowLeft,
            close: assets.icons.close,
          ),
          colors: ImpaktfullUiNavBarColorTheme(
            background: colors.card,
            icons: colors.text,
            border: colors.border,
          ),
          dimens: const ImpaktfullUiNavBarDimensTheme(),
          textStyles: ImpaktfullUiNavBarTextStyleTheme(
            title: textStyles.onCard.text.medium,
            subtitle: textStyles.onCard.text.small.light.withOpacity(0.66),
          ),
          shadows: ImpaktfullUiNavBarShadowsTheme(
            shadow: shadows.small,
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
            shadow: colors.shadow,
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
            opacity: durations.short,
          ),
          textStyles: ImpaktfullUiNotificationBadgeTextStyleTheme(
            text: textStyles.onPrimary.text.small,
          ),
        ),
        numberInput: ImpaktfullUiNumberInputTheme(
          assets: ImpaktfullUiNumberInputAssetsTheme(
            minus: assets.icons.minus,
            plus: assets.icons.add,
          ),
          colors: const ImpaktfullUiNumberInputColorTheme(),
          dimens: const ImpaktfullUiNumberInputDimensTheme(),
          textStyles: const ImpaktfullUiNumberInputTextStyleTheme(),
        ),
        pagination: ImpaktfullUiPaginationTheme(
          assets: ImpaktfullUiPaginationAssetsTheme(
            arrowLeft: assets.icons.arrowLeft,
            arrowRight: assets.icons.arrowRight,
          ),
          colors: const ImpaktfullUiPaginationColorTheme(),
          dimens: const ImpaktfullUiPaginationDimensTheme(),
          textStyles: ImpaktfullUiPaginationTextStyleTheme(
            text: textStyles.onCard.text.small,
          ),
        ),
        placeholderState: ImpaktfullUiPlaceholderStateTheme(
          assets: const ImpaktfullUiPlaceholderStateAssetsTheme(),
          colors: const ImpaktfullUiPlaceholderStateColorTheme(),
          dimens: const ImpaktfullUiPlaceholderStateDimensTheme(),
          textStyles: ImpaktfullUiPlaceholderStateTextStyleTheme(
            title: textStyles.onCanvas.display.small.semiBold,
            subtitle: textStyles.onCanvas.text.small.light,
          ),
        ),
        progressIndicator: ImpaktfullUiProgressIndicatorTheme(
          assets: const ImpaktfullUiProgressIndicatorAssetsTheme(),
          colors: ImpaktfullUiProgressIndicatorColorTheme(
            background: colors.canvas,
            foreground: colors.accent,
            border: colors.border,
          ),
          dimens: ImpaktfullUiProgressIndicatorDimensTheme(
            height: 8,
            borderRadius: dimens.borderRadiusExtraSmall,
          ),
          durations: ImpaktfullUiProgressIndicatorDurationsTheme(
            progress: durations.short,
          ),
          textStyles: ImpaktfullUiProgressIndicatorTextStyleTheme(
            text: textStyles.onCard.text.small.medium,
          ),
        ),
        radioButton: ImpaktfullUiRadioButtonTheme(
          assets: const ImpaktfullUiRadioButtonAssetsTheme(),
          colors: ImpaktfullUiRadioButtonColorTheme(
            selected: colors.accent,
            unselected: colors.card,
            border: colors.border,
            centerSelectedBackground: colors.card,
            centerUnSelectedBackground: Colors.transparent,
          ),
          dimens: ImpaktfullUiRadioButtonDimensTheme(
            borderRadius: dimens.borderRadiusCircle,
          ),
          textStyles: const ImpaktfullUiRadioButtonTextStyleTheme(),
        ),
        radioButtonListItem: ImpaktfullUiRadioButtonListItemTheme(
          assets: const ImpaktfullUiRadioButtonListItemAssetsTheme(),
          colors: ImpaktfullUiRadioButtonListItemColorTheme(
            icons: colors.primary,
          ),
          dimens: ImpaktfullUiRadioButtonListItemDimensTheme(
            borderRadius: dimens.borderRadiusCircle,
          ),
          textStyles: const ImpaktfullUiRadioButtonListItemTextStyleTheme(),
        ),
        refreshIndicator: ImpaktfullUiRefreshIndicatorTheme(
          colors: ImpaktfullUiRefreshIndicatorColorTheme(
              loadingIndicator: colors.accent),
        ),
        screen: ImpaktfullUiScreenTheme(
          assets: const ImpaktfullUiScreenAssetsTheme(),
          colors: ImpaktfullUiScreenColorTheme(
            background: colors.canvas,
          ),
          dimens: const ImpaktfullUiScreenDimensTheme(),
          textStyles: const ImpaktfullUiScreenTextStyleTheme(),
        ),
        sectionTitle: ImpaktfullUiSectionTitleTheme(
          assets: const ImpaktfullUiSectionTitleAssetsTheme(),
          colors: ImpaktfullUiSectionTitleColorTheme(
            icons: colors.text,
          ),
          dimens: const ImpaktfullUiSectionTitleDimensTheme(
            margin: EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              top: 16,
            ),
            marginWithIconButtonActions: EdgeInsetsDirectional.only(
              start: 16,
              end: 4,
            ),
          ),
          textStyles: ImpaktfullUiSectionTitleTextStyleTheme(
            title: textStyles.onCard.text.small.medium,
          ),
        ),
        selectableListItem: ImpaktfullUiSelectableListItemTheme(
          assets: ImpaktfullUiSelectableListItemAssetsTheme(
            check: assets.icons.check,
          ),
          colors: ImpaktfullUiSelectableListItemColorTheme(
            icons: colors.primary,
            selected: colors.accent,
            unselected: Colors.transparent,
          ),
          dimens: const ImpaktfullUiSelectableListItemDimensTheme(),
          durations: ImpaktfullUiSelectableListItemDurationsTheme(
            color: durations.short,
          ),
          textStyles: const ImpaktfullUiSelectableListItemTextStyleTheme(),
        ),
        separatedColumn: ImpaktfullUiSeparatedColumnTheme(
          assets: const ImpaktfullUiSeparatedColumnAssetsTheme(),
          colors: ImpaktfullUiSeparatedColumnColorTheme(
            background: colors.card,
            border: colors.border,
          ),
          dimens: ImpaktfullUiSeparatedColumnDimensTheme(
            borderRadius: dimens.borderRadius,
            titleMargin: const EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              top: 16,
            ),
            separatorMargin: const EdgeInsets.symmetric(horizontal: 16),
          ),
          textStyles: const ImpaktfullUiSeparatedColumnTextStyleTheme(),
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
            icons: colors.text,
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
            dropdownRotation: durations.short,
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
        skeleton: ImpaktfullUiSkeletonTheme(
          assets: const ImpaktfullUiSkeletonAssetsTheme(),
          colors: ImpaktfullUiSkeletonColorTheme(
            background: colors.card2,
          ),
          dimens: ImpaktfullUiSkeletonDimensTheme(
            borderRadius: dimens.borderRadius,
          ),
          textStyles: const ImpaktfullUiSkeletonTextStyleTheme(),
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
          assets: ImpaktfullUiSwitchAssetsTheme(
            active: assets.icons.check,
            inactive: assets.icons.close,
          ),
          colors: ImpaktfullUiSwitchColorTheme(
            activeBackgroundColor: colors.accent,
            inactiveBackgroundColor: colors.border,
            active: colors.card,
            inactive: colors.card,
            border: colors.border,
          ),
          dimens: ImpaktfullUiSwitchDimensTheme(
            borderRadius: dimens.borderRadius,
            thumbBorderRadius: dimens.borderRadiusExtraSmall,
            borderWidth: 0,
          ),
          durations: ImpaktfullUiSwitchDurationsTheme(
            selected: durations.short,
          ),
          textStyles: const ImpaktfullUiSwitchTextStyleTheme(),
        ),
        switchListItem: ImpaktfullUiSwitchListItemTheme(
          assets: const ImpaktfullUiSwitchListItemAssetsTheme(),
          colors: ImpaktfullUiSwitchListItemColorTheme(
            icons: colors.primary,
          ),
          dimens: const ImpaktfullUiSwitchListItemDimensTheme(),
          textStyles: const ImpaktfullUiSwitchListItemTextStyleTheme(),
        ),
        tabBar: const ImpaktfullUiTabBarTheme(
          assets: ImpaktfullUiTabBarAssetsTheme(),
          colors: ImpaktfullUiTabBarColorTheme(),
          dimens: ImpaktfullUiTabBarDimensTheme(),
          textStyles: ImpaktfullUiTabBarTextStyleTheme(),
        ),
        tabBarItem: ImpaktfullUiTabBarItemTheme(
          assets: const ImpaktfullUiTabBarItemAssetsTheme(),
          colors: ImpaktfullUiTabBarItemColorTheme(background: colors.card),
          dimens: ImpaktfullUiTabBarItemDimensTheme(
            selectedMarkerBorderRadius: dimens.borderRadius,
          ),
          durations: ImpaktfullUiTabBarItemDurationsTheme(
            selected: durations.short,
          ),
          textStyles: ImpaktfullUiTabBarItemTextStyleTheme(
            label: textStyles.onCard.text.small.medium,
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
        timePicker: const ImpaktfullUiTimePickerTheme(
          assets: ImpaktfullUiTimePickerAssetsTheme(),
          colors: ImpaktfullUiTimePickerColorTheme(),
          dimens: ImpaktfullUiTimePickerDimensTheme(),
          textStyles: ImpaktfullUiTimePickerTextStyleTheme(),
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
            wait: durations.long,
          ),
          assets: const ImpaktfullUiTooltipAssetsTheme(),
        ),
        wysiwyg: ImpaktfullUiWysiwygTheme(
          assets: ImpaktfullUiWysiwygAssetsTheme(
            bold: assets.icons.wysiwygBold,
            code: assets.icons.wysiwygCode,
            codeBlock: assets.icons.wysiwygCodeBlock,
            header: assets.icons.wysiwygHeader,
            italic: assets.icons.wysiwygItalic,
            orderedList: assets.icons.wysiwygOrderedList,
            unorderedList: assets.icons.wysiwygUnorderedList,
            link: assets.icons.wysiwygLink,
            photo: assets.icons.wysiwygPhoto,
          ),
          colors: const ImpaktfullUiWysiwygColorTheme(),
          dimens: const ImpaktfullUiWysiwygDimensTheme(),
          textStyles: ImpaktfullUiWysiwygTextStyleTheme(
            previewText: textStyles.onCanvas.text.small,
          ),
        ),
      ),
    );
  }
}
