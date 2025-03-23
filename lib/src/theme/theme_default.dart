import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/accordion/accordion.dart';
import 'package:impaktfull_ui/src/components/auto_complete/auto_complete.dart';
import 'package:impaktfull_ui/src/components/avatar/avatar.dart';
import 'package:impaktfull_ui/src/components/badge/badge.dart';
import 'package:impaktfull_ui/src/components/bottom_actions/bottom_actions.dart';
import 'package:impaktfull_ui/src/components/bottom_navigation/bottom_navigation.dart';
import 'package:impaktfull_ui/src/components/bottom_navigation_item/bottom_navigation_item.dart';
import 'package:impaktfull_ui/src/components/bottom_sheet/bottom_sheet.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui/src/components/card/card.dart';
import 'package:impaktfull_ui/src/components/carrousel/carrousel.dart';
import 'package:impaktfull_ui/src/components/chat/chat.dart';
import 'package:impaktfull_ui/src/components/checkbox/checkbox.dart';
import 'package:impaktfull_ui/src/components/cms_header/cms_header.dart';
import 'package:impaktfull_ui/src/components/color_input_field/color_input_field_style.dart';
import 'package:impaktfull_ui/src/components/color_picker/color_picker.dart';
import 'package:impaktfull_ui/src/components/command_menu/command_menu.dart';
import 'package:impaktfull_ui/src/components/confetti/confetti.dart';
import 'package:impaktfull_ui/src/components/date_input_field/date_input_field.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui/src/components/date_time_picker/date_time_picker.dart';
import 'package:impaktfull_ui/src/components/divider/divider.dart';
import 'package:impaktfull_ui/src/components/dropdown/dropdown.dart';
import 'package:impaktfull_ui/src/components/file_picker/file_picker.dart';
import 'package:impaktfull_ui/src/components/floating_action_button/floating_action_button.dart';
import 'package:impaktfull_ui/src/components/fluid_padding/fluid_padding.dart';
import 'package:impaktfull_ui/src/components/gallery/gallery.dart';
import 'package:impaktfull_ui/src/components/grid_view/grid_view.dart';
import 'package:impaktfull_ui/src/components/horizontal_tab/horizontal_tab.dart';
import 'package:impaktfull_ui/src/components/horizontal_tabs/horizontal_tabs.dart';
import 'package:impaktfull_ui/src/components/image_crop/image_crop.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/components/introduction/introduction.dart';
import 'package:impaktfull_ui/src/components/line_chart/line_chart.dart';
import 'package:impaktfull_ui/src/components/list_item/list_item.dart';
import 'package:impaktfull_ui/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui/src/components/loading_error_data/loading_error_data.dart';
import 'package:impaktfull_ui/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui/src/components/metric/metric.dart';
import 'package:impaktfull_ui/src/components/modal/modal.dart';
import 'package:impaktfull_ui/src/components/nav_bar/nav_bar.dart';
import 'package:impaktfull_ui/src/components/network_image/network_image.dart';
import 'package:impaktfull_ui/src/components/notification/notification.dart';
import 'package:impaktfull_ui/src/components/notification_badge/notification_badge.dart';
import 'package:impaktfull_ui/src/components/number_input/number_input.dart';
import 'package:impaktfull_ui/src/components/option_selector/option_selector.dart';
import 'package:impaktfull_ui/src/components/pagination/pagination.dart';
import 'package:impaktfull_ui/src/components/password_strength_indicator/password_strength_indicator.dart';
import 'package:impaktfull_ui/src/components/pin_code/pin_code.dart';
import 'package:impaktfull_ui/src/components/placeholder/placeholder.dart';
import 'package:impaktfull_ui/src/components/progress_indicator/progress_indicator_style.dart';
import 'package:impaktfull_ui/src/components/radio_button/radio_button.dart';
import 'package:impaktfull_ui/src/components/radio_button_list_item/radio_button_list_item.dart';
import 'package:impaktfull_ui/src/components/refresh_indicator/refresh_indicator.dart';
import 'package:impaktfull_ui/src/components/responsive_layout/responsive_layout.dart';
import 'package:impaktfull_ui/src/components/screen/screen.dart';
import 'package:impaktfull_ui/src/components/section_title/section_title.dart';
import 'package:impaktfull_ui/src/components/segmented_control/segmented_control.dart';
import 'package:impaktfull_ui/src/components/selectable_list_item/selectable_list_item.dart';
import 'package:impaktfull_ui/src/components/separated_column/separated_column.dart';
import 'package:impaktfull_ui/src/components/sidebar_navigation/sidebar_navigation.dart';
import 'package:impaktfull_ui/src/components/sidebar_navigation_item/sidebar_navigation_item.dart';
import 'package:impaktfull_ui/src/components/simple_list_item/simple_list_item.dart';
import 'package:impaktfull_ui/src/components/skeleton/skeleton.dart';
import 'package:impaktfull_ui/src/components/slider/slider.dart';
import 'package:impaktfull_ui/src/components/snacky/snacky_configurator.dart';
import 'package:impaktfull_ui/src/components/stepper/stepper_style.dart';
import 'package:impaktfull_ui/src/components/switch/switch.dart';
import 'package:impaktfull_ui/src/components/switch_list_item/switch_list_item.dart';
import 'package:impaktfull_ui/src/components/tab_bar/tab_bar.dart';
import 'package:impaktfull_ui/src/components/tab_bar_item/tab_bar_item.dart';
import 'package:impaktfull_ui/src/components/table/table.dart';
import 'package:impaktfull_ui/src/components/table_header/table_header.dart';
import 'package:impaktfull_ui/src/components/table_header_item/table_header_item.dart';
import 'package:impaktfull_ui/src/components/table_row/table_row.dart';
import 'package:impaktfull_ui/src/components/table_row_item/table_row_item.dart';
import 'package:impaktfull_ui/src/components/time_picker/time_picker.dart';
import 'package:impaktfull_ui/src/components/tooltip/tooltip.dart';
import 'package:impaktfull_ui/src/components/unified_screen_layout/unified_screen_layout.dart';
import 'package:impaktfull_ui/src/components/virtual_keyboard/virtual_keyboard.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/wysiwyg.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/device_util/device_util.dart';
import 'package:impaktfull_ui/src/util/extension/border_radius_geometry_extension.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DefaultTheme {
  static ImpaktfullUiTheme<T> withMinimalChanges<T extends Object>({
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
    Color? textOnAccent,
    Color? textOnSecondary,
    Color? textOnDestructive,
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
    T? customTheme,
  }) {
    final colors = ImpaktfullUiColorTheme(
      primary: primary,
      accent: accent,
      secondary: secondary,
      tertiary: tertiary ?? const Color(0xFF475467),
      canvas: canvas ?? const Color(0xFFF9FAFB),
      card: card ?? const Color(0xFFFFFFFF),
      border: border ?? Colors.grey.withOpacityPercentage(0.2),
      card2: card2 ?? Colors.grey.withOpacityPercentage(0.2),
      shadow: shadow ?? Colors.black12,
      text: text ?? const Color(0xFF344054),
      //todo check if color requires white or black if not provided
      textOnPrimary: textOnPrimary ?? const Color(0xFFFFFFFF),
      textOnAccent: textOnAccent ?? const Color(0xFFFFFFFF),
      textOnSecondary: textOnSecondary ?? const Color(0xFFFFFFFF),
      textOnDestructive: textOnDestructive ?? const Color(0xFFFFFFFF),
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
      onCanvasAccent: ImpaktfullUiTextStyleTheme.getByColor(
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
      onCardAccent: ImpaktfullUiTextStyleTheme.getByColor(
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
      customTheme: customTheme,
      assets: assets,
      colors: colors,
      textStyles: textStyles,
      dimens: dimens,
      durations: durations,
      shadows: shadows,
      components: ImpaktfullUiComponentsTheme(
        accordion: ImpaktfullUiAccordionTheme(
          assets: ImpaktfullUiAccordionAssetsTheme(
            chevronDown: assets.icons.chevronDown,
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
            primaryBackground: colors.accent.withOpacityPercentage(0.05),
            secondaryText: colors.secondary,
            secondaryBorder: colors.secondary.withOpacityPercentage(0.5),
            secondaryBackground: colors.secondary.withOpacityPercentage(0.05),
            neutralText: colors.text,
            neutralBorder: colors.border,
            neutralBackground: colors.border.withOpacityPercentage(0.05),
            errorText: colors.error,
            errorBorder: colors.error.withOpacityPercentage(0.5),
            errorBackground: colors.error.withOpacityPercentage(0.05),
            warningText: colors.warning,
            warningBorder: colors.warning.withOpacityPercentage(0.5),
            warningBackground: colors.warning.withOpacityPercentage(0.05),
            successText: colors.success,
            successBorder: colors.success.withOpacityPercentage(0.5),
            successBackground: colors.success.withOpacityPercentage(0.05),
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
        bottomActions: ImpaktfullUiBottomActionsTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        bottomNavigation: ImpaktfullUiBottomNavigationTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        bottomNavigationItem: ImpaktfullUiBottomNavigationItemTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
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
        button: ImpaktfullUiButtonTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        calendar: ImpaktfullUiCalendarTheme(
          assets: ImpaktfullUiCalendarAssetsTheme(
            chevronLeft: assets.icons.chevronLeft,
            chevronRight: assets.icons.chevronRight,
          ),
          colors: ImpaktfullUiCalendarColorTheme(
            divider: colors.border,
            headerBackground: colors.card,
            eventBackground: colors.card,
          ),
          dimens: const ImpaktfullUiCalendarDimensTheme(
            dividerHeight: 1,
            sectionTitleWidth: 60,
            weekHourHeight: 75,
            weekEventMinHeightSmall: 40,
            weekEventMinHeightExtraSmall: 25,
          ),
          textStyles: ImpaktfullUiCalendarTextStyleTheme(
            sectionTitle: textStyles.onCanvas.text.small.semiBold,
            sectionSubtitle: textStyles.onCanvasTertiary.text.extraSmall.light,
            listItemTitle: textStyles.onCard.text.small,
            listItemTitleSmall: textStyles.onCard.text.extraSmall,
            listItemSubtitle: textStyles.onCanvasTertiary.text.small.light,
            listItemSubtitleSmall:
                textStyles.onCanvasTertiary.text.extraSmall.light,
            dayTitle: textStyles.onCanvas.text.extraSmall.semiBold,
            dayOfTheWeekTitle: textStyles.onCanvas.text.extraSmall,
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
        carrousel: ImpaktfullUiCarrouselTheme(
          assets: const ImpaktfullUiCarrouselAssetsTheme(),
          colors: ImpaktfullUiCarrouselColorTheme(
            indicatorBorder: colors.border,
            activeIndicator: colors.accent,
            inactiveIndicator: colors.card,
          ),
          dimens: ImpaktfullUiCarrouselDimensTheme(
            indicatorBorderRadius: dimens.borderRadiusCircle,
            indicatorPadding: const EdgeInsets.all(8),
            indicatorSize: 8,
            indicatorSpacing: const EdgeInsets.symmetric(horizontal: 4),
          ),
          textStyles: const ImpaktfullUiCarrouselTextStyleTheme(),
        ),
        chat: ImpaktfullUiChatTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
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
            drawerMenu: assets.icons.list,
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
        colorInputField: ImpaktfullUiColorInputFieldTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
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
        confetti: ImpaktfullUiConfettiTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        dateInputField: ImpaktfullUiDateInputFieldTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        datePicker: ImpaktfullUiDatePickerTheme(
          assets: ImpaktfullUiDatePickerAssetsTheme(
            arrowLeft: assets.icons.arrowLeft,
            arrowRight: assets.icons.arrowRight,
          ),
          colors: ImpaktfullUiDatePickerColorTheme(
            selected: colors.accent,
            inRange: colors.accent.withOpacityPercentage(0.33),
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
        dateTimePicker: ImpaktfullUiDateTimePickerTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
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
            backgroundDisabled: colors.accent.withOpacityPercentage(0.66),
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
        gallery: ImpaktfullUiGalleryTheme.defaultTheme(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        gridView: ImpaktfullUiGridViewTheme(
          assets: const ImpaktfullUiGridViewAssetsTheme(),
          colors: const ImpaktfullUiGridViewColorTheme(),
          dimens: const ImpaktfullUiGridViewDimensTheme(),
          textStyles: ImpaktfullUiGridViewTextStyleTheme(
            title: textStyles.onCanvas.display.small,
          ),
        ),
        horizontalTab: ImpaktfullUiHorizontalTabTheme(
          colors: ImpaktfullUiHorizontalTabColorTheme(
            backgroundUnSelectedTab: colors.card,
            backgroundSelectedTab: colors.accent.withOpacityPercentage(0.33),
          ),
          dimens: ImpaktfullUiHorizontalTabDimensTheme(
            borderRadius: dimens.borderRadius,
          ),
          textStyles: ImpaktfullUiHorizontalTabTextStylesTheme(
            selected: textStyles.onCardAccent.text.small.semiBold,
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
        inputField: ImpaktfullUiInputFieldTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        introduction: ImpaktfullUiIntroductionTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        lineChart: ImpaktfullUiLineChartTheme(
          assets: const ImpaktfullUiLineChartAssetsTheme(),
          colors: ImpaktfullUiLineChartColorTheme(
            lineColor: colors.accent,
            backgroundColor: Colors.transparent,
          ),
          dimens: const ImpaktfullUiLineChartDimensTheme(
            strokeWidth: 2,
          ),
          textStyles: const ImpaktfullUiLineChartTextStyleTheme(),
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
        loadingErrorData: ImpaktfullUiLoadingErrorDataTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        loadingIndicator: ImpaktfullUiLoadingIndicatorTheme(
          colors: ImpaktfullUiLoadingIndicatorColorTheme(color: colors.accent),
          assets: ImpaktfullUiLoadingIndicatorAssetTheme(
            lottie: assets.lotties.loading,
          ),
        ),
        markdown: ImpaktfullUiMarkdownTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        metric: ImpaktfullUiMetricTheme(
          assets: ImpaktfullUiMetricAssetsTheme(
            more: DeviceUtil.isAndroid()
                ? assets.icons.moreVertical
                : assets.icons.moreHorizontal,
          ),
          colors: const ImpaktfullUiMetricColorTheme(),
          dimens: const ImpaktfullUiMetricDimensTheme(),
          textStyles: ImpaktfullUiMetricTextStyleTheme(
            title: textStyles.onCard.text.small,
            value: textStyles.onCard.text.extraLarge.medium,
            value2Growth:
                textStyles.onCard.text.small.copyWith(color: colors.success),
            value2Neutral:
                textStyles.onCard.text.small.copyWith(color: colors.text),
            value2Decline:
                textStyles.onCard.text.small.copyWith(color: colors.error),
            value2Branded:
                textStyles.onCard.text.small.copyWith(color: colors.accent),
            value2Custom: textStyles.onCard.text.small,
          ),
        ),
        modal: ImpaktfullUiModalTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        navBar: ImpaktfullUiNavBarTheme(
          assets: ImpaktfullUiNavBarAssetsTheme(
            back: assets.icons.arrowLeft,
            drawerMenu: assets.icons.list,
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
        notification: ImpaktfullUiNotificationTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          shadows: shadows,
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
        optionSelector: ImpaktfullUiOptionSelectorTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
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
        passwordStrengthIndicator:
            ImpaktfullUiPasswordStrengthIndicatorTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        pinCode: ImpaktfullUiPinCodeTheme(
          assets: ImpaktfullUiPinCodeAssetsTheme(
            backspace: assets.icons.backspace,
            check: assets.icons.check,
          ),
          colors: ImpaktfullUiPinCodeColorTheme(
            valueBackgroundSelected: colors.accent,
            valueBackground: colors.card,
            valueBorder: colors.border,
          ),
          dimens: ImpaktfullUiPinCodeDimensTheme(
            valueBorderRadius: dimens.borderRadius,
          ),
          durations: ImpaktfullUiPinCodeDurationsTheme(
            submitOpacity: durations.short,
          ),
          textStyles: const ImpaktfullUiPinCodeTextStyleTheme(),
        ),
        placeholder: ImpaktfullUiPlaceholderTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
        ),
        progressIndicator: ImpaktfullUiProgressIndicatorTheme(
          assets: const ImpaktfullUiProgressIndicatorAssetsTheme(),
          colors: ImpaktfullUiProgressIndicatorColorTheme(
            background: colors.canvas,
            foreground: colors.accent,
            border: colors.border,
          ),
          dimens: ImpaktfullUiProgressIndicatorDimensTheme(
            width: 4,
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
        responsiveLayout: const ImpaktfullUiResponsiveLayoutTheme(
          assets: ImpaktfullUiResponsiveLayoutAssetsTheme(),
          colors: ImpaktfullUiResponsiveLayoutColorTheme(),
          dimens: ImpaktfullUiResponsiveLayoutDimensTheme(
            breakpointSmall: 600,
            breakpointMedium: 1024,
            breakpointLarge: 1440,
            breakpointExtraLarge: 1920,
          ),
          textStyles: ImpaktfullUiResponsiveLayoutTextStyleTheme(),
        ),
        screen: ImpaktfullUiScreenTheme(
          assets: const ImpaktfullUiScreenAssetsTheme(),
          colors: ImpaktfullUiScreenColorTheme(
            background: colors.canvas,
          ),
          dimens: const ImpaktfullUiScreenDimensTheme(),
          textStyles: const ImpaktfullUiScreenTextStyleTheme(),
        ),
        sectionTitle: ImpaktfullUiSectionTitleTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        segmentedControl: ImpaktfullUiSegmentedControlTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
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
            chevronDown: assets.icons.chevronDown,
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
        slider: ImpaktfullUiSliderTheme(
          assets: const ImpaktfullUiSliderAssetsTheme(),
          colors: ImpaktfullUiSliderColorTheme(
            thumb: colors.accent,
            thumbBorder: colors.border,
            track: colors.card,
            trackBorder: colors.border,
            activeTrack: colors.accent,
          ),
          dimens: ImpaktfullUiSliderDimensTheme(
            trackBorderRadius: dimens.borderRadiusSmall,
            thumbBorderRadius: dimens.borderRadiusExtraSmall,
          ),
          textStyles: const ImpaktfullUiSliderTextStyleTheme(),
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
        stepper: ImpaktfullUiStepperTheme(
          assets: const ImpaktfullUiStepperAssetsTheme(),
          colors: ImpaktfullUiStepperColorTheme(
            activeStep: colors.accent,
            inactiveStep: colors.border,
            assetBorder: colors.border,
            assetBackground: colors.card,
            assetColor: colors.text,
            assetBorderCompleted: colors.accent,
            assetBackgroundCompleted: colors.accent,
            assetColorCompleted: colors.textOnAccent,
          ),
          dimens: ImpaktfullUiStepperDimensTheme(
            spacing: 8,
            height: 8,
            borderRadius: dimens.borderRadius,
          ),
          textStyles: ImpaktfullUiStepperTextStyleTheme(
            title: textStyles.onCard.text.small.medium,
            subtitle: textStyles.onCard.text.small.light,
          ),
        ),
        switchTheme: ImpaktfullUiSwitchTheme(
          assets: ImpaktfullUiSwitchAssetsTheme(
            active: assets.icons.check,
            inactive: assets.icons.close,
          ),
          colors: ImpaktfullUiSwitchColorTheme(
            activeBackground: colors.accent,
            inactiveBackground: colors.border,
            active: colors.card,
            inactive: colors.card,
            border: colors.border,
            accessibleInactiveIcon: colors.text,
            accessibleActiveIcon: colors.accent,
          ),
          dimens: ImpaktfullUiSwitchDimensTheme(
            borderRadius: dimens.borderRadius,
            thumbBorderRadius: dimens.borderRadiusExtraSmall,
            borderWidth: 0,
            verticalPadding: 4,
            horizontalPadding: 20,
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
        unifiedScreenLayout: const ImpaktfullUiUnifiedScreenLayoutTheme(
          assets: ImpaktfullUiUnifiedScreenLayoutAssetsTheme(),
          colors: ImpaktfullUiUnifiedScreenLayoutColorTheme(),
          dimens: ImpaktfullUiUnifiedScreenLayoutDimensTheme(
            centerWidthFactor: 0.5,
            centerMaxWidth: 700,
            centerMinWidth: 500,
            centerPadding: EdgeInsets.all(16),
          ),
          textStyles: ImpaktfullUiUnifiedScreenLayoutTextStyleTheme(),
        ),
        virtualKeyboard: ImpaktfullUiVirtualKeyboardTheme.getDefault(
          assets: assets,
          colors: colors,
          dimens: dimens,
          textStyles: textStyles,
          durations: durations,
          shadows: shadows,
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
