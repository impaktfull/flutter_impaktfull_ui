import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiDatePickerLocalizations
    extends ImpaktfullUiComponentLocalizations {
  /// The title while the years are shown.
  final String selectYearTitle;

  /// The cancel button of the modal.
  final String cancelBtn;

  /// The apply button of the modal.
  final String applyBtn;

  /// Shown when there are no days to pick from.
  final String noDays;

  const ImpaktfullUiDatePickerLocalizations({
    this.selectYearTitle = 'Select a year',
    this.cancelBtn = 'Cancel',
    this.applyBtn = 'Apply',
    this.noDays = 'No Days',
  });

  static ImpaktfullUiDatePickerLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiDatePickerLocalizations>(
          context);

  ImpaktfullUiDatePickerLocalizations copyWith({
    String? selectYearTitle,
    String? cancelBtn,
    String? applyBtn,
    String? noDays,
  }) =>
      ImpaktfullUiDatePickerLocalizations(
        selectYearTitle: selectYearTitle ?? this.selectYearTitle,
        cancelBtn: cancelBtn ?? this.cancelBtn,
        applyBtn: applyBtn ?? this.applyBtn,
        noDays: noDays ?? this.noDays,
      );
}
