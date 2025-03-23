import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/app/debug/app_debug_flag.dart';
import 'package:impaktfull_ui/src/components/localization/localization_configurator.dart';
import 'package:impaktfull_ui/src/components/snacky/snacky_configurator.dart';
import 'package:impaktfull_ui/src/components/theme/theme_configurator.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';
import 'package:snacky/snacky.dart';

class ImpaktfullUiApp extends StatelessWidget {
  final String title;
  final Widget? home;
  final SnackyController? snackyController;
  final bool snackyUseNavigationObserver;
  final SnackyBuilder? snackyBuilder;
  final ImpaktfullUiTheme? impaktfullUiTheme;
  final ThemeData? materialLightTheme;
  final ThemeData? materialDarkTheme;
  final Locale? locale;
  final Iterable<Locale> supportedLocales;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final ImpaktfullUiLocalizations? localizations;
  final List<NavigatorObserver> navigatorObservers;
  final GlobalKey<NavigatorState>? navigatorKey;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final Widget Function(BuildContext context, Widget app)? builder;
  final TargetPlatform? targetPlatform;
  final bool showDebugFlag;
  final String? flavorBannerText;
  final Color? flavorBannerColor;

  const ImpaktfullUiApp({
    required this.title,
    this.home,
    this.snackyController,
    this.snackyUseNavigationObserver = true,
    this.snackyBuilder,
    this.impaktfullUiTheme,
    this.materialLightTheme,
    this.materialDarkTheme,
    this.locale,
    this.supportedLocales = const <Locale>[Locale('en')],
    this.localizationsDelegates,
    this.localizations,
    this.navigatorKey,
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.targetPlatform,
    this.showDebugFlag = kDebugMode,
    this.flavorBannerText,
    this.flavorBannerColor,
    super.key,
  }) : assert(
          home != null || onGenerateRoute != null || builder != null,
          'Either home or onGenerateRoute or builder must be provided',
        );

  @override
  Widget build(BuildContext context) {
    final theme = impaktfullUiTheme ?? ImpaktfullUiTheme.getDefault();
    setImpaktfullUiLocale(locale);
    return ImpaktfullUiThemeConfigurator(
      theme: theme,
      child: ImpaktfullUiLocalizationConfigurator(
        localizations: localizations ?? const ImpaktfullUiLocalizations(),
        child: ImpaktfullUiSnackyConfigurator(
          locale: locale,
          snackyController: snackyController,
          snackyBuilder: snackyBuilder,
          app: Builder(
            builder: (context) {
              final app = AppDebugFlag(
                showDebugFlag: showDebugFlag,
                flavorBannerText: flavorBannerText,
                flavorBannerColor: flavorBannerColor ?? theme.colors.accent,
                child: MaterialApp(
                  title: title,
                  home: home,
                  debugShowCheckedModeBanner: showDebugFlag,
                  locale: locale,
                  theme: (materialLightTheme ?? Theme.of(context))
                      .removeUnwantedBehavior(
                    targetPlatform: targetPlatform,
                  ),
                  darkTheme: (materialLightTheme ?? Theme.of(context))
                      .removeUnwantedBehavior(
                    targetPlatform: targetPlatform,
                  ),
                  supportedLocales: supportedLocales,
                  localizationsDelegates: localizationsDelegates,
                  navigatorKey: navigatorKey,
                  initialRoute: initialRoute,
                  onGenerateRoute: onGenerateRoute,
                  onGenerateInitialRoutes:
                      onGenerateRoute == null && onGenerateInitialRoutes == null
                          ? null
                          : onGenerateInitialRoutes ??
                              (initialRoute) {
                                final settings = RouteSettings(
                                  name: initialRoute,
                                );
                                final route = onGenerateRoute!(settings);
                                if (route == null) {
                                  throw Exception(
                                      'Route not found for $initialRoute');
                                }
                                return [route];
                              },
                  navigatorObservers: [
                    if (snackyUseNavigationObserver) ...[
                      SnackyNavigationObserver(),
                    ],
                    ...navigatorObservers,
                  ],
                ),
              );
              return builder?.call(context, app) ?? app;
            },
          ),
        ),
      ),
    );
  }
}

extension ThemeDataExtension on ThemeData {
  ThemeData removeUnwantedBehavior({
    required TargetPlatform? targetPlatform,
  }) =>
      copyWith(
        platform: targetPlatform,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(
              allowEnterRouteSnapshotting: false,
            ),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      );
}
