import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

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
    return GoldenTestScenario(
      name: description ?? '',
      child: child,
    );
  }
}
