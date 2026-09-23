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
        textStyles: const ImpaktfullUiVirtualKeyboardTextStyleTheme(),
      );
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
}

class ImpaktfullUiVirtualKeyboardDimensTheme {
  const ImpaktfullUiVirtualKeyboardDimensTheme();

  ImpaktfullUiVirtualKeyboardDimensTheme copyWith() =>
      const ImpaktfullUiVirtualKeyboardDimensTheme();
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
}

class ImpaktfullUiVirtualKeyboardTextStyleTheme {
  const ImpaktfullUiVirtualKeyboardTextStyleTheme();

  ImpaktfullUiVirtualKeyboardTextStyleTheme copyWith() =>
      const ImpaktfullUiVirtualKeyboardTextStyleTheme();
}
