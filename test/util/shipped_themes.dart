import 'package:impaktfull_ui/impaktfull_ui.dart';

/// One theme this package ships, in one brightness.
class ShippedTheme {
  /// What is added to the name of a golden file for this theme.
  ///
  /// The default theme in light has none: its goldens keep the name they
  /// always had.
  final String fileSuffix;

  /// What the golden is called in the test output.
  final String description;

  /// The theme, or `null` for the theme an `ImpaktfullUiApp` uses without
  /// one (the default theme of the package).
  final ImpaktfullUiTheme? Function() build;

  const ShippedTheme({
    required this.fileSuffix,
    required this.description,
    required this.build,
  });
}

/// Every theme this package ships, light and dark.
///
/// Every component golden is rendered with each of them
/// (`test/util/golden_test_util.dart`), so a component that only looks right
/// in the default theme is visible in the diff of a pull request.
///
/// `test/src/theme/shipped_themes_source_test.dart` fails when a theme under
/// `lib/src/theme/presets` is not in this list, so a new theme cannot be
/// forgotten.
final shippedThemes = <ShippedTheme>[
  ShippedTheme(
    fileSuffix: '',
    description: 'impaktfull',
    build: () => null,
  ),
  ShippedTheme(
    fileSuffix: '_dark',
    description: 'impaktfull dark',
    build: ImpaktfullUiTheme.getDefaultDark,
  ),
  ShippedTheme(
    fileSuffix: '_shadcn',
    description: 'shadcn/ui',
    build: ImpaktfullUiShadcnTheme.light,
  ),
  ShippedTheme(
    fileSuffix: '_shadcn_dark',
    description: 'shadcn/ui dark',
    build: ImpaktfullUiShadcnTheme.dark,
  ),
  ShippedTheme(
    fileSuffix: '_ant_design',
    description: 'Ant Design',
    build: ImpaktfullUiAntDesignTheme.light,
  ),
  ShippedTheme(
    fileSuffix: '_ant_design_dark',
    description: 'Ant Design dark',
    build: ImpaktfullUiAntDesignTheme.dark,
  ),
];
