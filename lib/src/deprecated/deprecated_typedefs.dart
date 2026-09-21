// Deprecated names of public classes that were renamed.
//
// Every alias here keeps existing code compiling and points to its
// replacement. `dart fix --apply` migrates them automatically (see
// `lib/fix_data.yaml`). They are all removed in 1.0.0: delete this file and
// its export in `lib/impaktfull_ui.dart`.
//
// See doc/migrations/1.0.0.md.
import 'package:impaktfull_ui/impaktfull_ui.dart';

// Carousel (was misspelled as "Carrousel")

@Deprecated('Use ImpaktfullUiCarousel instead. Will be removed in 1.0.0.')
typedef ImpaktfullUiCarrousel = ImpaktfullUiCarousel;

@Deprecated('Use ImpaktfullUiCarouselTheme instead. Will be removed in 1.0.0.')
typedef ImpaktfullUiCarrouselTheme = ImpaktfullUiCarouselTheme;

@Deprecated(
    'Use ImpaktfullUiCarouselAssetsTheme instead. Will be removed in 1.0.0.')
typedef ImpaktfullUiCarrouselAssetsTheme = ImpaktfullUiCarouselAssetsTheme;

@Deprecated(
    'Use ImpaktfullUiCarouselColorTheme instead. Will be removed in 1.0.0.')
typedef ImpaktfullUiCarrouselColorTheme = ImpaktfullUiCarouselColorTheme;

@Deprecated(
    'Use ImpaktfullUiCarouselDimensTheme instead. Will be removed in 1.0.0.')
typedef ImpaktfullUiCarrouselDimensTheme = ImpaktfullUiCarouselDimensTheme;

@Deprecated(
    'Use ImpaktfullUiCarouselTextStyleTheme instead. Will be removed in 1.0.0.')
typedef ImpaktfullUiCarrouselTextStyleTheme
    = ImpaktfullUiCarouselTextStyleTheme;

// Checkbox (was "CheckBox", while its theme was already "Checkbox")

@Deprecated('Use ImpaktfullUiCheckbox instead. Will be removed in 1.0.0.')
typedef ImpaktfullUiCheckBox = ImpaktfullUiCheckbox;

@Deprecated(
    'Use ImpaktfullUiCheckboxListItem instead. Will be removed in 1.0.0.')
typedef ImpaktfullUiCheckBoxListItem = ImpaktfullUiCheckboxListItem;

@Deprecated(
    'Use ImpaktfullUiCheckboxListItemType instead. Will be removed in 1.0.0.')
typedef ImpaktfullUiCheckBoxListItemType = ImpaktfullUiCheckboxListItemType;

@Deprecated(
    'Use ImpaktfullUiCheckboxListItemTheme instead. Will be removed in 1.0.0.')
typedef ImpaktfullUiCheckBoxListItemTheme = ImpaktfullUiCheckboxListItemTheme;

@Deprecated(
    'Use ImpaktfullUiCheckboxListItemAssetsTheme instead. Will be removed in 1.0.0.')
typedef ImpaktfullUiCheckBoxListItemAssetsTheme
    = ImpaktfullUiCheckboxListItemAssetsTheme;

@Deprecated(
    'Use ImpaktfullUiCheckboxListItemColorTheme instead. Will be removed in 1.0.0.')
typedef ImpaktfullUiCheckBoxListItemColorTheme
    = ImpaktfullUiCheckboxListItemColorTheme;

@Deprecated(
    'Use ImpaktfullUiCheckboxListItemDimensTheme instead. Will be removed in 1.0.0.')
typedef ImpaktfullUiCheckBoxListItemDimensTheme
    = ImpaktfullUiCheckboxListItemDimensTheme;

@Deprecated(
    'Use ImpaktfullUiCheckboxListItemTextStyleTheme instead. Will be removed in 1.0.0.')
typedef ImpaktfullUiCheckBoxListItemTextStyleTheme
    = ImpaktfullUiCheckboxListItemTextStyleTheme;

// Misspelled or wrongly cased names

@Deprecated(
    'Use ImpaktfullUiAdaptivePageRoute instead. Will be removed in 1.0.0.')
typedef ImpaktfullUIAdaptivePageRoute = ImpaktfullUiAdaptivePageRoute;

@Deprecated('Use ImpaktfullUiThemeBuilder instead. Will be removed in 1.0.0.')
typedef ImpaktfullUiThemeBuidler = ImpaktfullUiThemeBuilder;

@Deprecated(
    'Use ImpaktfullUiDropdownAlignment instead. Will be removed in 1.0.0.')
typedef ImpaktfullUiAlignment = ImpaktfullUiDropdownAlignment;

// Public names without the ImpaktfullUi prefix

@Deprecated('Use ImpaktfullUiDefaultTheme instead. Will be removed in 1.0.0.')
typedef DefaultTheme = ImpaktfullUiDefaultTheme;

@Deprecated(
    'Use ImpaktfullUiTableColumnConfig instead. Will be removed in 1.0.0.')
typedef TableColumnConfig = ImpaktfullUiTableColumnConfig;

@Deprecated(
    'Use ImpaktfullUiCustomBadgeWidget instead. Will be removed in 1.0.0.')
typedef CustomBadgeWidget = ImpaktfullUiCustomBadgeWidget;

@Deprecated(
    'Use ImpaktfullUiCommandMenuWindow instead. Will be removed in 1.0.0.')
typedef CommandMenuWindow = ImpaktfullUiCommandMenuWindow;

@Deprecated(
    'Use ImpaktfullUiInputFieldValidator instead. Will be removed in 1.0.0.')
typedef InputFieldValidator = ImpaktfullUiInputFieldValidator;

@Deprecated(
    'Use ImpaktfullUiPasswordStrengthIndicatorRequirement instead. Will be removed in 1.0.0.')
typedef PasswordStrengthIndicatorRequirement
    = ImpaktfullUiPasswordStrengthIndicatorRequirement;

@Deprecated(
    'Use ImpaktfullUiCircleProgressPainter instead. Will be removed in 1.0.0.')
typedef CircleProgressPainter = ImpaktfullUiCircleProgressPainter;

@Deprecated(
    'Use ImpaktfullUiHalfCircleProgressPainter instead. Will be removed in 1.0.0.')
typedef HalfCircleProgressPainter = ImpaktfullUiHalfCircleProgressPainter;

@Deprecated(
    'Use ImpaktfullUiVirtualKeyboardConfig instead. Will be removed in 1.0.0.')
typedef VirtualKeyboardConfig = ImpaktfullUiVirtualKeyboardConfig;
