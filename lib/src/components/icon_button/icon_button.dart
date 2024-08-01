import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';

part 'icon_button.describe.dart';

class ImpaktfullUiIconButton extends StatelessWidget with ComponentDescriptorMixin {
  final VoidCallback onTap;
  final IconData icon;
  const ImpaktfullUiIconButton({
    required this.onTap,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiTouchFeedback(
      borderRadius: BorderRadius.circular(9999),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Icon(
          icon,
          size: 16,
        ),
      ),
    );
  }

  @override
  String describe() => _describeInstance(this);
}
