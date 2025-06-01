import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_configurator.dart';

class ImpaktfullUiOverridableComponent<T extends Widget,
    E extends ImpaktfullUiComponentTheme> {
  final Widget Function(
    BuildContext context,
    T component,
    E theme,
  ) builder;

  const ImpaktfullUiOverridableComponent({
    required this.builder,
  });

  Widget build(
    BuildContext context,
    T component,
    E theme,
  ) =>
      builder(context, component, theme);
}

class ImpaktfullUiOverridableComponentBuilder<T extends Widget,
    E extends ImpaktfullUiComponentTheme> extends StatelessWidget {
  final Widget Function(BuildContext context, E theme) builder;
  final T component;
  final E? overrideComponentTheme;

  const ImpaktfullUiOverridableComponentBuilder({
    required this.builder,
    required this.component,
    required this.overrideComponentTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<E>(
      overrideComponentTheme: overrideComponentTheme,
      builder: (context, componentTheme) {
        final overrideComponent = ImpaktfullUiOverridableComponentConfigurator
            .getOverrideComponent<T, E>(context);
        if (overrideComponent == null) {
          return builder(context, componentTheme);
        }
        return overrideComponent.build(
          context,
          component,
          componentTheme,
        );
      },
    );
  }
}
