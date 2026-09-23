import 'package:impaktfull_ui/src/models/asset.dart';

/// One entry of the licenses screen (`ImpaktfullUiBBLicenses`).
///
/// The licenses of the packages of the app are built from Flutter's
/// `LicenseRegistry`. An app adds its own entries with
/// `ImpaktfullUiBBLicenses.customLicenses`, e.g. to credit the author of a
/// photo. Such an entry can show the [image] it credits next to its text.
class ImpaktfullUiLicense {
  /// The title of the entry: the name of the package, or of whatever the
  /// custom license is about (e.g. `Photo by Jane Doe`).
  final String name;

  /// The license texts, rendered as markdown below each other.
  final List<String> licenses;

  /// An optional image that is shown above the license texts, e.g. the photo
  /// whose author is credited by this entry.
  ///
  /// Any [ImpaktfullUiAsset] works: `ImpaktfullUiAsset.pixel`,
  /// `ImpaktfullUiAsset.svg` and `ImpaktfullUiAsset.network`.
  final ImpaktfullUiAsset? image;

  /// What screen readers announce for [image] (its alt text).
  ///
  /// Defaults to [name] when it is not given, so the image is never
  /// unlabelled.
  final String? imageSemanticLabel;

  String get licenseString => licenses.join('\n\n---\n\n');

  const ImpaktfullUiLicense({
    required this.name,
    required this.licenses,
    this.image,
    this.imageSemanticLabel,
  });

  /// A copy of this license with the given fields replaced.
  ImpaktfullUiLicense copyWith({
    String? name,
    List<String>? licenses,
    ImpaktfullUiAsset? image,
    String? imageSemanticLabel,
  }) =>
      ImpaktfullUiLicense(
        name: name ?? this.name,
        licenses: licenses ?? this.licenses,
        image: image ?? this.image,
        imageSemanticLabel: imageSemanticLabel ?? this.imageSemanticLabel,
      );
}
