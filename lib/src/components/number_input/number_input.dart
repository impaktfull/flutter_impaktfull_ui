import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/components/number_input/number_input_style.dart';
import 'package:impaktfull_ui/src/components/section_title/section_title.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export 'number_input_style.dart';

part 'number_input.describe.dart';

class ImpaktfullUiNumberInput<T extends num> extends StatelessWidget
    with ComponentDescriptorMixin {
  final ValueChanged<T> onChanged;
  final String? label;
  final T value;
  final T? min;
  final T? max;
  final ImpaktfullUiNumberInputTheme? theme;

  const ImpaktfullUiNumberInput({
    required this.value,
    required this.onChanged,
    this.label,
    this.min,
    this.max,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiNumberInputTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.vertical(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          if (label != null) ...[
            ImpaktfullUiSectionTitle(
              title: label ?? '',
              margin: EdgeInsets.zero,
            ),
          ],
          ImpaktfullUiAutoLayout.horizontal(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Expanded(
                child: ImpaktfullUiInputField(
                  value: value.toString(),
                  onChanged: _onChanged,
                  textInputType: TextInputType.numberWithOptions(
                    signed: T == int,
                    decimal: T == double,
                  ),
                ),
              ),
              ImpaktfullUiButton(
                type: ImpaktfullUiButtonType.secondaryGrey,
                leadingAsset: componentTheme.assets.minus,
                size: ImpaktfullUiButtonSize.small,
                onTap: () => _onChanged((value - 1).toString()),
              ),
              ImpaktfullUiButton(
                type: ImpaktfullUiButtonType.secondaryGrey,
                leadingAsset: componentTheme.assets.plus,
                size: ImpaktfullUiButtonSize.small,
                onTap: () => _onChanged((value + 1).toString()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  void _onChanged(String value) {
    if (T == int) {
      _onChangedInt(value) as T;
    } else {
      _onChangedDouble(value);
    }
  }

  void _onChangedInt(String value) {
    final intValue = int.tryParse(value);
    if (intValue == null) {
      onChanged(this.value);
      return;
    }

    final min = this.min as int?;
    final max = this.max as int?;
    var clampedValue = intValue;
    if (min != null && intValue < min) {
      clampedValue = min;
    }
    if (max != null && intValue > max) {
      clampedValue = max;
    }
    onChanged(clampedValue as T);
  }

  void _onChangedDouble(String value) {
    final doubleValue = double.tryParse(value);
    if (doubleValue == null) {
      onChanged(this.value);
      return;
    }

    final min = this.min as double?;
    final max = this.max as double?;
    var clampedValue = doubleValue;
    if (min != null && doubleValue < min) {
      clampedValue = min;
    }
    if (max != null && doubleValue > max) {
      clampedValue = max;
    }
    onChanged(clampedValue as T);
  }
}
