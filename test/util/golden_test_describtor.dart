import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

class GoldenTestDescribtor extends StatelessWidget {
  final String? description;
  final Widget child;

  const GoldenTestDescribtor({
    required this.description,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final child = this.child;
    var description = this.description;
    if (child is ComponentDescriptorMixin) {
      final descriptor = child as ComponentDescriptorMixin;
      description = descriptor.describe(context);
    }
    return GoldenTestScenario(
      name: description ?? '',
      child: child,
    );
  }
}
