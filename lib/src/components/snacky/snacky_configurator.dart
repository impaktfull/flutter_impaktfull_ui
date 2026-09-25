import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/snacky/snacky_builder.dart';
import 'package:impaktfull_ui/src/components/snacky/snacky_configurator_style.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';
import 'package:snacky/snacky.dart';
import 'package:intl/intl.dart' as intl;

export 'snacky_configurator_style.dart';

class ImpaktfullUiSnackyConfigurator extends StatelessWidget {
  final Widget app;
  final SnackyController? snackyController;
  final SnackyBuilder? snackyBuilder;
  final Locale? locale;
  final ImpaktfullUiSnackyConfiguratorTheme? theme;

  const ImpaktfullUiSnackyConfigurator({
    required this.app,
    this.snackyController,
    this.snackyBuilder,
    this.locale,
    this.theme,
    super.key,
  });

  /// The [SnackyController] of the closest [ImpaktfullUiSnackyConfigurator]
  /// (or `ImpaktfullUiApp`), or null when there is none.
  ///
  /// This is the `snackyController` passed to the configurator, or
  /// [SnackyController.instance] when none was passed.
  static SnackyController? maybeSnackyControllerOf(BuildContext context) =>
      context
          .getInheritedWidgetOfExactType<_SnackyControllerScope>()
          ?.snackyController;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final languageCode = locale?.languageCode;
        final textDirection = languageCode == null
            ? Directionality.maybeOf(context) ?? TextDirection.ltr
            : intl.Bidi.isRtlLanguage(languageCode)
                ? TextDirection.rtl
                // rtl-ignore: the direction of a left-to-right locale.
                : TextDirection.ltr;
        final snackyBuilder = this.snackyBuilder ??
            componentTheme.snackyBuilder?.call(componentTheme) ??
            ImpaktfullUiSnackyBuilder(componentTheme: componentTheme);

        return SnackyConfiguratorWidget(
          snackyController: snackyController,
          snackyBuilder: snackyBuilder,
          textDirection: textDirection,
          layoutConfig: const SnackyLayoutConfig(
            breakpoints: [
              SnackyLayoutBreakpointConfig(
                minWidth: 0,
                maxWidth: 600,
                snackyMaxWidth: double.infinity,
                snackyLocation: SnackyLocation.top,
              ),
              SnackyLayoutBreakpointConfig(
                minWidth: 600,
                maxWidth: 900,
                snackyMaxWidth: 300,
                snackyLocation: SnackyLocation.topEnd,
              ),
              SnackyLayoutBreakpointConfig(
                minWidth: 900,
                maxWidth: double.infinity,
                snackyPercentage: 0.33,
                snackyMaxWidth: 600,
                snackyLocation: SnackyLocation.topEnd,
              ),
            ],
          ),
          app: _SnackyControllerScope(
            snackyController: snackyController ?? SnackyController.instance,
            child: app,
          ),
        );
      },
    );
  }
}

class _SnackyControllerScope extends InheritedWidget {
  final SnackyController snackyController;

  const _SnackyControllerScope({
    required this.snackyController,
    required super.child,
  });

  @override
  bool updateShouldNotify(_SnackyControllerScope oldWidget) =>
      snackyController != oldWidget.snackyController;
}
