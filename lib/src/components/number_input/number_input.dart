import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/components/number_input/number_input_style.dart';
import 'package:impaktfull_ui/src/components/section_title/section_title.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'number_input_style.dart';

class ImpaktfullUiNumberInput<T extends num> extends StatefulWidget {
  final ValueChanged<T> onChanged;
  final String? label;
  final T value;
  final T? min;
  final T? max;
  final T? step;
  final ImpaktfullUiNumberInputTheme? theme;

  const ImpaktfullUiNumberInput({
    required this.value,
    required this.onChanged,
    this.label,
    this.min,
    this.max,
    this.step,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiNumberInput<T>> createState() =>
      _ImpaktfullUiNumberInputState<T>();
}

class _ImpaktfullUiNumberInputState<T extends num>
    extends State<ImpaktfullUiNumberInput<T>> {
  static const _defaultStepInt = 1;
  static const _defaultStepDouble = 1.0;

  late String _oldValue;
  late final TextEditingController _textController;

  T get _step {
    final step = widget.step;
    if (step != null) {
      return step;
    }
    if (T == int) {
      return _defaultStepInt as T;
    } else if (T == double) {
      return _defaultStepDouble as T;
    } else if (T == num) {
      return _defaultStepDouble as T;
    } else {
      throw UnsupportedError('Unsupported type for step: $T');
    }
  }

  @override
  void initState() {
    super.initState();
    _oldValue = widget.value.toString();
    _textController = TextEditingController(text: _oldValue);
  }

  @override
  void dispose() {
    _textController.dispose();
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
              title: widget.label ?? '',
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
                  value: _oldValue,
                  controller: _textController,
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
                onTap: () => _onDecrement(),
              ),
              ImpaktfullUiButton(
                type: ImpaktfullUiButtonType.secondaryGrey,
                leadingAsset: componentTheme.assets.plus,
                size: ImpaktfullUiButtonSize.small,
                onTap: () => _onIncrement(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onDecrement() {
    final newValue = widget.value - _step;
    if (widget.min != null && newValue < widget.min!) {
      return;
    }
    _onChanged(newValue.toString());
  }

  void _onIncrement() {
    final newValue = widget.value + _step;
    if (widget.max != null && newValue > widget.max!) {
      return;
    }
    _onChanged(newValue.toString());
  }

  void _onChanged(String value) {
    if (T == int) {
      _onChangedInt(value);
    } else {
      _onChangedDouble(value);
    }
  }

  void _onChangedInt(String value) {
    if (!RegExp(r'^-?\d*$').hasMatch(value)) {
      _resetToOldValue();
      return;
    }
    _oldValue = value;
    final intValue = int.tryParse(value);
    if (intValue == null) {
      widget.onChanged(widget.value);
      return;
    }

    final min = widget.min?.toInt();
    final max = widget.max?.toInt();
    var clampedValue = intValue;
    if (min != null && intValue < min) {
      clampedValue = min;
    }
    if (max != null && intValue > max) {
      clampedValue = max;
    }
    widget.onChanged(clampedValue as T);
  }

  void _onChangedDouble(String value) {
    if (!RegExp(r'^-?\d*[.,]?\d*$').hasMatch(value)) {
      _resetToOldValue();
      return;
    }
    _oldValue = value;
    final doubleValue = double.tryParse(value);
    if (doubleValue == null) {
      widget.onChanged(widget.value);
      return;
    }

    final min = widget.min?.toDouble();
    final max = widget.max?.toDouble();
    var clampedValue = doubleValue;
    if (min != null && doubleValue < min) {
      clampedValue = min;
    }
    if (max != null && doubleValue > max) {
      clampedValue = max;
    }
    widget.onChanged(clampedValue as T);
  }

  void _resetToOldValue() {
    _textController.text = _oldValue;
    _textController.selection =
        TextSelection.collapsed(offset: _textController.text.length);
  }
}
