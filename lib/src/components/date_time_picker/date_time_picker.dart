import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui/src/components/date_picker/util/date_picker_bounds.dart';
import 'package:impaktfull_ui/src/components/date_time_picker/date_time_picker.localizations.dart';
import 'package:impaktfull_ui/src/components/date_time_picker/date_time_picker_style.dart';
import 'package:impaktfull_ui/src/components/modal/modal.dart';
import 'package:impaktfull_ui/src/components/time_picker/time_picker.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'date_time_picker.localizations.dart';
export 'date_time_picker_style.dart';

class ImpaktfullUiDateTimePicker extends StatefulWidget {
  final DateTime? value;
  final void Function(DateTime) onChanged;
  final EdgeInsetsGeometry margin;
  final ImpaktfullUiDateTimePickerTheme? theme;

  /// The texts of the date picker. Defaults to the localizations of the app.
  final ImpaktfullUiDatePickerLocalizations? datePickerLocalizations;

  /// The first day of the week ([DateTime.monday] ... [DateTime.sunday]).
  /// Defaults to the first day of the week of the locale, or Monday.
  final int? firstDayOfWeek;

  /// Whether the time uses 24 hours. Defaults to
  /// `MediaQuery.alwaysUse24HourFormat` and the time format of the locale.
  final bool? use24HourFormat;

  /// The earliest date the user can pick, `null` (the default) for no limit.
  ///
  /// Named like `CalendarDatePicker.firstDate` of Flutter. Only the calendar
  /// day counts: the time picker is never limited, every time of day can be
  /// picked on the first day.
  final DateTime? firstDate;

  /// The latest date the user can pick, `null` (the default) for no limit.
  ///
  /// Named like `CalendarDatePicker.lastDate` of Flutter. Only the calendar
  /// day counts: the time picker is never limited, so a [lastDate] of
  /// 23/09/2026 10:00 still allows picking 23/09/2026 18:00.
  final DateTime? lastDate;

  const ImpaktfullUiDateTimePicker({
    required this.value,
    required this.onChanged,
    this.margin = EdgeInsets.zero,
    this.theme,
    this.datePickerLocalizations,
    this.firstDayOfWeek,
    this.use24HourFormat,
    this.firstDate,
    this.lastDate,
    super.key,
  });

  static Future<DateTime?> showModal({
    required BuildContext context,
    DateTime? value,
    bool showDividers = false,
    bool hasBlurredBackground = false,
    bool isDismissible = false,
    bool rootNavigator = false,
    ImpaktfullUiDateTimePickerLocalizations? localizations,
    ImpaktfullUiDatePickerLocalizations? datePickerLocalizations,
    int? firstDayOfWeek,
    bool? use24HourFormat,
    DateTime? firstDate,
    DateTime? lastDate,
  }) {
    assertValidDatePickerBounds(firstDate, lastDate);
    final dateTimePickerLocalizations = localizations ??
        ImpaktfullUiLocalizations.of<ImpaktfullUiDateTimePickerLocalizations>(
            context);
    var newDate = value;
    return ImpaktfullUiModal.showSimple(
      context: context,
      hasClose: false,
      hasBlurredBackground: hasBlurredBackground,
      isDismissible: isDismissible,
      width: ImpaktfullUiDateTimePickerTheme.of(context).dimens.width,
      rootNavigator: rootNavigator,
      showDividers: showDividers,
      childPadding: const EdgeInsets.only(top: 16),
      actions: [
        // Use the context of the modal route, not the caller's context:
        // with rootNavigator the modal is not on the caller's navigator.
        Builder(
          builder: (context) => ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondaryGrey,
            title: dateTimePickerLocalizations.cancelBtn,
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
        Builder(
          builder: (context) => ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: dateTimePickerLocalizations.applyBtn,
            onTap: () => Navigator.of(context).pop(newDate),
          ),
        ),
      ],
      child: StatefulBuilder(
        builder: (context, setState) => ImpaktfullUiDateTimePicker(
          value: newDate,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          datePickerLocalizations: datePickerLocalizations,
          firstDayOfWeek: firstDayOfWeek,
          use24HourFormat: use24HourFormat,
          firstDate: firstDate,
          lastDate: lastDate,
          onChanged: (value) {
            setState(() => newDate = value);
          },
        ),
      ),
    );
  }

  @override
  State<ImpaktfullUiDateTimePicker> createState() =>
      _ImpaktfullUiDateTimePickerState();
}

class _ImpaktfullUiDateTimePickerState
    extends State<ImpaktfullUiDateTimePicker> {
  TimeOfDay? _time;
  DateTime? _date;

  @override
  void initState() {
    super.initState();
    assertValidDatePickerBounds(widget.firstDate, widget.lastDate);
    _setValue(widget.value);
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiDateTimePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _setValue(widget.value);
    }
  }

  void _setValue(DateTime? value) {
    if (value == null) {
      _date = null;
      // The time picker shows the current time without a value: use the same
      // time when only a date is picked (instead of midnight).
      _time = TimeOfDay.now();
      return;
    }
    _date = DateTime(value.year, value.month, value.day);
    _time = TimeOfDay.fromDateTime(value);
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      overrideComponentTheme: widget.theme,
      component: widget,
      builder: (context, componentTheme) => Container(
        width: componentTheme.dimens.contentWidth + widget.margin.horizontal,
        margin: widget.margin,
        child: ImpaktfullUiAutoLayout.vertical(
          spacing: componentTheme.dimens.spacing,
          mainAxisSize: MainAxisSize.min,
          children: [
            ImpaktfullUiDatePicker(
              selectedDate: _date,
              onDateChanged: _onDateChanged,
              localizations: widget.datePickerLocalizations,
              firstDayOfWeek: widget.firstDayOfWeek,
              firstDate: widget.firstDate,
              lastDate: widget.lastDate,
            ),
            ImpaktfullUiTimePicker(
              value: _time,
              onChanged: _onTimeChanged,
              use24HourFormat: widget.use24HourFormat,
            ),
          ],
        ),
      ),
    );
  }

  void _onDateChanged(DateTime? value) {
    _date = value;
    _onDateTimeChanged();
  }

  void _onTimeChanged(TimeOfDay? value) {
    _time = value;
    _onDateTimeChanged();
  }

  void _onDateTimeChanged() {
    // When only a time is picked (no date yet), use today instead of a date
    // in year 0, moved inside `firstDate` / `lastDate` so the picker never
    // reports a date it does not allow.
    final date = _date ??
        ImpaktfullUiDatePickerBounds(
          firstDate: widget.firstDate,
          lastDate: widget.lastDate,
        ).clamp(DateTime.now());
    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      _time?.hour ?? 0,
      _time?.minute ?? 0,
    );
    widget.onChanged(dateTime);
  }
}
