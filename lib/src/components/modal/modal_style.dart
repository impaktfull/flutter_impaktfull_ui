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

  /// The color of the barrier behind the modal: everything below the modal is
  /// covered with it. `Colors.black54` by default.
  final Color barrier;

  const ImpaktfullUiModalColorTheme({
    required this.background,
    required this.closeIcon,
    required this.leadingHeaderIcon,
    this.barrier = const Color(0x8A000000),
  });

  ImpaktfullUiModalColorTheme copyWith({
    Color? background,
    Color? barrier,
    Color? closeIcon,
    Color? leadingHeaderIcon,
  }) =>
      ImpaktfullUiModalColorTheme(
        background: background ?? this.background,
        barrier: barrier ?? this.barrier,
        closeIcon: closeIcon ?? this.closeIcon,
        leadingHeaderIcon: leadingHeaderIcon ?? this.leadingHeaderIcon,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiModalColorTheme &&
          background == other.background &&
          closeIcon == other.closeIcon &&
          leadingHeaderIcon == other.leadingHeaderIcon &&
          barrier == other.barrier;

  @override
  int get hashCode =>
      Object.hash(background, closeIcon, leadingHeaderIcon, barrier);
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

  /// How much the page behind the modal is blurred, when the modal is shown
  /// with `hasBlurredBackground`. 8 by default.
  final double barrierBlurSigma;

  /// The padding around the content of a simple modal.
  final EdgeInsetsGeometry contentPadding;

  /// The space between the title and the close button.
  final double spacing;

  /// The space between the title and the subtitle.
  final double titleSpacing;

  /// The space the close button takes next to the title.
  final double closeIconButtonSize;

  const ImpaktfullUiModalDimensTheme({
    required this.borderRadius,
    required this.borderWidth,
    required this.closeIconButtonPadding,
    required this.leadingIconPadding,
    required this.padding,
    this.barrierBlurSigma = 8,
    this.contentPadding = const EdgeInsets.all(16),
    this.spacing = 16,
    this.titleSpacing = 4,
    this.closeIconButtonSize = 48,
  });

  ImpaktfullUiModalDimensTheme copyWith({
    double? barrierBlurSigma,
    BorderRadiusGeometry? borderRadius,
    double? borderWidth,
    EdgeInsetsGeometry? closeIconButtonPadding,
    double? closeIconButtonSize,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? leadingIconPadding,
    EdgeInsetsGeometry? padding,
    double? spacing,
    double? titleSpacing,
  }) =>
      ImpaktfullUiModalDimensTheme(
        barrierBlurSigma: barrierBlurSigma ?? this.barrierBlurSigma,
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        closeIconButtonPadding:
            closeIconButtonPadding ?? this.closeIconButtonPadding,
        closeIconButtonSize: closeIconButtonSize ?? this.closeIconButtonSize,
        contentPadding: contentPadding ?? this.contentPadding,
        leadingIconPadding: leadingIconPadding ?? this.leadingIconPadding,
        padding: padding ?? this.padding,
        spacing: spacing ?? this.spacing,
        titleSpacing: titleSpacing ?? this.titleSpacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiModalDimensTheme &&
          borderRadius == other.borderRadius &&
          borderWidth == other.borderWidth &&
          closeIconButtonPadding == other.closeIconButtonPadding &&
          leadingIconPadding == other.leadingIconPadding &&
          padding == other.padding &&
          barrierBlurSigma == other.barrierBlurSigma &&
          contentPadding == other.contentPadding &&
          spacing == other.spacing &&
          titleSpacing == other.titleSpacing &&
          closeIconButtonSize == other.closeIconButtonSize;

  @override
  int get hashCode => Object.hash(
      borderRadius,
      borderWidth,
      closeIconButtonPadding,
      leadingIconPadding,
      padding,
      barrierBlurSigma,
      contentPadding,
      spacing,
      titleSpacing,
      closeIconButtonSize);
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
