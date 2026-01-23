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
import 'package:impaktfull_ui/src/components/check_box_list_item/check_box_list_item.dart';
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
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
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
    Color? textSecondary,
    Color? textTertiary,
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
      textSecondary: textSecondary ?? secondary,
      textTertiary: textTertiary ?? tertiary ?? const Color(0xFF999b9e),
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
        color: colors.textSecondary,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
      onCanvasTertiary: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.textTertiary,
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
        color: colors.textSecondary,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
      ),
      onCardTertiary: ImpaktfullUiTextStyleTheme.getByColor(
        color: colors.textTertiary,
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
        accordion: ImpaktfullUiAccordionTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        avatar: ImpaktfullUiAvatarTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        autoComplete: ImpaktfullUiAutoCompleteTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        badge: ImpaktfullUiBadgeTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
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
        bottomSheet: ImpaktfullUiBottomSheetTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        button: ImpaktfullUiButtonTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        calendar: ImpaktfullUiCalendarTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        card: ImpaktfullUiCardTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        carrousel: ImpaktfullUiCarrouselTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        chat: ImpaktfullUiChatTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        checkbox: ImpaktfullUiCheckboxTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        checkBoxListItem: ImpaktfullUiCheckBoxListItemTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        cmsHeader: ImpaktfullUiCmsHeaderTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        colorInputField: ImpaktfullUiColorInputFieldTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        colorPicker: ImpaktfullUiColorPickerTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        commandMenu: ImpaktfullUiCommandMenuTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
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
        datePicker: ImpaktfullUiDatePickerTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        dateTimePicker: ImpaktfullUiDateTimePickerTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        divider: ImpaktfullUiDividerTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        dropdown: ImpaktfullUiDropdownTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        filePicker: ImpaktfullUiFilePickerTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        floatingActionButton: ImpaktfullUiFloatingActionButtonTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        fluidPadding: ImpaktfullUiFluidPaddingTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        gallery: ImpaktfullUiGalleryTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        gridView: ImpaktfullUiGridViewTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        horizontalTab: ImpaktfullUiHorizontalTabTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        horizontalTabs: ImpaktfullUiHorizontalTabsTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        imageCrop: ImpaktfullUiImageCropTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
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
        lineChart: ImpaktfullUiLineChartTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        listItem: ImpaktfullUiListItemTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        listView: ImpaktfullUiListViewTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        loadingErrorData: ImpaktfullUiLoadingErrorDataTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        loadingIndicator: ImpaktfullUiLoadingIndicatorTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        markdown: ImpaktfullUiMarkdownTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        metric: ImpaktfullUiMetricTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
          moreIcon: DeviceUtil.isAndroid()
              ? assets.icons.moreVertical
              : assets.icons.moreHorizontal,
        ),
        modal: ImpaktfullUiModalTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        navBar: ImpaktfullUiNavBarTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        networkImage: ImpaktfullUiNetworkImageTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        notification: ImpaktfullUiNotificationTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          shadows: shadows,
        ),
        notificationBadge: ImpaktfullUiNotificationBadgeTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        numberInput: ImpaktfullUiNumberInputTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        optionSelector: ImpaktfullUiOptionSelectorTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        pagination: ImpaktfullUiPaginationTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
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
        pinCode: ImpaktfullUiPinCodeTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        placeholder: ImpaktfullUiPlaceholderTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
        ),
        progressIndicator: ImpaktfullUiProgressIndicatorTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        radioButton: ImpaktfullUiRadioButtonTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        radioButtonListItem: ImpaktfullUiRadioButtonListItemTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        refreshIndicator: ImpaktfullUiRefreshIndicatorTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        responsiveLayout: ImpaktfullUiResponsiveLayoutTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        screen: ImpaktfullUiScreenTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
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
        selectableListItem: ImpaktfullUiSelectableListItemTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        separatedColumn: ImpaktfullUiSeparatedColumnTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        sidebarNavigation: ImpaktfullUiSidebarNavigationTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        sidebarNavigationItem:
            ImpaktfullUiSidebarNavigationItemTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        simpleListItem: ImpaktfullUiSimpleListItemTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        skeleton: ImpaktfullUiSkeletonTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        slider: ImpaktfullUiSliderTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        snackyConfigurator: ImpaktfullUiSnackyConfiguratorTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
          brandedIcon: ImpaktfullUiAsset.icon(PhosphorIcons.confetti()),
        ),
        stepper: ImpaktfullUiStepperTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        switchTheme: ImpaktfullUiSwitchTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        switchListItem: ImpaktfullUiSwitchListItemTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        tabBar: ImpaktfullUiTabBarTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        tabBarItem: ImpaktfullUiTabBarItemTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        table: ImpaktfullUiTableTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        tableHeader: ImpaktfullUiTableHeaderTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        tableHeaderItem: ImpaktfullUiTableHeaderItemTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        tableRow: ImpaktfullUiTableRowTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        tableRowItem: ImpaktfullUiTableRowItemTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        timePicker: ImpaktfullUiTimePickerTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        tooltip: ImpaktfullUiTooltipTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        unifiedScreenLayout: ImpaktfullUiUnifiedScreenLayoutTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
        virtualKeyboard: ImpaktfullUiVirtualKeyboardTheme.getDefault(
          assets: assets,
          colors: colors,
          dimens: dimens,
          textStyles: textStyles,
          durations: durations,
          shadows: shadows,
        ),
        wysiwyg: ImpaktfullUiWysiwygTheme.getDefault(
          assets: assets,
          colors: colors,
          textStyles: textStyles,
          dimens: dimens,
          durations: durations,
          shadows: shadows,
        ),
      ),
    );
  }
}
