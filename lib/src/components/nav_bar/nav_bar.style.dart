import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiNavBarTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiNavBarAssetsTheme assets;
  final ImpaktfullUiNavBarColorTheme colors;
  final ImpaktfullUiNavBarDimensTheme dimens;
  final ImpaktfullUiNavBarShadowsTheme shadows;
  final ImpaktfullUiNavBarTextStyleTheme textStyles;

  const ImpaktfullUiNavBarTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.shadows,
    required this.textStyles,
  });

  ImpaktfullUiNavBarTheme copyWith({
    ImpaktfullUiNavBarAssetsTheme? assets,
    ImpaktfullUiNavBarColorTheme? colors,
    ImpaktfullUiNavBarDimensTheme? dimens,
    ImpaktfullUiNavBarShadowsTheme? shadows,
    ImpaktfullUiNavBarTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiNavBarTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        shadows: shadows ?? this.shadows,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiNavBarTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.navBar;

  static ImpaktfullUiNavBarTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiNavBarTheme(
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
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiNavBarTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          shadows == other.shadows &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, shadows, textStyles);
}

class ImpaktfullUiNavBarAssetsTheme {
  final ImpaktfullUiAsset back;
  final ImpaktfullUiAsset drawerMenu;
  final ImpaktfullUiAsset close;
  const ImpaktfullUiNavBarAssetsTheme({
    required this.back,
    required this.drawerMenu,
    required this.close,
  });

  ImpaktfullUiNavBarAssetsTheme copyWith({
    ImpaktfullUiAsset? back,
    ImpaktfullUiAsset? close,
    ImpaktfullUiAsset? drawerMenu,
  }) =>
      ImpaktfullUiNavBarAssetsTheme(
        back: back ?? this.back,
        close: close ?? this.close,
        drawerMenu: drawerMenu ?? this.drawerMenu,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiNavBarAssetsTheme &&
          back == other.back &&
          drawerMenu == other.drawerMenu &&
          close == other.close;

  @override
  int get hashCode => Object.hash(back, drawerMenu, close);
}

class ImpaktfullUiNavBarColorTheme {
  final Color background;
  final Color icons;
  final Color? border;
  const ImpaktfullUiNavBarColorTheme({
    required this.background,
    required this.icons,
    required this.border,
  });

  ImpaktfullUiNavBarColorTheme copyWith({
    Color? background,
    Color? border,
    Color? icons,
  }) =>
      ImpaktfullUiNavBarColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
        icons: icons ?? this.icons,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiNavBarColorTheme &&
          background == other.background &&
          icons == other.icons &&
          border == other.border;

  @override
  int get hashCode => Object.hash(background, icons, border);
}

class ImpaktfullUiNavBarDimensTheme {
  /// The width that is reserved for one action button next to the title.
  final double actionSize;

  /// The minimum height of the bar, without its `bottomChild`.
  final double minHeight;

  /// The padding above and below the content of the bar.
  final double verticalPadding;

  /// The padding at a side of the bar without an action button.
  final double sidePadding;

  /// The padding at a side of the bar with an action button: the button
  /// brings its own padding.
  final double sidePaddingWithActions;

  const ImpaktfullUiNavBarDimensTheme({
    this.actionSize = 44,
    this.minHeight = 56,
    this.verticalPadding = 4,
    this.sidePadding = 16,
    this.sidePaddingWithActions = 6,
  });

  ImpaktfullUiNavBarDimensTheme copyWith({
    double? actionSize,
    double? minHeight,
    double? sidePadding,
    double? sidePaddingWithActions,
    double? verticalPadding,
  }) =>
      ImpaktfullUiNavBarDimensTheme(
        actionSize: actionSize ?? this.actionSize,
        minHeight: minHeight ?? this.minHeight,
        sidePadding: sidePadding ?? this.sidePadding,
        sidePaddingWithActions:
            sidePaddingWithActions ?? this.sidePaddingWithActions,
        verticalPadding: verticalPadding ?? this.verticalPadding,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiNavBarDimensTheme &&
          actionSize == other.actionSize &&
          minHeight == other.minHeight &&
          verticalPadding == other.verticalPadding &&
          sidePadding == other.sidePadding &&
          sidePaddingWithActions == other.sidePaddingWithActions;

  @override
  int get hashCode => Object.hash(actionSize, minHeight, verticalPadding,
      sidePadding, sidePaddingWithActions);
}

class ImpaktfullUiNavBarShadowsTheme {
  final List<BoxShadow> shadow;
  const ImpaktfullUiNavBarShadowsTheme({
    required this.shadow,
  });

  ImpaktfullUiNavBarShadowsTheme copyWith({
    List<BoxShadow>? shadow,
  }) =>
      ImpaktfullUiNavBarShadowsTheme(
        shadow: shadow ?? this.shadow,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiNavBarShadowsTheme &&
          listEquals(shadow, other.shadow);

  @override
  int get hashCode => Object.hashAll(shadow);
}

class ImpaktfullUiNavBarTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;
  const ImpaktfullUiNavBarTextStyleTheme({
    required this.title,
    required this.subtitle,
  });

  ImpaktfullUiNavBarTextStyleTheme copyWith({
    TextStyle? subtitle,
    TextStyle? title,
  }) =>
      ImpaktfullUiNavBarTextStyleTheme(
        subtitle: subtitle ?? this.subtitle,
        title: title ?? this.title,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiNavBarTextStyleTheme &&
          title == other.title &&
          subtitle == other.subtitle;

  @override
  int get hashCode => Object.hash(title, subtitle);
}
