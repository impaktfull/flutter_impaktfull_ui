import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiModalTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiModalColorTheme colors;
  final ImpaktfullUiModalTextStyleTheme textStyles;
  final ImpaktfullUiModalDimensTheme dimens;
  final ImpaktfullUiModalAssetsTheme assets;

  const ImpaktfullUiModalTheme({
    required this.colors,
    required this.textStyles,
    required this.dimens,
    required this.assets,
  });

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
        textStyles: ImpaktfullUiModalTextStyleTheme(
          title: textStyles.onCanvas.display.small.semiBold,
          subtitle: textStyles.onCanvas.text.small,
          content: textStyles.onCanvas.text.small,
        ),
        dimens: ImpaktfullUiModalDimensTheme(
          borderRadius: dimens.borderRadius,
          padding: const EdgeInsets.all(16),
          closeIconButtonPadding: const EdgeInsets.all(4),
          leadingIconPadding: const EdgeInsets.all(8),
        ),
        assets: ImpaktfullUiModalAssetsTheme(
          close: assets.icons.close,
        ),
      );
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
}

class ImpaktfullUiModalDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry closeIconButtonPadding;
  final EdgeInsetsGeometry leadingIconPadding;
  final EdgeInsetsGeometry padding;

  const ImpaktfullUiModalDimensTheme({
    required this.borderRadius,
    required this.closeIconButtonPadding,
    required this.leadingIconPadding,
    required this.padding,
  });
}

class ImpaktfullUiModalAssetsTheme {
  final ImpaktfullUiAsset close;

  const ImpaktfullUiModalAssetsTheme({
    required this.close,
  });
}
