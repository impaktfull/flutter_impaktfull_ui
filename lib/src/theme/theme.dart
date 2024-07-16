import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/badge/badge_style.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/card/card.dart';
import 'package:impaktfull_ui_2/src/components/cms_header/cms_header.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tab/horizontal_tab.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tabs/horizontal_tabs.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/table/table.dart';
import 'package:impaktfull_ui_2/src/components/table_header/table_header.dart';
import 'package:impaktfull_ui_2/src/components/table_header_item/table_header_item.dart';
import 'package:impaktfull_ui_2/src/components/table_row/table_row.dart';
import 'package:impaktfull_ui_2/src/components/table_row_item/table_row_item.dart';

class ImpaktfullUiTheme {
  final ImpaktfullUiColorTheme colors;
  final ImpaktfullUiTextStylesTheme textStyles;
  final ImpaktfullUiDimensTheme dimens;
  final ImpaktfullUiShadowsTheme shadows;
  final ImpaktfullUiComponentsTheme components;

  static var _theme = ImpaktfullUiTheme.getDefault();

  const ImpaktfullUiTheme({
    required this.colors,
    required this.textStyles,
    required this.dimens,
    required this.shadows,
    required this.components,
  });

  static ImpaktfullUiTheme getDefault() => byColor(
        accent: const Color(0xFF7d64f2),
        secondary: const Color(0xFF7d64f2),
        borderRadius: BorderRadius.circular(8),
      );

  static ImpaktfullUiTheme byColor({
    required Color accent,
    required Color secondary,
    required BorderRadius borderRadius,
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
      textOnPrimary: const Color(0xFFFFFFFF),
      textOnSecondary: const Color(0xFF344054),
      warning: const Color(0xFFB54708),
      error: const Color(0xFFB42318),
      success: const Color(0xFF067647),
    );
    final dimens = ImpaktfullUiDimensTheme(
      borderRadius: borderRadius,
    );
    final textStyles = ImpaktfullUiTextStylesTheme(
      onCanvas: ImpaktfullUiTextStyleTheme.getByColor(colors.text),
      onCanvasPrimary: ImpaktfullUiTextStyleTheme.getByColor(colors.accent),
      onCanvasSecondary: ImpaktfullUiTextStyleTheme.getByColor(colors.secondary),
      onCanvasTertiary: ImpaktfullUiTextStyleTheme.getByColor(colors.tertiary),
      onCard: ImpaktfullUiTextStyleTheme.getByColor(colors.text),
      onCardPrimary: ImpaktfullUiTextStyleTheme.getByColor(colors.accent),
      onCardSecondary: ImpaktfullUiTextStyleTheme.getByColor(colors.secondary),
      onCardTertiary: ImpaktfullUiTextStyleTheme.getByColor(colors.tertiary),
      onPrimary: ImpaktfullUiTextStyleTheme.getByColor(colors.card),
      onSecondary: ImpaktfullUiTextStyleTheme.getByColor(colors.text),
    );
    return ImpaktfullUiTheme(
      colors: colors,
      textStyles: textStyles,
      dimens: dimens,
      shadows: ImpaktfullUiShadowsTheme(
        extraSmall: [
          BoxShadow(
            color: colors.shadow.withOpacity(0.05),
            offset: const Offset(0, 1),
            blurRadius: 2,
          ),
        ],
        small: [
          BoxShadow(
            color: colors.shadow.withOpacity(0.01),
            offset: const Offset(0, 1),
            blurRadius: 3,
          ),
        ],
        medium: [
          BoxShadow(
            color: colors.shadow.withOpacity(0.01),
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: -2,
          ),
        ],
        large: [
          BoxShadow(
            color: colors.shadow.withOpacity(0.08),
            offset: const Offset(1, 12),
            spreadRadius: -4,
            blurRadius: 16,
          ),
        ],
        extraLarge: [
          BoxShadow(
            color: colors.shadow.withOpacity(0.08),
            offset: const Offset(0, 20),
            blurRadius: 25,
            spreadRadius: -4,
          ),
        ],
      ),
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
        cmsHeaders: ImpaktfullUiCmsHeaderTheme(
          colors: ImpaktfullUiCmsHeaderColorTheme(
            background: colors.card,
            border: colors.border,
          ),
          dimens: const ImpaktfullUiCmsHeaderDimensTheme(),
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
          ),
          dimens: ImpaktfullUiInputFieldDimensTheme(
            borderRadius: dimens.borderRadius,
          ),
          textStyles: ImpaktfullUiInputFieldTextStylesTheme(
            text: textStyles.onCard.text.medium,
            hint: textStyles.onCardSecondary.text.medium,
            label: textStyles.onCardSecondary.text.small.medium,
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
        divider: ImpaktfullUiDividerTheme(
          colors: ImpaktfullUiDividerColorTheme(
            color: colors.border,
          ),
        ),
      ),
    );
  }

  static setTheme(ImpaktfullUiTheme theme) => _theme = theme;

  static ImpaktfullUiTheme of(BuildContext context) => _theme;

  static T getComponentTheme<T>(BuildContext context) {
    final theme = of(context);
    if (T == ImpaktfullUiButtonTheme) {
      return theme.components.button as T;
    } else if (T == ImpaktfullUiCardTheme) {
      return theme.components.card as T;
    } else if (T == ImpaktfullUiBadgeTheme) {
      return theme.components.badge as T;
    } else if (T == ImpaktfullUiHorizontalTabTheme) {
      return theme.components.horizontalTab as T;
    } else if (T == ImpaktfullUiHorizontalTabsTheme) {
      return theme.components.horizontalTabs as T;
    } else if (T == ImpaktfullUiInputFieldTheme) {
      return theme.components.inputField as T;
    } else if (T == ImpaktfullUiTableTheme) {
      return theme.components.table as T;
    } else if (T == ImpaktfullUiTableHeaderTheme) {
      return theme.components.tableHeader as T;
    } else if (T == ImpaktfullUiTableHeaderItemTheme) {
      return theme.components.tableHeaderItem as T;
    } else if (T == ImpaktfullUiTableRowTheme) {
      return theme.components.tableRow as T;
    } else if (T == ImpaktfullUiTableRowItemTheme) {
      return theme.components.tableRowItem as T;
    } else if (T == ImpaktfullUiDividerTheme) {
      return theme.components.divider as T;
    } else {
      throw ArgumentError('$T is not configured in the impaktfull ui theme');
    }
  }
}

class ImpaktfullUiColorTheme {
  final Color accent;
  final Color secondary;
  final Color tertiary;
  final Color canvas;
  final Color card;
  final Color header;
  final Color border;
  final Color shadow;
  final Color text;
  final Color textOnPrimary;
  final Color textOnSecondary;
  final Color warning;
  final Color error;
  final Color success;

  const ImpaktfullUiColorTheme({
    required this.accent,
    required this.secondary,
    required this.tertiary,
    required this.canvas,
    required this.card,
    required this.header,
    required this.border,
    required this.shadow,
    required this.text,
    required this.textOnPrimary,
    required this.textOnSecondary,
    required this.warning,
    required this.error,
    required this.success,
  });
}

class ImpaktfullUiTextStylesTheme {
  final ImpaktfullUiTextStyleTheme onCanvas;
  final ImpaktfullUiTextStyleTheme onCanvasPrimary;
  final ImpaktfullUiTextStyleTheme onCanvasSecondary;
  final ImpaktfullUiTextStyleTheme onCanvasTertiary;
  final ImpaktfullUiTextStyleTheme onCard;
  final ImpaktfullUiTextStyleTheme onCardPrimary;
  final ImpaktfullUiTextStyleTheme onCardSecondary;
  final ImpaktfullUiTextStyleTheme onCardTertiary;
  final ImpaktfullUiTextStyleTheme onPrimary;
  final ImpaktfullUiTextStyleTheme onSecondary;

  const ImpaktfullUiTextStylesTheme({
    required this.onCanvas,
    required this.onCanvasPrimary,
    required this.onCanvasSecondary,
    required this.onCanvasTertiary,
    required this.onCard,
    required this.onCardPrimary,
    required this.onCardSecondary,
    required this.onCardTertiary,
    required this.onPrimary,
    required this.onSecondary,
  });
}

class ImpaktfullUiTextStyleTheme {
  final ImpaktfullUiTextStyleDisplayTheme display;
  final ImpaktfullUiTextStyleTextTheme text;

  const ImpaktfullUiTextStyleTheme({
    required this.display,
    required this.text,
  });
  static getByColor(Color color) {
    return ImpaktfullUiTextStyleTheme(
      display: ImpaktfullUiTextStyleDisplayTheme.getByColor(color),
      text: ImpaktfullUiTextStyleTextTheme.getByColor(color),
    );
  }
}

class ImpaktfullUiTextStyleDisplayTheme {
  final TextStyle extraLarge2;
  final TextStyle extraLarge;
  final TextStyle large;
  final TextStyle medium;
  final TextStyle small;
  final TextStyle extraSmall;

  const ImpaktfullUiTextStyleDisplayTheme({
    required this.extraLarge2,
    required this.extraLarge,
    required this.large,
    required this.medium,
    required this.small,
    required this.extraSmall,
  });

  static getByColor(Color color) {
    return ImpaktfullUiTextStyleDisplayTheme(
      extraLarge2: TextStyle(fontSize: 72, color: color),
      extraLarge: TextStyle(fontSize: 60, color: color),
      large: TextStyle(fontSize: 48, color: color),
      medium: TextStyle(fontSize: 30, color: color),
      small: TextStyle(fontSize: 24, color: color),
      extraSmall: TextStyle(fontSize: 20, color: color),
    );
  }
}

class ImpaktfullUiTextStyleTextTheme {
  final TextStyle extraLarge;
  final TextStyle large;
  final TextStyle medium;
  final TextStyle small;
  final TextStyle extraSmall;

  const ImpaktfullUiTextStyleTextTheme({
    required this.extraLarge,
    required this.large,
    required this.medium,
    required this.small,
    required this.extraSmall,
  });

  static getByColor(Color color) {
    return ImpaktfullUiTextStyleTextTheme(
      extraLarge: TextStyle(fontSize: 20, color: color),
      large: TextStyle(fontSize: 18, color: color),
      medium: TextStyle(fontSize: 16, color: color),
      small: TextStyle(fontSize: 14, color: color),
      extraSmall: TextStyle(fontSize: 12, color: color),
    );
  }
}

extension TextStyleExtension on TextStyle {
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
}

class ImpaktfullUiDimensTheme {
  final BorderRadius borderRadius;

  const ImpaktfullUiDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiShadowsTheme {
  final List<BoxShadow> extraSmall;
  final List<BoxShadow> small;
  final List<BoxShadow> medium;
  final List<BoxShadow> large;
  final List<BoxShadow> extraLarge;

  const ImpaktfullUiShadowsTheme({
    required this.extraSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
  });
}

class ImpaktfullUiComponentsTheme {
  final ImpaktfullUiBadgeTheme badge;
  final ImpaktfullUiButtonTheme button;
  final ImpaktfullUiCardTheme card;
  final ImpaktfullUiCmsHeaderTheme cmsHeaders;
  final ImpaktfullUiHorizontalTabTheme horizontalTab;
  final ImpaktfullUiHorizontalTabsTheme horizontalTabs;
  final ImpaktfullUiInputFieldTheme inputField;
  final ImpaktfullUiTableTheme table;
  final ImpaktfullUiTableHeaderTheme tableHeader;
  final ImpaktfullUiTableHeaderItemTheme tableHeaderItem;
  final ImpaktfullUiTableRowTheme tableRow;
  final ImpaktfullUiTableRowItemTheme tableRowItem;
  final ImpaktfullUiDividerTheme divider;

  ImpaktfullUiComponentsTheme({
    required this.badge,
    required this.button,
    required this.card,
    required this.cmsHeaders,
    required this.horizontalTab,
    required this.horizontalTabs,
    required this.inputField,
    required this.tableHeader,
    required this.tableHeaderItem,
    required this.table,
    required this.tableRow,
    required this.tableRowItem,
    required this.divider,
  });
}

abstract class ImpaktfullUiComponentTheme {
  const ImpaktfullUiComponentTheme();
}
