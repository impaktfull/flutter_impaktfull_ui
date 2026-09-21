import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/components/section_title/section_title.dart';
import 'package:impaktfull_ui/src/components/time_picker/time_picker_style.dart';
import 'package:impaktfull_ui/src/util/locale/locale_util.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'time_picker_style.dart';

class ImpaktfullUiTimePicker extends StatefulWidget {
  final String? label;
  final TimeOfDay? value;
  final ValueChanged<TimeOfDay> onChanged;
  final ImpaktfullUiTimePickerTheme? theme;

  /// Whether the hours go from 0 to 23 (true) or from 1 to 12 with an AM/PM
  /// toggle (false).
  ///
  /// Defaults to 24 hours when `MediaQuery.alwaysUse24HourFormat` is set, and
  /// otherwise to the time format of the locale (the plain `en` locale, the
  /// default of `ImpaktfullUiApp`, keeps 24 hours).
  final bool? use24HourFormat;

  const ImpaktfullUiTimePicker({
    required this.value,
    required this.onChanged,
    this.label,
    this.theme,
    this.use24HourFormat,
    super.key,
  });

  @override
  State<ImpaktfullUiTimePicker> createState() => _ImpaktfullUiTimePickerState();
}

class _ImpaktfullUiTimePickerState extends State<ImpaktfullUiTimePicker> {
  late final TextEditingController _hoursController;
  late final TextEditingController _minutesController;
  late TimeOfDay _time;
  var _use24HourFormat = true;
  var _isInitialized = false;
  int get _hours => _time.hour;
  int get _minutes => _time.minute;

  /// The hour as shown in the hours field.
  int _displayHour(TimeOfDay time) {
    if (_use24HourFormat) return time.hour;
    final hourOfPeriod = time.hourOfPeriod;
    return hourOfPeriod == 0 ? 12 : hourOfPeriod;
  }

  var _hoursString = '';
  var _minutesString = '';

  String get hoursString => _hoursString;

  String get minutesString => _minutesString;

  @override
  void initState() {
    super.initState();
    _time = widget.value ?? TimeOfDay.now();
    _minutesString = _getFormatttedValue(_minutes, _minutes.toString());
    _hoursController = TextEditingController();
    _minutesController = TextEditingController(text: minutesString);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateHourFormat();
  }

  void _updateHourFormat() {
    final use24HourFormat = ImpaktfullUiLocaleUtil.use24HourFormat(
      context,
      override: widget.use24HourFormat,
    );
    if (_isInitialized && use24HourFormat == _use24HourFormat) return;
    _isInitialized = true;
    _use24HourFormat = use24HourFormat;
    final hour = _displayHour(_time);
    _hoursString = _getFormatttedValue(hour, hour.toString());
    if (_hoursController.text != hoursString) {
      _hoursController.text = hoursString;
    }
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiTimePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      final newTime = widget.value ?? TimeOfDay.now();
      // When the new value is the time the user just typed, keep the text as
      // typed (e.g. an empty field or a leading zero).
      if (newTime != _time) {
        _hoursString = _displayHour(newTime).toString();
        _minutesString = newTime.minute.toString();
      }
      _changeTime(newTime);
    }
    if (oldWidget.use24HourFormat != widget.use24HourFormat) {
      _updateHourFormat();
    }
  }

  @override
  void dispose() {
    _hoursController.dispose();
    _minutesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.vertical(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          if (widget.label != null) ...[
            ImpaktfullUiSectionTitle(
              title: widget.label!,
              margin: componentTheme.dimens.labelMargin,
            ),
          ],
          ImpaktfullUiAutoLayout.horizontal(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Expanded(
                child: ImpaktfullUiInputField(
                  controller: _hoursController,
                  value: hoursString,
                  textAlign: TextAlign.center,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]{0,2}')),
                  ],
                  textInputType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: false,
                  ),
                  onChanged: _onHoursChanged,
                ),
              ),
              const Text(':'),
              Expanded(
                child: ImpaktfullUiInputField(
                  value: minutesString,
                  controller: _minutesController,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]{0,2}')),
                  ],
                  textInputType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: false,
                  ),
                  onChanged: _onMinutesChanged,
                ),
              ),
              if (!_use24HourFormat) ...[
                ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.secondaryGrey,
                  title: _getPeriodLabel(context),
                  onTap: _onPeriodTapped,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  String _getPeriodLabel(BuildContext context) {
    final labels = ImpaktfullUiLocaleUtil.amPmLabels(context);
    return _time.period == DayPeriod.am ? labels.first : labels.last;
  }

  void _onPeriodTapped() {
    final hour = (_hours + 12) % 24;
    final newTime = TimeOfDay(hour: hour, minute: _minutes);
    setState(() => _changeTime(newTime));
    widget.onChanged(newTime);
  }

  void _onHoursChanged(String value) {
    final hasLeadingZero = value.length == 2 && value.startsWith('0');
    final maxHours = _use24HourFormat ? 23 : 12;
    int hours;
    if (value.isEmpty) {
      hours = 0;
    } else {
      hours = int.tryParse(value) ?? _displayHour(_time);
    }
    if (hours < 0) {
      hours = 0;
    } else if (hours > maxHours) {
      hours = maxHours;
    }
    _hoursString = _getFormatttedValue(hours, value);
    if (value.isEmpty) {
      _hoursString = '';
    } else if (hasLeadingZero) {
      _hoursString = '0${hours.toString()}';
    } else {
      _hoursString = hours.toString();
    }
    final hour24 = _use24HourFormat
        ? hours
        : hours % 12 + (_time.period == DayPeriod.pm ? 12 : 0);
    final newTime = TimeOfDay(hour: hour24, minute: _minutes);
    final shouldUpdateText = _hoursController.text != hours.toString();
    _changeTime(newTime);
    widget.onChanged(newTime);

    // Only update selection if we changed the text (e.g. user typed 80, we set 23)
    if (shouldUpdateText) {
      // Place cursor at the end, don't select all
      _hoursController.selection =
          TextSelection.collapsed(offset: _hoursController.text.length);
    }
  }

  void _onMinutesChanged(String value) {
    int minutes;
    if (value.isEmpty) {
      minutes = 0;
    } else {
      minutes = int.tryParse(value) ?? _minutes;
    }
    if (minutes < 0) {
      minutes = 0;
    } else if (minutes > 59) {
      minutes = 59;
    }
    _minutesString = _getFormatttedValue(minutes, value);
    final newTime = TimeOfDay(hour: _hours, minute: minutes);
    final shouldUpdateText = _minutesController.text != minutes.toString();
    _changeTime(newTime);
    widget.onChanged(newTime);

    // Only update selection if we changed the text (e.g. user typed 80, we set 59)
    if (shouldUpdateText) {
      // Place cursor at the end, don't select all
      _minutesController.selection =
          TextSelection.collapsed(offset: _minutesController.text.length);
    }
  }

  void _changeTime(TimeOfDay newTime) {
    _time = newTime;
    if (_hoursController.text != hoursString) {
      _hoursController.text = hoursString;
    }
    if (_minutesController.text != minutesString) {
      _minutesController.text = minutesString;
    }
  }

  String _getFormatttedValue(int timeValue, String value) {
    final hasLeadingZero = value.length == 2 && value.startsWith('0');
    if (value.isEmpty) {
      return '';
    } else if (hasLeadingZero) {
      return '0${timeValue.toString()}';
    } else {
      return timeValue.toString();
    }
  }
}
