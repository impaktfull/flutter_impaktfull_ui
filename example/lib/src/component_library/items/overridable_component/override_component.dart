import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

class OverrideComponent extends StatelessWidget {
  final ImpaktfullUiRadioButton<bool?> component;

  const OverrideComponent({
    required this.component,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiCard(
      padding: const EdgeInsets.all(16),
      child: ImpaktfullUiAutoLayout.vertical(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'This component is overriden, from ImpaktfullUiRadioButton<bool?> to ImpaktfullUiSwitch',
            textAlign: TextAlign.center,
          ),
          ImpaktfullUiSwitch(
            value: component.isSelected,
            onChanged: (value) => component.onChanged?.call(value),
          ),
        ],
      ),
    );
  }
}
