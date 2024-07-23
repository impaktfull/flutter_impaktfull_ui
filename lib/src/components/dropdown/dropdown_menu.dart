import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';

class ImpaktfullUiDropdownMenu extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final ImpaktfullUiDropdownTheme theme;

  const ImpaktfullUiDropdownMenu({
    required this.child,
    required this.theme,
    required this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 200,
      height: height,
      decoration: ShapeDecoration(
        color: theme.colors.menuBackground,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: theme.colors.menuBorder,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: theme.shadows.menuShadow,
      ),
      child: child,
    );
  }
}
