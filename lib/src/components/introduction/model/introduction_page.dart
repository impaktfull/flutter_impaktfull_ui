import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';

/// One page of an `ImpaktfullUiIntroduction`.
class ImpaktfullUiIntroductionPage {
  /// The title, below the [asset].
  final String title;

  /// The text below the [title].
  final String? subtitle;

  /// The illustration or icon above the [title].
  final ImpaktfullUiAsset? asset;

  /// Extra content below the [subtitle].
  final Widget? child;

  const ImpaktfullUiIntroductionPage({
    required this.title,
    this.subtitle,
    this.asset,
    this.child,
  });
}
