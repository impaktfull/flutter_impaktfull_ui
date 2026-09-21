import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiGalleryLocalizations
    extends ImpaktfullUiComponentLocalizations {
  /// The tooltip of the close button in fullscreen.
  final String closeFullscreenTooltip;

  /// The tooltip of the previous button in fullscreen.
  final String previousTooltip;

  /// The tooltip of the next button in fullscreen.
  final String nextTooltip;

  const ImpaktfullUiGalleryLocalizations({
    this.closeFullscreenTooltip = 'Close fullscreen',
    this.previousTooltip = 'Previous',
    this.nextTooltip = 'Next',
  });

  static ImpaktfullUiGalleryLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiGalleryLocalizations>(context);

  ImpaktfullUiGalleryLocalizations copyWith({
    String? closeFullscreenTooltip,
    String? previousTooltip,
    String? nextTooltip,
  }) =>
      ImpaktfullUiGalleryLocalizations(
        closeFullscreenTooltip:
            closeFullscreenTooltip ?? this.closeFullscreenTooltip,
        previousTooltip: previousTooltip ?? this.previousTooltip,
        nextTooltip: nextTooltip ?? this.nextTooltip,
      );
}
