import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/app/debug/app_debug_flag.dart';
import 'package:impaktfull_ui/src/components/localization/localization_configurator.dart';
import 'package:impaktfull_ui/src/components/snacky/snacky_configurator.dart';
import 'package:impaktfull_ui/src/components/theme/theme_configurator.dart';
import 'package:impaktfull_ui/src/theme/global_theme.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_configurator.dart';
import 'package:snacky/snacky.dart';

class ImpaktfullUiApp extends StatelessWidget {
  final String title;
  final Widget? home;
  final SnackyController? snackyController;
  final bool snackyUseNavigationObserver;
  final SnackyBuilder? snackyBuilder;

  /// The impaktfull ui theme of the app.
  ///
  /// Defaults to [ImpaktfullUiTheme.getDefault], created once and shared by
  /// every app without a theme: a new theme on every build would notify every
  /// widget that reads the theme on every build.
  final ImpaktfullUiTheme? impaktfullUiTheme;

  /// The impaktfull ui theme of the app when the [themeMode] resolves to
  /// [Brightness.dark], e.g. [ImpaktfullUiTheme.getDefaultDark].
  ///
  /// Without it the app always uses [impaktfullUiTheme], like a `MaterialApp`
  /// without a `darkTheme`.
  final ImpaktfullUiTheme? impaktfullUiDarkTheme;

  /// Which of [impaktfullUiTheme] and [impaktfullUiDarkTheme] is used.
  ///
  /// Defaults to [ImpaktfullUiThemeMode.system]: the dark theme when
  /// [MediaQueryData.platformBrightness] is dark. It is also passed to the
  /// `MaterialApp`, so [materialLightTheme] and [materialDarkTheme] follow the
  /// same mode.
  final ImpaktfullUiThemeMode themeMode;
  final ThemeData? materialLightTheme;
  final ThemeData? materialDarkTheme;
  final Locale? locale;
  final Iterable<Locale> supportedLocales;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final ImpaktfullUiLocalizations localizations;
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
  final List<
          ImpaktfullUiOverridableComponent<Widget, ImpaktfullUiComponentTheme>>
      overrideComponents;

  const ImpaktfullUiApp({
    required this.title,
    this.home,
    this.snackyController,
    this.snackyUseNavigationObserver = true,
    this.snackyBuilder,
    this.impaktfullUiTheme,
    this.impaktfullUiDarkTheme,
    this.themeMode = ImpaktfullUiThemeMode.system,
    this.materialLightTheme,
    this.materialDarkTheme,
    this.locale,
    this.supportedLocales = const <Locale>[Locale('en')],
    this.localizationsDelegates,
    this.localizations = const ImpaktfullUiLocalizations(),
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
    this.overrideComponents = const [],
    super.key,
  }) : assert(
          home != null || onGenerateRoute != null || builder != null,
          'Either home or onGenerateRoute or builder must be provided',
        );

  static ImpaktfullUiApp of(BuildContext context) => maybeOf(context)!;

  static ImpaktfullUiApp? maybeOf(BuildContext context) =>
      context.findAncestorWidgetOfExactType<ImpaktfullUiApp>();

  @override
  Widget build(BuildContext context) {
    // The platform brightness is only read to choose between the light and
    // the dark theme. Without a dark theme there is nothing to choose, so the
    // app does not depend on the brightness at all. `ImpaktfullUiApp` is
    // above the `MaterialApp` that creates the `MediaQuery`, so it creates
    // one itself when there is none above it.
    if (_followsPlatformBrightness &&
        MediaQuery.maybePlatformBrightnessOf(context) == null) {
      return MediaQuery.fromView(
        view: View.of(context),
        child: Builder(builder: _build),
      );
    }
    return _build(context);
  }

  bool get _followsPlatformBrightness =>
      impaktfullUiDarkTheme != null &&
      themeMode == ImpaktfullUiThemeMode.system;

  /// The theme of the app: [impaktfullUiDarkTheme] when [themeMode] resolves
  /// to [Brightness.dark], [impaktfullUiTheme] otherwise, and the shared
  /// default theme when there is none.
  ImpaktfullUiTheme _resolveTheme(BuildContext context) {
    final darkTheme = impaktfullUiDarkTheme;
    if (darkTheme != null && themeMode.resolve(context) == Brightness.dark) {
      return darkTheme;
    }
    return impaktfullUiTheme ?? _defaultTheme;
  }

  Widget _build(BuildContext context) {
    final theme = _resolveTheme(context);
    // Keeps the deprecated global `locale` getter working until 1.0.0.
    updateGlobalImpaktfullUiLocale(locale);
    return ImpaktfullUiThemeConfigurator(
      theme: theme,
      child: ImpaktfullUiOverridableComponentConfigurator(
        overrideComponents: overrideComponents,
        child: ImpaktfullUiLocalizationConfigurator(
          localizations: localizations,
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
                    theme: _removeUnwantedBehavior(
                      materialLightTheme ?? Theme.of(context),
                      targetPlatform: targetPlatform,
                    ),
                    darkTheme: _removeUnwantedBehavior(
                      materialDarkTheme ??
                          materialLightTheme ??
                          Theme.of(context),
                      targetPlatform: targetPlatform,
                    ),
                    themeMode: switch (themeMode) {
                      ImpaktfullUiThemeMode.system => ThemeMode.system,
                      ImpaktfullUiThemeMode.light => ThemeMode.light,
                      ImpaktfullUiThemeMode.dark => ThemeMode.dark,
                    },
                    supportedLocales: supportedLocales,
                    localizationsDelegates: localizationsDelegates,
                    navigatorKey: navigatorKey,
                    initialRoute: initialRoute,
                    onGenerateRoute: onGenerateRoute,
                    onGenerateInitialRoutes: onGenerateRoute == null &&
                            onGenerateInitialRoutes == null
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
      ),
    );
  }
}

/// The default [ImpaktfullUiTheme] of an [ImpaktfullUiApp] without a theme.
///
/// Created once: `ImpaktfullUiTheme.getDefault()` builds a new theme with 86
/// new component themes, and handing down a new theme instance on every build
/// marks every widget that reads the theme as dirty. A theme is immutable, so
/// every app without a theme can share this one.
ImpaktfullUiTheme? _cachedDefaultTheme;

ImpaktfullUiTheme get _defaultTheme =>
    _cachedDefaultTheme ??= ImpaktfullUiTheme.getDefault();

ThemeData _removeUnwantedBehavior(
  ThemeData theme, {
  required TargetPlatform? targetPlatform,
}) =>
    theme.copyWith(
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

@Deprecated(
    'This extension will no longer be exported in 1.0.0. Copy it into your app if you use it.')
extension ThemeDataExtension on ThemeData {
  @Deprecated(
      'This extension will no longer be exported in 1.0.0. Copy it into your app if you use it.')
  ThemeData removeUnwantedBehavior({
    required TargetPlatform? targetPlatform,
  }) =>
      _removeUnwantedBehavior(this, targetPlatform: targetPlatform);
}
