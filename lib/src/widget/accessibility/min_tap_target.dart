import 'package:flutter/widgets.dart';

/// Makes [child] at least [minSize] big for pointer input, without changing
/// how [child] looks.
///
/// Without a [minSize] (the default of the components) the layout stays
/// exactly as it is. With one, the area around [child] also calls [onTap], so
/// small controls (a checkbox, a radio button) meet the 48x48 tap target
/// guideline of Android and the 44x44 guideline of iOS.
class ImpaktfullUiMinTapTarget extends StatelessWidget {
  final Size? minSize;
  final VoidCallback? onTap;
  final Widget child;

  const ImpaktfullUiMinTapTarget({
    required this.minSize,
    required this.onTap,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final minSize = this.minSize;
    if (minSize == null) return child;
    if (context.dependOnInheritedWidgetOfExactType<_NoMinTapTarget>() != null) {
      return child;
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      // The semantics of the component already have the tap action.
      excludeFromSemantics: true,
      onTap: onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: minSize.width,
          minHeight: minSize.height,
        ),
        child: Center(
          widthFactor: 1,
          heightFactor: 1,
          child: child,
        ),
      ),
    );
  }
}

/// Keeps the controls in [child] at their own size, also when their theme
/// has a `minTapTargetSize`: e.g. the checkbox of a list item, where the whole
/// row is the tap target.
class ImpaktfullUiNoMinTapTarget extends StatelessWidget {
  final Widget child;

  const ImpaktfullUiNoMinTapTarget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => _NoMinTapTarget(child: child);
}

class _NoMinTapTarget extends InheritedWidget {
  const _NoMinTapTarget({required super.child});

  @override
  bool updateShouldNotify(_NoMinTapTarget oldWidget) => false;
}
