import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/accessibility/accessibility.localizations.dart';
import 'package:impaktfull_ui/src/util/locale/locale_util.dart';

/// Announces a progress indicator as one element: its label and the
/// progress as a percentage (e.g. `Progress, 50%`).
class ImpaktfullUiProgressIndicatorSemantics extends StatelessWidget {
  final double value;
  final String? semanticLabel;
  final Widget child;

  const ImpaktfullUiProgressIndicatorSemantics({
    required this.value,
    required this.semanticLabel,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final label = semanticLabel ??
        ImpaktfullUiAccessibilityLocalizations.of(context).progress;
    return Semantics(
      container: true,
      label: label,
      value: ImpaktfullUiLocaleUtil.formatPercentage(
        context,
        value.clamp(0.0, 1.0),
      ),
      child: ExcludeSemantics(child: child),
    );
  }
}
