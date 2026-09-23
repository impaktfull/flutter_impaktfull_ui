import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiModalTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiModalColorTheme colors;
  final ImpaktfullUiModalTextStyleTheme textStyles;
  final ImpaktfullUiModalDimensTheme dimens;
  final ImpaktfullUiModalDurationsTheme durations;
  final ImpaktfullUiModalAssetsTheme assets;

  const ImpaktfullUiModalTheme({
    required this.colors,
    required this.textStyles,
    required this.dimens,
    this.durations = const ImpaktfullUiModalDurationsTheme(),
    required this.assets,
  });

  ImpaktfullUiModalTheme copyWith({
    ImpaktfullUiModalAssetsTheme? assets,
    ImpaktfullUiModalColorTheme? colors,
    ImpaktfullUiModalDimensTheme? dimens,
    ImpaktfullUiModalDurationsTheme? durations,
    ImpaktfullUiModalTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiModalTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiModalTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.modal;

  static ImpaktfullUiModalTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiModalTheme(
        colors: ImpaktfullUiModalColorTheme(
          background: colors.card,
          closeIcon: colors.text,
          leadingHeaderIcon: colors.accent,
        ),
        durations: const ImpaktfullUiModalDurationsTheme(),
        textStyles: ImpaktfullUiModalTextStyleTheme(
          title: textStyles.onCanvas.display.small.semiBold,
          subtitle: textStyles.onCanvas.text.small,
          content: textStyles.onCanvas.text.small,
        ),
        dimens: ImpaktfullUiModalDimensTheme(
          borderRadius: dimens.borderRadius,
          borderWidth: 1,
          padding: const EdgeInsets.all(16),
          closeIconButtonPadding: const EdgeInsets.all(4),
          leadingIconPadding: const EdgeInsets.all(8),
        ),
        assets: ImpaktfullUiModalAssetsTheme(
          close: assets.icons.close,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiModalTheme &&
          colors == other.colors &&
          textStyles == other.textStyles &&
          dimens == other.dimens &&
          durations == other.durations &&
          assets == other.assets;

  @override
  int get hashCode =>
      Object.hash(colors, textStyles, dimens, durations, assets);
}

class ImpaktfullUiModalColorTheme {
  final Color background;
  final Color closeIcon;
  final Color leadingHeaderIcon;

  const ImpaktfullUiModalColorTheme({
    required this.background,
    required this.closeIcon,
    required this.leadingHeaderIcon,
  });

  ImpaktfullUiModalColorTheme copyWith({
    Color? background,
    Color? closeIcon,
    Color? leadingHeaderIcon,
  }) =>
      ImpaktfullUiModalColorTheme(
        background: background ?? this.background,
        closeIcon: closeIcon ?? this.closeIcon,
        leadingHeaderIcon: leadingHeaderIcon ?? this.leadingHeaderIcon,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiModalColorTheme &&
          background == other.background &&
          closeIcon == other.closeIcon &&
          leadingHeaderIcon == other.leadingHeaderIcon;

  @override
  int get hashCode => Object.hash(background, closeIcon, leadingHeaderIcon);
}

class ImpaktfullUiModalDurationsTheme {
  /// How long the modal takes to appear and to disappear.
  final Duration transition;

  const ImpaktfullUiModalDurationsTheme({
    this.transition = const Duration(milliseconds: 150),
  });

  ImpaktfullUiModalDurationsTheme copyWith({
    Duration? transition,
  }) =>
      ImpaktfullUiModalDurationsTheme(
        transition: transition ?? this.transition,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiModalDurationsTheme &&
          transition == other.transition;

  @override
  int get hashCode => transition.hashCode;
}

class ImpaktfullUiModalTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle content;

  const ImpaktfullUiModalTextStyleTheme({
    required this.title,
    required this.subtitle,
    required this.content,
  });

  ImpaktfullUiModalTextStyleTheme copyWith({
    TextStyle? content,
    TextStyle? subtitle,
    TextStyle? title,
  }) =>
      ImpaktfullUiModalTextStyleTheme(
        content: content ?? this.content,
        subtitle: subtitle ?? this.subtitle,
        title: title ?? this.title,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiModalTextStyleTheme &&
          title == other.title &&
          subtitle == other.subtitle &&
          content == other.content;

  @override
  int get hashCode => Object.hash(title, subtitle, content);
}

class ImpaktfullUiModalDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry closeIconButtonPadding;
  final EdgeInsetsGeometry leadingIconPadding;
  final EdgeInsetsGeometry padding;

  const ImpaktfullUiModalDimensTheme({
    required this.borderRadius,
    required this.borderWidth,
    required this.closeIconButtonPadding,
    required this.leadingIconPadding,
    required this.padding,
  });

  ImpaktfullUiModalDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? borderWidth,
    EdgeInsetsGeometry? closeIconButtonPadding,
    EdgeInsetsGeometry? leadingIconPadding,
    EdgeInsetsGeometry? padding,
  }) =>
      ImpaktfullUiModalDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        closeIconButtonPadding:
            closeIconButtonPadding ?? this.closeIconButtonPadding,
        leadingIconPadding: leadingIconPadding ?? this.leadingIconPadding,
        padding: padding ?? this.padding,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiModalDimensTheme &&
          borderRadius == other.borderRadius &&
          borderWidth == other.borderWidth &&
          closeIconButtonPadding == other.closeIconButtonPadding &&
          leadingIconPadding == other.leadingIconPadding &&
          padding == other.padding;

  @override
  int get hashCode => Object.hash(borderRadius, borderWidth,
      closeIconButtonPadding, leadingIconPadding, padding);
}

class ImpaktfullUiModalAssetsTheme {
  final ImpaktfullUiAsset close;

  const ImpaktfullUiModalAssetsTheme({
    required this.close,
  });

  ImpaktfullUiModalAssetsTheme copyWith({
    ImpaktfullUiAsset? close,
  }) =>
      ImpaktfullUiModalAssetsTheme(
        close: close ?? this.close,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiModalAssetsTheme && close == other.close;

  @override
  int get hashCode => close.hashCode;
}
