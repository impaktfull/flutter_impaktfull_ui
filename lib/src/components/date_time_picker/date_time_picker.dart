import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui/src/components/date_time_picker/date_time_picker_style.dart';
import 'package:impaktfull_ui/src/components/modal/modal.dart';
import 'package:impaktfull_ui/src/components/time_picker/time_picker.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'date_time_picker_style.dart';

class ImpaktfullUiDateTimePicker extends StatefulWidget {
  final DateTime? value;
  final void Function(DateTime) onChanged;
  final EdgeInsetsGeometry margin;
  final ImpaktfullUiDateTimePickerTheme? theme;

  const ImpaktfullUiDateTimePicker({
    required this.value,
    required this.onChanged,
    this.margin = EdgeInsets.zero,
    this.theme,
    super.key,
  });

  static Future<DateTime?> showModal({
    required BuildContext context,
    DateTime? value,
    bool showDividers = false,
    bool hasBlurredBackground = false,
    bool isDismissible = false,
    bool rootNavigator = false,
  }) {
    var newDate = value;
    return ImpaktfullUiModal.showSimple(
      context: context,
      hasClose: false,
      hasBlurredBackground: hasBlurredBackground,
      isDismissible: isDismissible,
      width: 310,
      rootNavigator: rootNavigator,
      showDividers: showDividers,
      childPadding: const EdgeInsets.only(top: 16),
      actions: [
        // Use the context of the modal route, not the caller's context:
        // with rootNavigator the modal is not on the caller's navigator.
        Builder(
          builder: (context) => ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondaryGrey,
            title: 'Cancel',
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
        Builder(
          builder: (context) => ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Apply',
            onTap: () => Navigator.of(context).pop(newDate),
          ),
        ),
      ],
      child: StatefulBuilder(
        builder: (context, setState) => ImpaktfullUiDateTimePicker(
          value: newDate,
          margin: const EdgeInsets.symmetric(horizontal: 16),
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
      _time = null;
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
        width: 280 + widget.margin.horizontal,
        margin: widget.margin,
        child: ImpaktfullUiAutoLayout.vertical(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            ImpaktfullUiDatePicker(
              selectedDate: _date,
              onDateChanged: _onDateChanged,
            ),
            ImpaktfullUiTimePicker(
              value: _time,
              onChanged: _onTimeChanged,
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
    // When only a time is picked (no date yet), use today
    // instead of a date in year 0.
    final date = _date ?? DateTime.now();
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
