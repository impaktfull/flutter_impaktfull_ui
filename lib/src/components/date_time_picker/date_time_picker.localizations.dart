import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiDateTimePickerLocalizations
    extends ImpaktfullUiComponentLocalizations {
  /// The cancel button of the modal.
  final String cancelBtn;

  /// The apply button of the modal.
  final String applyBtn;

  const ImpaktfullUiDateTimePickerLocalizations({
    this.cancelBtn = 'Cancel',
    this.applyBtn = 'Apply',
  });

  static ImpaktfullUiDateTimePickerLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiDateTimePickerLocalizations>(
          context);

  ImpaktfullUiDateTimePickerLocalizations copyWith({
    String? cancelBtn,
    String? applyBtn,
  }) =>
      ImpaktfullUiDateTimePickerLocalizations(
        cancelBtn: cancelBtn ?? this.cancelBtn,
        applyBtn: applyBtn ?? this.applyBtn,
      );
}
