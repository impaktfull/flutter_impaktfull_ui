import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiInputFieldTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiInputFieldAssetsTheme assets;
  final ImpaktfullUiInputFieldColorTheme colors;
  final ImpaktfullUiInputFieldDimensTheme dimens;
  final ImpaktfullUiInputFieldTextStyleTheme textStyles;

  const ImpaktfullUiInputFieldTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiInputFieldTheme copyWith({
    ImpaktfullUiInputFieldAssetsTheme? assets,
    ImpaktfullUiInputFieldColorTheme? colors,
    ImpaktfullUiInputFieldDimensTheme? dimens,
    ImpaktfullUiInputFieldTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiInputFieldTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiInputFieldTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.inputField;

  static ImpaktfullUiInputFieldTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiInputFieldTheme(
        assets: ImpaktfullUiInputFieldAssetsTheme(
          passwordHide: assets.icons.passwordHide,
          passwordShow: assets.icons.passwordShow,
        ),
        colors: ImpaktfullUiInputFieldColorTheme(
          background: colors.card,
          border: colors.border,
          borderError: colors.error,
          cursor: colors.accent,
          selection: colors.accent.withOpacityPercentage(0.3),
          selectionHandle: colors.accent,
        ),
        dimens: ImpaktfullUiInputFieldDimensTheme(
          borderRadius: dimens.borderRadius,
          labelMargin: EdgeInsets.zero,
        ),
        textStyles: ImpaktfullUiInputFieldTextStyleTheme(
          label: textStyles.onCard.text.small.medium,
          text: textStyles.onCard.text.medium,
          placeholder: textStyles.onCardTertiary.text.medium.copyWith(
              color: textStyles.onCardTertiary.text.medium.color
                  ?.withOpacityPercentage(0.5)),
          hint: textStyles.onCardTertiary.text.small,
          error: textStyles.onCardDestructive.text.small.medium
              .copyWith(color: colors.error),
          action: textStyles.onCard.text.small.medium,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiInputFieldTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiInputFieldAssetsTheme {
  final ImpaktfullUiAsset passwordHide;
  final ImpaktfullUiAsset passwordShow;

  const ImpaktfullUiInputFieldAssetsTheme({
    required this.passwordHide,
    required this.passwordShow,
  });

  ImpaktfullUiInputFieldAssetsTheme copyWith({
    ImpaktfullUiAsset? passwordHide,
    ImpaktfullUiAsset? passwordShow,
  }) =>
      ImpaktfullUiInputFieldAssetsTheme(
        passwordHide: passwordHide ?? this.passwordHide,
        passwordShow: passwordShow ?? this.passwordShow,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiInputFieldAssetsTheme &&
          passwordHide == other.passwordHide &&
          passwordShow == other.passwordShow;

  @override
  int get hashCode => Object.hash(passwordHide, passwordShow);
}

class ImpaktfullUiInputFieldColorTheme {
  final Color background;
  final Color border;
  final Color borderError;
  final Color cursor;
  final Color selection;
  final Color selectionHandle;

  /// The border of the field while it has focus, e.g. Ant Design's
  /// `activeBorderColor` (`#1677FF`) or shadcn/ui's `--ring`.
  ///
  /// Null (the default) keeps [border] while the field has focus. A field with
  /// an `error` keeps [borderError] either way.
  final Color? borderFocused;

  /// The border of the field while the pointer hovers it, e.g. Ant Design's
  /// `hoverBorderColor` (`#4096FF`).
  ///
  /// Null (the default) keeps [border] while the field is hovered.
  /// [borderFocused] wins while the field also has focus.
  final Color? borderHover;

  /// The ring drawn around the field while it has focus, e.g. Ant Design's
  /// `activeShadow` (`rgba(5,145,255,0.1)`) or shadcn/ui's `ring/50`.
  ///
  /// It is drawn outside the border, is
  /// [ImpaktfullUiInputFieldDimensTheme.focusRingWidth] wide and takes no
  /// space in the layout. Null (the default) draws no ring: a focused field
  /// only shows the border and the keyboard focus ring of
  /// `ImpaktfullUiFocusFeedback`.
  final Color? focusRing;

  // `borderFocused`, `borderHover` and `focusRing` are optional: `null` is the
  // look of the field before they existed. They become `required` in 1.0.0.
  const ImpaktfullUiInputFieldColorTheme({
    required this.background,
    required this.border,
    required this.borderError,
    required this.cursor,
    required this.selection,
    required this.selectionHandle,
    this.borderFocused,
    this.borderHover,
    this.focusRing,
  });

  ImpaktfullUiInputFieldColorTheme copyWith({
    Color? background,
    Color? border,
    Color? borderError,
    Color? borderFocused,
    Color? borderHover,
    Color? cursor,
    Color? focusRing,
    Color? selection,
    Color? selectionHandle,
  }) =>
      ImpaktfullUiInputFieldColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
        borderError: borderError ?? this.borderError,
        borderFocused: borderFocused ?? this.borderFocused,
        borderHover: borderHover ?? this.borderHover,
        cursor: cursor ?? this.cursor,
        focusRing: focusRing ?? this.focusRing,
        selection: selection ?? this.selection,
        selectionHandle: selectionHandle ?? this.selectionHandle,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiInputFieldColorTheme &&
          background == other.background &&
          border == other.border &&
          borderError == other.borderError &&
          borderFocused == other.borderFocused &&
          borderHover == other.borderHover &&
          cursor == other.cursor &&
          focusRing == other.focusRing &&
          selection == other.selection &&
          selectionHandle == other.selectionHandle;

  @override
  int get hashCode => Object.hash(
      background,
      border,
      borderError,
      borderFocused,
      borderHover,
      cursor,
      focusRing,
      selection,
      selectionHandle);
}

class ImpaktfullUiInputFieldDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final EdgeInsets labelMargin;

  /// The padding between the border of the field and its content.
  ///
  /// Only the horizontal sides of a design system's `paddingInline` belong
  /// here: the space above and below the text is [contentPadding], which stays
  /// inside the text field (and inside its tap area).
  final EdgeInsetsDirectional padding;

  /// [padding] of a field that shows actions inside it (the show/hide button of
  /// an obscured field, `trailingInputActions`): those bring their own padding,
  /// so the field needs less at the end.
  final EdgeInsetsDirectional paddingWithActions;

  /// The space above and below the text of the field.
  ///
  /// Together with [minHeight] this declares the height of the field instead of
  /// deriving it: `contentPadding: EdgeInsets.zero` with `minHeight: 32` is Ant
  /// Design's `controlHeight`, `minHeight: 36` is shadcn/ui's `h-9`.
  final EdgeInsets contentPadding;

  /// [contentPadding] of a field that only shows its value (`onChanged: null`
  /// without `readOnly`), which renders a `Text` instead of a text field.
  final EdgeInsets readOnlyContentPadding;

  /// The minimum height of the field, without its label, hint and error.
  ///
  /// The field is as tall as its content ([contentPadding] plus the height of
  /// the text: 46 with the default theme) or [minHeight], whichever is larger.
  final double minHeight;

  /// [minHeight] of a `multiline` field.
  final double multilineMinHeight;

  /// The space between the leading icon, the text and the actions of the field.
  final double spacing;

  /// The size of the `leadingIcon`.
  final double iconSize;

  /// The width of the border of the field.
  ///
  /// Null (the default) keeps the `borderWidth` of
  /// `ImpaktfullUiCardDimensTheme`: the field draws its border with an
  /// `ImpaktfullUiCard`.
  final double? borderWidth;

  /// How far [ImpaktfullUiInputFieldColorTheme.focusRing] reaches outside the
  /// border of a focused field. Unused without a `focusRing` colour.
  final double focusRingWidth;

  // Every parameter below `labelMargin` is optional, with the value the widget
  // hardcoded before it was a token as its default. They become `required` in
  // 1.0.0.

  /// The space between the label, the field and the error under it.
  final double labelSpacing;

  /// The padding around an action inside the field.
  final EdgeInsetsGeometry actionPadding;

  /// The minimum height of an action next to the field.
  final double actionMinHeight;

  const ImpaktfullUiInputFieldDimensTheme({
    required this.borderRadius,
    required this.labelMargin,
    this.padding = const EdgeInsetsDirectional.only(start: 16, end: 16),
    this.paddingWithActions =
        const EdgeInsetsDirectional.only(start: 16, end: 4),
    this.contentPadding = const EdgeInsets.symmetric(vertical: 12),
    this.readOnlyContentPadding = const EdgeInsets.symmetric(vertical: 8),
    this.minHeight = 40,
    this.multilineMinHeight = 88,
    this.spacing = 8,
    this.iconSize = 20,
    this.borderWidth,
    this.focusRingWidth = 2,
    this.labelSpacing = 4,
    this.actionPadding = const EdgeInsets.all(8),
    this.actionMinHeight = 40,
  });

  ImpaktfullUiInputFieldDimensTheme copyWith({
    double? actionMinHeight,
    EdgeInsetsGeometry? actionPadding,
    BorderRadiusGeometry? borderRadius,
    double? borderWidth,
    EdgeInsets? contentPadding,
    double? focusRingWidth,
    double? iconSize,
    EdgeInsets? labelMargin,
    double? labelSpacing,
    double? minHeight,
    double? multilineMinHeight,
    EdgeInsetsDirectional? padding,
    EdgeInsetsDirectional? paddingWithActions,
    EdgeInsets? readOnlyContentPadding,
    double? spacing,
  }) =>
      ImpaktfullUiInputFieldDimensTheme(
        actionMinHeight: actionMinHeight ?? this.actionMinHeight,
        actionPadding: actionPadding ?? this.actionPadding,
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        contentPadding: contentPadding ?? this.contentPadding,
        focusRingWidth: focusRingWidth ?? this.focusRingWidth,
        iconSize: iconSize ?? this.iconSize,
        labelMargin: labelMargin ?? this.labelMargin,
        labelSpacing: labelSpacing ?? this.labelSpacing,
        minHeight: minHeight ?? this.minHeight,
        multilineMinHeight: multilineMinHeight ?? this.multilineMinHeight,
        padding: padding ?? this.padding,
        paddingWithActions: paddingWithActions ?? this.paddingWithActions,
        readOnlyContentPadding:
            readOnlyContentPadding ?? this.readOnlyContentPadding,
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiInputFieldDimensTheme &&
          borderRadius == other.borderRadius &&
          labelMargin == other.labelMargin &&
          padding == other.padding &&
          paddingWithActions == other.paddingWithActions &&
          contentPadding == other.contentPadding &&
          readOnlyContentPadding == other.readOnlyContentPadding &&
          minHeight == other.minHeight &&
          multilineMinHeight == other.multilineMinHeight &&
          spacing == other.spacing &&
          iconSize == other.iconSize &&
          borderWidth == other.borderWidth &&
          focusRingWidth == other.focusRingWidth &&
          labelSpacing == other.labelSpacing &&
          actionPadding == other.actionPadding &&
          actionMinHeight == other.actionMinHeight;

  @override
  int get hashCode => Object.hash(
      borderRadius,
      labelMargin,
      padding,
      paddingWithActions,
      contentPadding,
      readOnlyContentPadding,
      minHeight,
      multilineMinHeight,
      spacing,
      iconSize,
      borderWidth,
      focusRingWidth,
      labelSpacing,
      actionPadding,
      actionMinHeight);
}

class ImpaktfullUiInputFieldTextStyleTheme {
  final TextStyle label;
  final TextStyle text;
  final TextStyle placeholder;
  final TextStyle hint;
  final TextStyle error;
  final TextStyle action;

  const ImpaktfullUiInputFieldTextStyleTheme({
    required this.label,
    required this.text,
    required this.placeholder,
    required this.hint,
    required this.error,
    required this.action,
  });

  ImpaktfullUiInputFieldTextStyleTheme copyWith({
    TextStyle? label,
    TextStyle? text,
    TextStyle? placeholder,
    TextStyle? hint,
    TextStyle? error,
    TextStyle? action,
  }) =>
      ImpaktfullUiInputFieldTextStyleTheme(
        label: label ?? this.label,
        text: text ?? this.text,
        placeholder: placeholder ?? this.placeholder,
        hint: hint ?? this.hint,
        error: error ?? this.error,
        action: action ?? this.action,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiInputFieldTextStyleTheme &&
          label == other.label &&
          text == other.text &&
          placeholder == other.placeholder &&
          hint == other.hint &&
          error == other.error &&
          action == other.action;

  @override
  int get hashCode =>
      Object.hash(label, text, placeholder, hint, error, action);
}
