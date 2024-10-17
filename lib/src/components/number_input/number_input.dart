import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/number_input/number_input_style.dart';
import 'package:impaktfull_ui_2/src/components/section_title/section_title.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'number_input_style.dart';

part 'number_input.describe.dart';

class ImpaktfullUiNumberInput extends StatelessWidget
    with ComponentDescriptorMixin {
  final ValueChanged<int> onChanged;
  final String? label;
  final int value;
  final ImpaktfullUiNumberInputTheme? theme;

  const ImpaktfullUiNumberInput({
    required this.value,
    required this.onChanged,
    this.label,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiNumberInputTheme>(
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
                  textInputType: const TextInputType.numberWithOptions(
                    signed: true,
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
    final intValue = int.tryParse(value);
    if (intValue == null) return;
    onChanged(intValue);
  }
}
