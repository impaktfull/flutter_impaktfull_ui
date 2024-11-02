import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

part 'wrap.describe.dart';

class ImpaktfullUiWrap extends StatelessWidget with ComponentDescriptorMixin {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  const ImpaktfullUiWrap({
    required this.children,
    this.spacing = 0,
    this.runSpacing = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: children,
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
