import 'package:flutter/material.dart';

class DebugWidgetLocator extends StatelessWidget {
  final Color color;
  final Widget child;

  const DebugWidgetLocator({
    required this.child,
    this.color = Colors.amber,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: color,
        child: child,
      );
}
