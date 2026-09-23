import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

/// The texts that screen readers (TalkBack, VoiceOver, NVDA, ...) announce
/// for the components, next to the texts that are visible.
class ImpaktfullUiAccessibilityLocalizations
    extends ImpaktfullUiComponentLocalizations {
  /// Announced for a loading indicator and a skeleton.
  final String loading;

  /// The label of a progress indicator without a `semanticLabel`.
  final String progress;

  /// A notification badge with a number, e.g. `3 notifications`.
  final String Function(int count) notificationCount;

  /// A notification badge with a text that is not a number, e.g.
  /// `99+ notifications`.
  final String Function(String text) notificationText;

  /// A notification badge without a text (a dot).
  final String newNotification;

  /// A step of a stepper, e.g. `Step 2 of 4`. [step] starts at 1.
  final String Function(int step, int amountOfSteps) stepLabel;

  /// The state of a completed step.
  final String stepCompleted;

  /// The state of the step the user is on.
  final String stepCurrent;

  /// The summary of a line chart without a `semanticLabel`.
  final String Function(int amountOfLines, int amountOfPoints) lineChartSummary;

  /// The current item of a carousel, e.g. `Slide 2 of 5`. [slide] starts
  /// at 1.
  final String Function(int slide, int amountOfSlides) slideLabel;

  /// The close button of a badge.
  final String remove;

  /// The label of the command menu window.
  final String commandMenu;

  /// The tooltip of a close button (modal, bottom sheet).
  final String close;

  /// The tooltip of a button that shows more actions (metric).
  final String moreOptions;

  /// The tooltip of the button that shows the text of a password field.
  final String showPassword;

  /// The tooltip of the button that hides the text of a password field.
  final String hidePassword;

  /// The tooltip of the button that goes back from the cropped image to
  /// cropping (image crop).
  final String backToEditing;

  /// The tooltip of the button that undoes every change (image crop).
  final String reset;

  /// Announced for a day, month or year of a date picker that can not be
  /// picked because it is outside `firstDate` / `lastDate`.
  final String unavailableDate;

  const ImpaktfullUiAccessibilityLocalizations({
    this.loading = 'Loading',
    this.progress = 'Progress',
    this.notificationCount = _defaultNotificationCount,
    this.notificationText = _defaultNotificationText,
    this.newNotification = 'New notification',
    this.stepLabel = _defaultStepLabel,
    this.stepCompleted = 'Completed',
    this.stepCurrent = 'Current step',
    this.lineChartSummary = _defaultLineChartSummary,
    this.slideLabel = _defaultSlideLabel,
    this.remove = 'Remove',
    this.commandMenu = 'Command menu',
    this.close = 'Close',
    this.moreOptions = 'More options',
    this.showPassword = 'Show password',
    this.hidePassword = 'Hide password',
    this.backToEditing = 'Back to editing',
    this.reset = 'Reset',
    this.unavailableDate = 'Unavailable',
  });

  static ImpaktfullUiAccessibilityLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiAccessibilityLocalizations>(
          context);

  /// The label of a notification badge with [text], or without a text.
  String notificationBadge(String? text) {
    if (text == null) return newNotification;
    final count = int.tryParse(text.trim());
    if (count != null) return notificationCount(count);
    return notificationText(text);
  }

  ImpaktfullUiAccessibilityLocalizations copyWith({
    String? loading,
    String? progress,
    String Function(int count)? notificationCount,
    String Function(String text)? notificationText,
    String? newNotification,
    String Function(int step, int amountOfSteps)? stepLabel,
    String? stepCompleted,
    String? stepCurrent,
    String Function(int amountOfLines, int amountOfPoints)? lineChartSummary,
    String Function(int slide, int amountOfSlides)? slideLabel,
    String? remove,
    String? commandMenu,
    String? close,
    String? moreOptions,
    String? showPassword,
    String? hidePassword,
    String? backToEditing,
    String? reset,
    String? unavailableDate,
  }) =>
      ImpaktfullUiAccessibilityLocalizations(
        loading: loading ?? this.loading,
        progress: progress ?? this.progress,
        notificationCount: notificationCount ?? this.notificationCount,
        notificationText: notificationText ?? this.notificationText,
        newNotification: newNotification ?? this.newNotification,
        stepLabel: stepLabel ?? this.stepLabel,
        stepCompleted: stepCompleted ?? this.stepCompleted,
        stepCurrent: stepCurrent ?? this.stepCurrent,
        lineChartSummary: lineChartSummary ?? this.lineChartSummary,
        slideLabel: slideLabel ?? this.slideLabel,
        remove: remove ?? this.remove,
        commandMenu: commandMenu ?? this.commandMenu,
        close: close ?? this.close,
        moreOptions: moreOptions ?? this.moreOptions,
        showPassword: showPassword ?? this.showPassword,
        hidePassword: hidePassword ?? this.hidePassword,
        backToEditing: backToEditing ?? this.backToEditing,
        reset: reset ?? this.reset,
        unavailableDate: unavailableDate ?? this.unavailableDate,
      );
}

String _defaultNotificationCount(int count) =>
    count == 1 ? '1 notification' : '$count notifications';

String _defaultNotificationText(String text) => '$text notifications';

String _defaultStepLabel(int step, int amountOfSteps) =>
    'Step $step of $amountOfSteps';

String _defaultLineChartSummary(int amountOfLines, int amountOfPoints) {
  final lines = amountOfLines == 1 ? '1 line' : '$amountOfLines lines';
  final points =
      amountOfPoints == 1 ? '1 data point' : '$amountOfPoints data points';
  return 'Line chart with $lines and $points';
}

String _defaultSlideLabel(int slide, int amountOfSlides) =>
    'Slide $slide of $amountOfSlides';
