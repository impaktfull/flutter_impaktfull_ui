import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/card/card.dart';
import 'package:impaktfull_ui/src/components/dropdown/dropdown.dart';

class ImpaktfullUiDropdownOverlay extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final BorderRadiusGeometry borderRadius;
  final ImpaktfullUiDropdownTheme theme;

  const ImpaktfullUiDropdownOverlay({
    required this.child,
    required this.theme,
    required this.height,
    required this.borderRadius,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiCard(
      width: width ?? 200,
      height: height,
      shadow: theme.shadows.overlay,
      borderRadius: borderRadius,
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: child,
      ),
    );
  }
}
