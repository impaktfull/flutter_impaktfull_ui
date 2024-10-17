import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/section_title/section_title.dart';
import 'package:impaktfull_ui_2/src/components/time_picker/time_picker_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'time_picker_style.dart';

part 'time_picker.describe.dart';

class ImpaktfullUiTimePicker extends StatefulWidget
    with ComponentDescriptorMixin {
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

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiTimePickerState extends State<ImpaktfullUiTimePicker> {
  late final TextEditingController _hoursController;
  late final TextEditingController _minutesController;
  late TimeOfDay time;

  int get hours => time.hour;
  int get minutes => time.minute;
  String get hoursString => hours.toString().padLeft(2, '0');
  String get minutesString => minutes.toString().padLeft(2, '0');

  @override
  void initState() {
    super.initState();
    time = widget.value ?? TimeOfDay.now();
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
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiTimePickerTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.vertical(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          if (widget.label != null) ...[
            ImpaktfullUiSectionTitle(
              title: widget.label!,
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
    int hours;
    if (value.isEmpty) {
      hours = 0;
    } else {
      hours = int.tryParse(value) ?? this.hours;
    }
    if (hours < 0) {
      hours = 0;
    } else if (hours > 23) {
      hours = 23;
    }
    final newTime = TimeOfDay(hour: hours, minute: minutes);
    _changeTime(newTime);
    widget.onChanged(newTime);
  }

  void _onMinutesChanged(String value) {
    int minutes;
    if (value.isEmpty) {
      minutes = 0;
    } else {
      minutes = int.tryParse(value) ?? this.minutes;
    }
    if (minutes < 0) {
      minutes = 0;
    } else if (minutes > 59) {
      minutes = 59;
    }
    final newTime = TimeOfDay(hour: hours, minute: minutes);
    _changeTime(newTime);
    widget.onChanged(newTime);
  }

  void _changeTime(TimeOfDay newTime) {
    time = newTime;
    if (_hoursController.text != hoursString) {
      _hoursController.text = hoursString;
    }
    if (_minutesController.text != minutesString) {
      _minutesController.text = minutesString;
    }
  }
}
