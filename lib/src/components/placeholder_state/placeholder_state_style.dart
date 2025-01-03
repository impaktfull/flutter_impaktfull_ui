import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiPlaceholderStateTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiPlaceholderStateAssetsTheme assets;
  final ImpaktfullUiPlaceholderStateColorTheme colors;
  final ImpaktfullUiPlaceholderStateDimensTheme dimens;
  final ImpaktfullUiPlaceholderStateTextStyleTheme textStyles;

  const ImpaktfullUiPlaceholderStateTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiPlaceholderStateTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.placeholderState;
}

class ImpaktfullUiPlaceholderStateAssetsTheme {
  const ImpaktfullUiPlaceholderStateAssetsTheme();
}

class ImpaktfullUiPlaceholderStateColorTheme {
  const ImpaktfullUiPlaceholderStateColorTheme();
}

class ImpaktfullUiPlaceholderStateDimensTheme {
  final EdgeInsets margin;

  const ImpaktfullUiPlaceholderStateDimensTheme({
    required this.margin,
  });
}

class ImpaktfullUiPlaceholderStateTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;
  const ImpaktfullUiPlaceholderStateTextStyleTheme({
    required this.title,
    required this.subtitle,
  });
}
