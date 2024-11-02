import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiAvatarTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiAvatarAssetsTheme assets;
  final ImpaktfullUiAvatarColorTheme colors;
  final ImpaktfullUiAvatarDimensTheme dimens;
  final ImpaktfullUiAvatarTextStyleTheme textStyles;

  const ImpaktfullUiAvatarTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiAvatarTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.avatar;
}

class ImpaktfullUiAvatarAssetsTheme {
  final ImpaktfullUiAsset? placeholder;
  const ImpaktfullUiAvatarAssetsTheme({
    required this.placeholder,
  });
}

class ImpaktfullUiAvatarColorTheme {
  final Color border;
  final Color background;
  final Color placeholder;
  const ImpaktfullUiAvatarColorTheme({
    required this.border,
    required this.background,
    required this.placeholder,
  });
}

class ImpaktfullUiAvatarDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiAvatarDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiAvatarTextStyleTheme {
  const ImpaktfullUiAvatarTextStyleTheme();
}
