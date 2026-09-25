import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiVirtualKeyboardTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiVirtualKeyboardAssetsTheme assets;
  final ImpaktfullUiVirtualKeyboardColorTheme colors;
  final ImpaktfullUiVirtualKeyboardDimensTheme dimens;
  final ImpaktfullUiVirtualKeyboardDurationsTheme durations;
  final ImpaktfullUiVirtualKeyboardTextStyleTheme textStyles;

  const ImpaktfullUiVirtualKeyboardTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    this.durations = const ImpaktfullUiVirtualKeyboardDurationsTheme(),
    required this.textStyles,
  });

  ImpaktfullUiVirtualKeyboardTheme copyWith({
    ImpaktfullUiVirtualKeyboardAssetsTheme? assets,
    ImpaktfullUiVirtualKeyboardColorTheme? colors,
    ImpaktfullUiVirtualKeyboardDimensTheme? dimens,
    ImpaktfullUiVirtualKeyboardDurationsTheme? durations,
    ImpaktfullUiVirtualKeyboardTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiVirtualKeyboardTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiVirtualKeyboardTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.virtualKeyboard;

  static ImpaktfullUiVirtualKeyboardTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiVirtualKeyboardTheme(
        assets: ImpaktfullUiVirtualKeyboardAssetsTheme(
          passwordHide: assets.icons.passwordHide,
          passwordShow: assets.icons.passwordShow,
        ),
        colors: ImpaktfullUiVirtualKeyboardColorTheme(
          cursor: colors.accent,
        ),
        dimens: const ImpaktfullUiVirtualKeyboardDimensTheme(),
        durations: const ImpaktfullUiVirtualKeyboardDurationsTheme(),
        textStyles: ImpaktfullUiVirtualKeyboardTextStyleTheme(
          text: textStyles.onCard.text.medium,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiVirtualKeyboardTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          durations == other.durations &&
          textStyles == other.textStyles;

  @override
  int get hashCode =>
      Object.hash(assets, colors, dimens, durations, textStyles);
}

class ImpaktfullUiVirtualKeyboardAssetsTheme {
  final ImpaktfullUiAsset passwordHide;
  final ImpaktfullUiAsset passwordShow;
  const ImpaktfullUiVirtualKeyboardAssetsTheme({
    required this.passwordHide,
    required this.passwordShow,
  });

  ImpaktfullUiVirtualKeyboardAssetsTheme copyWith({
    ImpaktfullUiAsset? passwordHide,
    ImpaktfullUiAsset? passwordShow,
  }) =>
      ImpaktfullUiVirtualKeyboardAssetsTheme(
        passwordHide: passwordHide ?? this.passwordHide,
        passwordShow: passwordShow ?? this.passwordShow,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiVirtualKeyboardAssetsTheme &&
          passwordHide == other.passwordHide &&
          passwordShow == other.passwordShow;

  @override
  int get hashCode => Object.hash(passwordHide, passwordShow);
}

class ImpaktfullUiVirtualKeyboardColorTheme {
  final Color cursor;
  const ImpaktfullUiVirtualKeyboardColorTheme({
    required this.cursor,
  });

  ImpaktfullUiVirtualKeyboardColorTheme copyWith({
    Color? cursor,
  }) =>
      ImpaktfullUiVirtualKeyboardColorTheme(
        cursor: cursor ?? this.cursor,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiVirtualKeyboardColorTheme && cursor == other.cursor;

  @override
  int get hashCode => cursor.hashCode;
}

class ImpaktfullUiVirtualKeyboardDimensTheme {
  /// The padding around the keyboard.
  final EdgeInsetsGeometry padding;

  /// The maximum width of the keyboard.
  final double maxWidth;

  /// The space between the keys.
  final double spacing;

  /// The height of a key.
  final double keyHeight;

  /// The padding inside the input above the keys.
  ///
  /// The card of the input is [keyHeight] high, so the line of text has to
  /// fit in what is left of it: the default leaves the height to the line
  /// and only keeps the space at the sides, instead of the padding of an
  /// `ImpaktfullUiCard` on every side.
  final EdgeInsetsGeometry inputPadding;

  /// The height of the cursor.
  final double cursorHeight;

  /// The width of the cursor.
  final double cursorWidth;

  const ImpaktfullUiVirtualKeyboardDimensTheme({
    this.padding = const EdgeInsets.all(16),
    this.maxWidth = 1000,
    this.spacing = 8,
    this.keyHeight = 56,
    this.inputPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.cursorHeight = 20,
    this.cursorWidth = 2,
  });

  ImpaktfullUiVirtualKeyboardDimensTheme copyWith({
    double? cursorHeight,
    double? cursorWidth,
    EdgeInsetsGeometry? inputPadding,
    double? keyHeight,
    double? maxWidth,
    EdgeInsetsGeometry? padding,
    double? spacing,
  }) =>
      ImpaktfullUiVirtualKeyboardDimensTheme(
        cursorHeight: cursorHeight ?? this.cursorHeight,
        cursorWidth: cursorWidth ?? this.cursorWidth,
        inputPadding: inputPadding ?? this.inputPadding,
        keyHeight: keyHeight ?? this.keyHeight,
        maxWidth: maxWidth ?? this.maxWidth,
        padding: padding ?? this.padding,
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiVirtualKeyboardDimensTheme &&
          padding == other.padding &&
          maxWidth == other.maxWidth &&
          spacing == other.spacing &&
          keyHeight == other.keyHeight &&
          inputPadding == other.inputPadding &&
          cursorHeight == other.cursorHeight &&
          cursorWidth == other.cursorWidth;

  @override
  int get hashCode => Object.hash(
        padding,
        maxWidth,
        spacing,
        keyHeight,
        inputPadding,
        cursorHeight,
        cursorWidth,
      );
}

class ImpaktfullUiVirtualKeyboardDurationsTheme {
  /// How long one blink of the cursor takes.
  final Duration cursorBlink;

  /// How long a key takes to slide down to its secondary key.
  final Duration keySlide;

  /// How long a key has to be held before it starts repeating.
  final Duration repeatDelay;

  /// The time between two repeats of a held key.
  final Duration repeatInterval;

  const ImpaktfullUiVirtualKeyboardDurationsTheme({
    this.cursorBlink = const Duration(milliseconds: 200),
    this.keySlide = const Duration(milliseconds: 200),
    this.repeatDelay = const Duration(milliseconds: 500),
    this.repeatInterval = const Duration(milliseconds: 100),
  });

  ImpaktfullUiVirtualKeyboardDurationsTheme copyWith({
    Duration? cursorBlink,
    Duration? keySlide,
    Duration? repeatDelay,
    Duration? repeatInterval,
  }) =>
      ImpaktfullUiVirtualKeyboardDurationsTheme(
        cursorBlink: cursorBlink ?? this.cursorBlink,
        keySlide: keySlide ?? this.keySlide,
        repeatDelay: repeatDelay ?? this.repeatDelay,
        repeatInterval: repeatInterval ?? this.repeatInterval,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiVirtualKeyboardDurationsTheme &&
          cursorBlink == other.cursorBlink &&
          keySlide == other.keySlide &&
          repeatDelay == other.repeatDelay &&
          repeatInterval == other.repeatInterval;

  @override
  int get hashCode =>
      Object.hash(cursorBlink, keySlide, repeatDelay, repeatInterval);
}

class ImpaktfullUiVirtualKeyboardTextStyleTheme {
  /// The text that is being typed, in the input above the keys.
  ///
  /// `null` (the default) takes the text style of the tree around the
  /// keyboard, which is what it always did: a `DefaultTextStyle` of the app
  /// then decides how tall the line of the input is.
  final TextStyle? text;

  const ImpaktfullUiVirtualKeyboardTextStyleTheme({
    this.text,
  });

  ImpaktfullUiVirtualKeyboardTextStyleTheme copyWith({
    TextStyle? text,
  }) =>
      ImpaktfullUiVirtualKeyboardTextStyleTheme(
        text: text ?? this.text,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiVirtualKeyboardTextStyleTheme && text == other.text;

  @override
  int get hashCode => text.hashCode;
}
