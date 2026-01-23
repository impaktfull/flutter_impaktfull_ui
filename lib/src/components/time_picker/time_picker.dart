import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/components/section_title/section_title.dart';
import 'package:impaktfull_ui/src/components/time_picker/time_picker_style.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'time_picker_style.dart';

class ImpaktfullUiTimePicker extends StatefulWidget {
  final String? label;
  final TimeOfDay? value;
  final ValueChanged<TimeOfDay> onChanged;
  final ImpaktfullUiTimePickerTheme? theme;

  const ImpaktfullUiTimePicker({
    required this.value,
    required this.onChanged,
    this.label,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiTimePicker> createState() => _ImpaktfullUiTimePickerState();
}

class _ImpaktfullUiTimePickerState extends State<ImpaktfullUiTimePicker> {
  late final TextEditingController _hoursController;
  late final TextEditingController _minutesController;
  late TimeOfDay _time;
  int get _hours => _time.hour;
  int get _minutes => _time.minute;

  var _hoursString = '';
  var _minutesString = '';

  String get hoursString => _hoursString;

  String get minutesString => _minutesString;

  @override
  void initState() {
    super.initState();
    _time = widget.value ?? TimeOfDay.now();
    _hoursString = _getFormatttedValue(_hours, _hours.toString());
    _minutesString = _getFormatttedValue(_minutes, _minutes.toString());
    _hoursController = TextEditingController(text: hoursString);
    _minutesController = TextEditingController(text: minutesString);
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiTimePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _changeTime(widget.value ?? TimeOfDay.now());
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
            ],
          ),
        ],
      ),
    );
  }

  void _onHoursChanged(String value) {
    final hasLeadingZero = value.length == 2 && value.startsWith('0');
    int hours;
    if (value.isEmpty) {
      hours = 0;
    } else {
      hours = int.tryParse(value) ?? _hours;
    }
    if (hours < 0) {
      hours = 0;
    } else if (hours > 23) {
      hours = 23;
    }
    _hoursString = _getFormatttedValue(hours, value);
    if (value.isEmpty) {
      _hoursString = '';
    } else if (hasLeadingZero) {
      _hoursString = '0${hours.toString()}';
    } else {
      _hoursString = hours.toString();
    }
    final newTime = TimeOfDay(hour: hours, minute: _minutes);
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
