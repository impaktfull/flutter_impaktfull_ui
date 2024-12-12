import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiMetricTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiMetricAssetsTheme assets;
  final ImpaktfullUiMetricColorTheme colors;
  final ImpaktfullUiMetricDimensTheme dimens;
  final ImpaktfullUiMetricTextStyleTheme textStyles;

  const ImpaktfullUiMetricTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiMetricTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.metric;
}

class ImpaktfullUiMetricAssetsTheme {
  final ImpaktfullUiAsset more;
  const ImpaktfullUiMetricAssetsTheme({
    required this.more,
  });
}

class ImpaktfullUiMetricColorTheme {
  const ImpaktfullUiMetricColorTheme();
}

class ImpaktfullUiMetricDimensTheme {
  const ImpaktfullUiMetricDimensTheme();
}

class ImpaktfullUiMetricTextStyleTheme {
  final TextStyle title;
  final TextStyle value;
  final TextStyle value2Growth;
  final TextStyle value2Neutral;
  final TextStyle value2Decline;
  final TextStyle value2Branded;
  final TextStyle value2Custom;
  const ImpaktfullUiMetricTextStyleTheme({
    required this.title,
    required this.value,
    required this.value2Growth,
    required this.value2Neutral,
    required this.value2Decline,
    required this.value2Branded,
    required this.value2Custom,
  });
}
