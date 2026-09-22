import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/widget/accessibility/min_tap_target.dart';

/// The control (checkbox, radio button, switch) at the end of a list item.
///
/// The whole list item is the tap target, the focusable element and the
/// semantics node (with the state of the control and the title as label), so
/// the control itself is not focused or announced a second time and keeps its
/// own size.
class ImpaktfullUiListItemControl extends StatelessWidget {
  final Widget child;

  const ImpaktfullUiListItemControl({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ExcludeFocus(
        child: ExcludeSemantics(
          child: ImpaktfullUiNoMinTapTarget(child: child),
        ),
      );
}
