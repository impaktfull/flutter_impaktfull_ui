import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiVirtualKeyboardTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiVirtualKeyboardAssetsTheme assets;
  final ImpaktfullUiVirtualKeyboardColorTheme colors;
  final ImpaktfullUiVirtualKeyboardDimensTheme dimens;
  final ImpaktfullUiVirtualKeyboardTextStyleTheme textStyles;

  const ImpaktfullUiVirtualKeyboardTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiVirtualKeyboardTheme copyWith({
    ImpaktfullUiVirtualKeyboardAssetsTheme? assets,
    ImpaktfullUiVirtualKeyboardColorTheme? colors,
    ImpaktfullUiVirtualKeyboardDimensTheme? dimens,
    ImpaktfullUiVirtualKeyboardTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiVirtualKeyboardTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
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

class ImpaktfullUiVirtualKeyboardTextStyleTheme {
  const ImpaktfullUiVirtualKeyboardTextStyleTheme();

  ImpaktfullUiVirtualKeyboardTextStyleTheme copyWith() =>
      const ImpaktfullUiVirtualKeyboardTextStyleTheme();
}
