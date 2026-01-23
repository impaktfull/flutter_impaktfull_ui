import 'package:flutter/material.dart';

class ImpaktfullUiWrap extends StatelessWidget {
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
}
