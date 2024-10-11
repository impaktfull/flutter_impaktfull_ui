import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiWysiwygTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiWysiwygAssetsTheme assets;
  final ImpaktfullUiWysiwygColorTheme colors;
  final ImpaktfullUiWysiwygDimensTheme dimens;
  final ImpaktfullUiWysiwygTextStyleTheme textStyles;

  const ImpaktfullUiWysiwygTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiWysiwygTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.wysiwyg;
}

class ImpaktfullUiWysiwygAssetsTheme {
  const ImpaktfullUiWysiwygAssetsTheme();
}

class ImpaktfullUiWysiwygColorTheme {
  const ImpaktfullUiWysiwygColorTheme();
}

class ImpaktfullUiWysiwygDimensTheme {
  const ImpaktfullUiWysiwygDimensTheme();
}


class ImpaktfullUiWysiwygTextStyleTheme {
  const ImpaktfullUiWysiwygTextStyleTheme();
}
