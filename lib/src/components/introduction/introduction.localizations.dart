import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiIntroductionLocalizations
    extends ImpaktfullUiComponentLocalizations {
  /// The label of the button that goes to the next page.
  final String nextBtn;

  /// The label of the button that skips the introduction.
  final String skipBtn;

  /// The label of the button on the last page.
  final String doneBtn;

  const ImpaktfullUiIntroductionLocalizations({
    this.nextBtn = 'Next',
    this.skipBtn = 'Skip',
    this.doneBtn = 'Done',
  });

  static ImpaktfullUiIntroductionLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiIntroductionLocalizations>(
          context);

  ImpaktfullUiIntroductionLocalizations copyWith({
    String? nextBtn,
    String? skipBtn,
    String? doneBtn,
  }) =>
      ImpaktfullUiIntroductionLocalizations(
        nextBtn: nextBtn ?? this.nextBtn,
        skipBtn: skipBtn ?? this.skipBtn,
        doneBtn: doneBtn ?? this.doneBtn,
      );
}
