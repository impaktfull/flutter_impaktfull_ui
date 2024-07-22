import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/snacky/snacky_configurator_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:snacky/snacky.dart';
import 'package:intl/intl.dart' as intl;

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
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiSnackyConfiguratorTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) {
        final snackyBuilder = this.snackyBuilder ??
            SimpleSnackyBuilder(
              borderRadius: componentTheme.dimens.borderRadius,
              colorBuilder: (snacky) {
                switch (snacky.type) {
                  case SnackyType.error:
                    return Color.lerp(componentTheme.colors.error, Colors.white, 0.8) ?? componentTheme.colors.error;
                  case SnackyType.info:
                    return Color.lerp(componentTheme.colors.info, Colors.white, 0.8) ?? componentTheme.colors.info;
                  case SnackyType.success:
                    return Color.lerp(componentTheme.colors.success, Colors.white, 0.8) ??
                        componentTheme.colors.success;
                  case SnackyType.warning:
                    return Color.lerp(componentTheme.colors.warning, Colors.white, 0.8) ??
                        componentTheme.colors.warning;
                }
              },
              borderBuilder: (snacky) {
                const width = 1.0;
                switch (snacky.type) {
                  case SnackyType.error:
                    return Border.all(
                      color: componentTheme.colors.error,
                      width: width,
                    );
                  case SnackyType.info:
                    return Border.all(
                      color: componentTheme.colors.info,
                      width: width,
                    );
                  case SnackyType.success:
                    return Border.all(
                      color: componentTheme.colors.success,
                      width: width,
                    );
                  case SnackyType.warning:
                    return Border.all(
                      color: componentTheme.colors.warning,
                      width: width,
                    );
                }
              },
            );
        final languageCode = locale?.languageCode;
        return SnackyConfiguratorWidget(
          textDirection: languageCode == null
              ? TextDirection.ltr
              : intl.Bidi.isRtlLanguage(languageCode)
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          snackyController: snackyController,
          snackyBuilder: snackyBuilder,
          app: app,
        );
      },
    );
  }
}
