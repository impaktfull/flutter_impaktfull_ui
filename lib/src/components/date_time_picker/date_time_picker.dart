import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui_2/src/components/date_time_picker/date_time_picker_style.dart';
import 'package:impaktfull_ui_2/src/components/modal/modal.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/time_picker/time_picker.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'date_time_picker_style.dart';

part 'date_time_picker.describe.dart';

class ImpaktfullUiDateTimePicker extends StatefulWidget
    with ComponentDescriptorMixin {
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
      childPadding: const EdgeInsets.only(top: 16),
      actions: [
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.secondaryGrey,
          title: 'Cancel',
          onTap: () => Navigator.of(context).pop(),
        ),
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Apply',
          onTap: () {
            Navigator.of(context).pop(newDate);
          },
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

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiDateTimePickerState
    extends State<ImpaktfullUiDateTimePicker> {
  TimeOfDay? _time;
  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiDateTimePickerTheme>(
      overrideComponentTheme: widget.theme,
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
    final dateTime = DateTime(
      _date?.year ?? 0,
      _date?.month ?? 0,
      _date?.day ?? 0,
      _time?.hour ?? 0,
      _time?.minute ?? 0,
    );
    widget.onChanged(dateTime);
  }
}
