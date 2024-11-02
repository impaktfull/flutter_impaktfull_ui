import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/snacky/snacky_builder.dart';
import 'package:impaktfull_ui_2/src/components/snacky/snacky_configurator_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
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

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<
        ImpaktfullUiSnackyConfiguratorTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final languageCode = locale?.languageCode;
        final textDirection = languageCode == null
            ? TextDirection.ltr
            : intl.Bidi.isRtlLanguage(languageCode)
                ? TextDirection.rtl
                : TextDirection.ltr;
        final snackyBuilder = this.snackyBuilder ??
            ImpaktfullSnackyBuilder(
              componentTheme: componentTheme,
            );

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
          app: app,
        );
      },
    );
  }
}
