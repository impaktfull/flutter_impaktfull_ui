import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/badge/badge_style.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/card/card.dart';
import 'package:impaktfull_ui_2/src/components/checkbox/checkbox.dart';
import 'package:impaktfull_ui_2/src/components/cms_header/cms_header.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/dropdown/dropdown.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tab/horizontal_tab.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tabs/horizontal_tabs.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view_style.dart';
import 'package:impaktfull_ui_2/src/components/loading_indicator/loading_indicator_style.dart';
import 'package:impaktfull_ui_2/src/components/modal/modal.dart';
import 'package:impaktfull_ui_2/src/components/refresh_indicator/refresh_indicator_style.dart';
import 'package:impaktfull_ui_2/src/components/snacky/snacky_configurator_style.dart';
import 'package:impaktfull_ui_2/src/components/table/table.dart';
import 'package:impaktfull_ui_2/src/components/table_header/table_header.dart';
import 'package:impaktfull_ui_2/src/components/table_header_item/table_header_item.dart';
import 'package:impaktfull_ui_2/src/components/table_row/table_row.dart';
import 'package:impaktfull_ui_2/src/components/table_row_item/table_row_item.dart';
import 'package:impaktfull_ui_2/src/theme/asset_theme.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class DefaultTheme {
  static ImpaktfullUiTheme withMinimalChanges({
    required Color accent,
    required Color secondary,
    required BorderRadius borderRadius,
    required BorderRadius borderRadiusSmall,
    String package = 'impaktfull_ui_2',
  }) {
    final colors = ImpaktfullUiColorTheme(
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
      warning: const Color(0xFFB54708),
      error: const Color(0xFFB42318),
      info: const Color(0xFF1C90D4),
      success: const Color(0xFF067647),
    );
    final dimens = ImpaktfullUiDimensTheme(
      borderRadius: borderRadius,
      borderRadiusSmall: borderRadiusSmall,
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
        ),
        button: ImpaktfullUiButtonTheme(
          colors: ImpaktfullUiButtonColorTheme(
            primary: colors.accent,
            primaryBorder: colors.accent,
            secondary: colors.card,
            secondaryBorder: colors.border,
            tertiary: null,
            tertiaryBorder: null,
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
            activeColor: colors.accent,
            inactiveColor: colors.card,
            checkMarkColor: colors.textOnAccent,
            backgroundColor: colors.card,
          ),
          dimens: ImpaktfullUiCheckboxDimensTheme(
            borderRadius: dimens.borderRadiusSmall,
          ),
        ),
        cmsHeader: ImpaktfullUiCmsHeaderTheme(
          colors: ImpaktfullUiCmsHeaderColorTheme(
            background: colors.card,
            border: colors.border,
          ),
          dimens: const ImpaktfullUiCmsHeaderDimensTheme(),
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
          dimens: const ImpaktfullUiDropdownDimensTheme(),
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
            hint: textStyles.onCardSecondary.text.medium
                .copyWith(color: textStyles.onCardTertiary.text.medium.color?.withOpacity(0.5)),
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
        modal: const ImpaktfullUiModalTheme(
          colors: ImpaktfullUiModalColorTheme(),
          textStyles: ImpaktfullUiModalTextStyleTheme(),
          dimens: ImpaktfullUiModalDimensTheme(),
        ),
        refreshIndicator: ImpaktfullUiRefreshIndicatorTheme(
          colors: ImpaktfullUiRefreshIndicatorColorTheme(loadingIndicator: colors.accent),
        ),
        snackyConfigurator: ImpaktfullUiSnackyConfiguratorTheme(
          colors: ImpaktfullUiSnackyConfiguratorColorTheme(
            error: colors.error,
            info: colors.info,
            warning: colors.warning,
            success: colors.success,
          ),
          dimens: ImpaktfullUiSnackyConfiguratorDimensTheme(
            borderRadius: borderRadius,
          ),
          textStyles: const ImpaktfullUiSnackyConfiguratorTextStylesTheme(),
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
      ),
    );
  }
}
