import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/pin_code/pin_code.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiPinCodeValue extends StatelessWidget {
  final String code;
  final int length;
  final ImpaktfullUiPinCodeTheme theme;
  const ImpaktfullUiPinCodeValue({
    required this.length,
    required this.code,
    required this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.horizontal(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: List.generate(
          length,
          (index) => Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: index < code.length
                  ? componentTheme.colors.valueBackgroundSelected
                  : componentTheme.colors.valueBackground,
              border: Border.all(color: componentTheme.colors.valueBorder),
              borderRadius: componentTheme.dimens.valueBorderRadius,
            ),
          ),
        ),
      ),
    );
  }
}
