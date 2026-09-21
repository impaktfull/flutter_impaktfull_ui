import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiColorInputFieldLocalizations
    extends ImpaktfullUiComponentLocalizations {
  /// The title of the color picker modal.
  final String colorPickerTitle;

  const ImpaktfullUiColorInputFieldLocalizations({
    this.colorPickerTitle = 'Select a color',
  });

  static ImpaktfullUiColorInputFieldLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiColorInputFieldLocalizations>(
          context);

  ImpaktfullUiColorInputFieldLocalizations copyWith({
    String? colorPickerTitle,
  }) =>
      ImpaktfullUiColorInputFieldLocalizations(
        colorPickerTitle: colorPickerTitle ?? this.colorPickerTitle,
      );
}
