import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullUiOverridableComponentConfigurator extends StatefulWidget {
  final List<
          ImpaktfullUiOverridableComponent<Widget, ImpaktfullUiComponentTheme>>
      overrideComponents;
  final Widget child;

  const ImpaktfullUiOverridableComponentConfigurator({
    required this.overrideComponents,
    required this.child,
    super.key,
  });

  static _ImpaktfullUiOverridableComponentConfiguratorState? _maybeOf(
          BuildContext context) =>
      context.findAncestorStateOfType<
          _ImpaktfullUiOverridableComponentConfiguratorState>();

  static ImpaktfullUiOverridableComponent<T, E>? getOverrideComponent<
      T extends Widget, E extends ImpaktfullUiComponentTheme>(
    BuildContext context,
  ) {
    final configurator = _maybeOf(context);
    if (configurator == null) return null;
    final overrideComponents = configurator.widget.overrideComponents;
    for (final overrideComponent in overrideComponents) {
      if (overrideComponent is ImpaktfullUiOverridableComponent<T, E>) {
        return overrideComponent;
      }
    }
    return getOverrideComponent(configurator.context);
  }

  @override
  State<ImpaktfullUiOverridableComponentConfigurator> createState() =>
      _ImpaktfullUiOverridableComponentConfiguratorState();
}

class _ImpaktfullUiOverridableComponentConfiguratorState
    extends State<ImpaktfullUiOverridableComponentConfigurator> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
