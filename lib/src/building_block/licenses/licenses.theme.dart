import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

/// The theme of `ImpaktfullUiBBLicenses`.
///
/// It only styles the image of a license that credits one (see
/// `ImpaktfullUiLicense.image`). Licenses without an image are not affected by
/// it.
class ImpaktfullUiBBLicensesTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiBBLicensesDimensTheme dimens;

  const ImpaktfullUiBBLicensesTheme({
    required this.dimens,
  });

  ImpaktfullUiBBLicensesTheme copyWith({
    ImpaktfullUiBBLicensesDimensTheme? dimens,
  }) =>
      ImpaktfullUiBBLicensesTheme(
        dimens: dimens ?? this.dimens,
      );

  static ImpaktfullUiBBLicensesTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.bbLicenses;

  static ImpaktfullUiBBLicensesTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiBBLicensesTheme(
        dimens: ImpaktfullUiBBLicensesDimensTheme(
          imageHeight: 160,
          imageBorderRadius: dimens.borderRadius,
          imageSpacing: 16,
        ),
      );
}

class ImpaktfullUiBBLicensesDimensTheme {
  /// The height of the image of a license. Its width follows the aspect ratio
  /// of the image, so it is never distorted.
  final double imageHeight;

  /// The corner radius of the image of a license.
  final BorderRadiusGeometry imageBorderRadius;

  /// The space between the image of a license and its texts.
  final double imageSpacing;

  const ImpaktfullUiBBLicensesDimensTheme({
    required this.imageHeight,
    required this.imageBorderRadius,
    required this.imageSpacing,
  });

  ImpaktfullUiBBLicensesDimensTheme copyWith({
    double? imageHeight,
    BorderRadiusGeometry? imageBorderRadius,
    double? imageSpacing,
  }) =>
      ImpaktfullUiBBLicensesDimensTheme(
        imageHeight: imageHeight ?? this.imageHeight,
        imageBorderRadius: imageBorderRadius ?? this.imageBorderRadius,
        imageSpacing: imageSpacing ?? this.imageSpacing,
      );
}
