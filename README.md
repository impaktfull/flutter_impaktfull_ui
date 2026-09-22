# impaktfull_ui

A UI library of impaktfull.

[![pub package](https://img.shields.io/pub/v/impaktfull_ui.svg)](https://pub.dartlang.org/packages/impaktfull_ui)
[![test](https://github.com/impaktfull/flutter_impaktfull_ui/actions/workflows/test.yaml/badge.svg)](https://github.com/impaktfull/flutter_impaktfull_ui/actions/workflows/test.yaml/badge.svg)
[![publish to github pages](https://github.com/impaktfull/flutter_impaktfull_ui/actions/workflows/publish_to_githubpages.yaml/badge.svg)](https://github.com/impaktfull/flutter_impaktfull_ui/actions/workflows/publish_to_githubpages.yaml/badge.svg)
[![live_demo](https://img.shields.io/badge/Live%20Demo-Available-7D64F2)](https://example.impaktfull-ui.opensource.impaktfull.com)

## Disclaimer

**impaktfull_ui is still in unstable & untested. everything under <1.0.0 should not be used unless you want to test it**

## Purpose

This UI library was built to have a simple way to build UIs for impaktfull. This will limit the maintenance cost of open-source projects and make it easier to build applications. That way we can focus on building new tools & features instead of bugfixing and maintaining UI changes from Flutter.

- Open-source example projects
- impaktfull applications

# Demo

[Live Web Demo](https://example.impaktfull-ui.opensource.impaktfull.com)

## Platform support

| Android | iOS | macOS | Windows | Linux | Web (JS) | Web (Wasm) |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |

Every component works on every platform. CI proves it on each pull request: the tests run on the Dart VM and in Chrome (`tool/test_web.sh`, compiled to JS and to Wasm), the example app is built for every platform (Android, iOS, macOS, Windows, Linux and the web, JS and Wasm), and [pana](https://pub.dev/packages/pana) must report every platform and Wasm as supported.

Local files work on every platform when you pass bytes or an `XFile` (from [`cross_file`](https://pub.dev/packages/cross_file), which `image_picker` and `file_selector` return):

```dart
ImpaktfullUiGalleryItem.bytes(bytes: pngBytes);
ImpaktfullUiGalleryItem.xFile(xFile: pickedFile);
await imageCropController.cropImageBytes(cropInfo: cropInfo, bytes: pngBytes);
await imageCropController.cropXFile(cropInfo: cropInfo, xFile: pickedFile);
```

The `dart:io` `File` APIs (`ImpaktfullUiGalleryItem.file`, `ImpaktfullUiImageCropController.cropImageFile`) are deprecated: they keep working on Android, iOS, macOS, Windows and Linux, but can not read a file on the web.

## Upgrading

Public APIs are never renamed or removed in one step. A renamed API keeps its old name as a deprecated alias until 1.0.0, and `dart fix` migrates your code:

```bash
dart fix --apply
```

Every deprecation and its replacement is listed in the [1.0.0 migration guide](doc/migrations/1.0.0.md), and under **Deprecations** in the [CHANGELOG](CHANGELOG.md).

## Usage

<!--[![pub package](https://img.shields.io/pub/v/impaktfull_ui.svg)](https://pub.dartlang.org/packages/impaktfull_ui)-->

### Setup

- Setup your theme (colors, textStyles, shadows, dimens, assets)
- Use ImpaktfullUiApp
- Use the components provided in the UI library

### Component List

Components are always prefixed with `ImpaktfullUi` to avoid conflicts with other libraries.

- ImpaktfullUiAccordion
- ImpaktfullUiAdaptiveNavBar
  - ImpaktfullUiAdaptiveNavBarActionItem
- ImpaktfullUiAdaptivePageRoute
- ImpaktfullUiAdaptiveSafeArea
- ImpaktfullUiAdaptiveScreen
- ImpaktfullUiApp
- ImpaktfullUiAssetWidget
  - ImpaktfullUiAsset.icon
  - ImpaktfullUiAsset.lottie
  - ImpaktfullUiAsset.pixel
  - ImpaktfullUiAsset.rive
  - ImpaktfullUiAsset.svg
- ImpaktfullUiAutoComplete
- ImpaktfullUiAutoLayout
- ImpaktfullUiAvatar
- ImpaktfullUiBadge
  - ImpaktfullUiCustomBadgeWidget
- ImpaktfullUiBottomActions
- ImpaktfullUiBottomNavigation
  - ImpaktfullUiBottomNavigationItem
- ImpaktfullUiBottomSheet
- ImpaktfullUiButton
- ImpaktfullUiCalendar
  - ImpaktfullUiCalendarList
  - ImpaktfullUiCalendarWeek
- ImpaktfullUiCard
- ImpaktfullUiCarousel
- ImpaktfullUiChat
- ImpaktfullUiCheckbox
- ImpaktfullUiCheckboxListItem
- ImpaktfullUiClampedFractionallySizedBox
- ImpaktfullUiCmsHeader
- ImpaktfullUiColorInputField
- ImpaktfullUiColorPicker
- ImpaktfullUiCommandMenu
  - ImpaktfullUiCommandMenuWindow
- ImpaktfullUiConfetti
- ImpaktfullUiContainer
- ImpaktfullUiDateInputField
- ImpaktfullUiDatePicker
  - ImpaktfullUiDatePicker.range
- ImpaktfullUiDateTimePicker
- ImpaktfullUiDesktopPageRoute
- ImpaktfullUiDivider
- ImpaktfullUiDropdown
- ImpaktfullUiFilePicker
- ImpaktfullUiFloatingActionButton
- ImpaktfullUiFluidPadding
- ImpaktfullUiFocusFeedback
- ImpaktfullUiGallery
  - ImpaktfullUiGalleryFullScreen
  - ImpaktfullUiGalleryHeroItem
- ImpaktfullUiGridView
- ImpaktfullUiHorizontalTab
  - ImpaktfullUiHorizontalTabs
- ImpaktfullUiHoverFeedback
- ImpaktfullUiIconButton
- ImpaktfullUiImageCrop
- ImpaktfullUiInputField
  - ImpaktfullUiInputFieldAction
- ImpaktfullUiIntroduction
- ImpaktfullUiLineChart
- ImpaktfullUiListItem
  - ImpaktfullUiSimpleListItem
- ImpaktfullUiListView
- ImpaktfullUiLoadingErrorData
- ImpaktfullUiLoadingIndicator
- ImpaktfullUiMarkdown
- ImpaktfullUiMasterDetail
  - ImpaktfullUiMasterDetailItemScreen
- ImpaktfullUiMetric
- ImpaktfullUiModal
- ImpaktfullUiMorseCodeTouchFeedback
- ImpaktfullUiNavBar
- ImpaktfullUiNetworkImage
- ImpaktfullUiNotification
- ImpaktfullUiNotificationBadge
- ImpaktfullUiNumberInput
- ImpaktfullUiOptionSelector
- ImpaktfullUiPagination
- ImpaktfullUiPasswordStrengthIndicator
- ImpaktfullUiPinCode
- ImpaktfullUiPlaceholder
- ImpaktfullUiProgressIndicator
  - ImpaktfullUiCircleProgressIndicator
  - ImpaktfullUiHalfCircleProgressIndicator
  - ImpaktfullUiLineProgressIndicator
- ImpaktfullUiRadioButton
- ImpaktfullUiRadioButtonListItem
- ImpaktfullUiRefreshIndicator
- ImpaktfullUiResponsiveLayout
- ImpaktfullUiResponsiveRow
- ImpaktfullUiScreen
- ImpaktfullUiSectionTitle
- ImpaktfullUiSegmentedControl
- ImpaktfullUiSelectableListItem
- ImpaktfullUiSeparatedColumn
- ImpaktfullUiSidebarNavigation
  - ImpaktfullUiSidebarNavigationItem
- ImpaktfullUiSkeleton
- ImpaktfullUiSlider
- ImpaktfullUiSnackyConfigurator
- ImpaktfullUiStatusBar
- ImpaktfullUiStepper
- ImpaktfullUiSwitch
- ImpaktfullUiSwitchListItem
- ImpaktfullUiTabBar
  - ImpaktfullUiTabBarItem
- ImpaktfullUiTable
  - ImpaktfullUiTableHeader
    - ImpaktfullUiTableHeaderItem
  - ImpaktfullUiTableRow
    - ImpaktfullUiTableRowItem
- ImpaktfullUiTheme
  - ImpaktfullUiComponentThemeBuilder
  - ImpaktfullUiThemeBuilder
- ImpaktfullUiTimePicker
- ImpaktfullUiTooltip
- ImpaktfullUiTouchFeedback
- ImpaktfullUiTouchFeedbackSequence
- ImpaktfullUiUnifiedScreenLayout
- ImpaktfullUiVirtualKeyboard
- ImpaktfullUiWrap
- ImpaktfullUiWysiwyg

#### Future

Much more components to come in the future, always with the focus on minimizing maintenance and maximizing a recognizable UI/brand for impaktfull (Checkout the TODO list below)

#### Overriding Components

These 2 components are used to override the components in the UI library.

- `ImpaktfullUiOverridableComponentBuilder` (Used in the original component that needs to be overriden)
- `ImpaktfullUiOverridableComponentConfigurator` (Used to configure the override components)

You can place an `ImpaktfullUiOverridableComponentBuilder` anywhere in your widget tree to override the components.

Example:

```dart
ImpaktfullUiOverridableComponentConfigurator(
  overrideComponents: [
    ImpaktfullUiOverridableComponent<ImpaktfullUiRadioButton<bool?>, ImpaktfullUiRadioButtonTheme>(
      builder: (context, component, theme) => OverrideComponent(component: component),
    ),
  ],
  child: ImpaktfullUiRadioButton(
    value: true,
    groupValue: inputs.value.value,
    onChanged: inputs.value.updateState,
  ),
),
```

The default configuration will be providing your `overrideComponents` to the `ImpaktfullUiApp`. 
The `ImpaktfullUiApp` will configure the `ImpaktfullUiOverridableComponentConfigurator` with your `overrideComponents`.

### Building Blocks

- ImpaktfullUiBBForgetPassword
- ImpaktfullUiBBLicenses
- ImpaktfullUiBBLogin
- ImpaktfullUiBBNotFound
- ImpaktfullUiBBRegister
- ImpaktfullUiBBVerifyRegisterCode

#### Future

Much more building blocks to come in the future.

### Examples

- Dashboard

#### Future

Much more examples to come in the future.

### Theming

The provided theme contains the default impaktfull branding. But it is super important for us that the theme is easy to configure and highly configurable. That is why we choose for component based theming.

Start from your brand with `ImpaktfullUiDefaultTheme.withMinimalChanges` and pass it to `ImpaktfullUiApp`:

```dart
final theme = ImpaktfullUiDefaultTheme.withMinimalChanges(
  primary: const Color(0xFF007AFF),
  accent: const Color(0xFF5856D6),
  secondary: const Color(0xFFFF9500),
  borderRadius: BorderRadius.circular(8),
);

ImpaktfullUiApp(
  title: 'My App',
  impaktfullUiTheme: theme,
  home: const MyHomeScreen(),
);
```

#### Changing a single token

Every theme class (the theme, the components theme, every component theme and its `colors`, `dimens`, `textStyles`, ...) has a `copyWith`. Pass only what changes:

```dart
final customTheme = theme.copyWith(
  components: theme.components.copyWith(
    card: theme.components.card.copyWith(
      dimens: theme.components.card.dimens.copyWith(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
  ),
);
```

The same works for a single widget with its `theme` parameter:

```dart
final cardTheme = ImpaktfullUiCardTheme.of(context);
ImpaktfullUiCard(
  theme: cardTheme.copyWith(
    colors: cardTheme.colors.copyWith(background: Colors.yellow),
  ),
  child: ...,
);
```

> **Note:** `theme.copyWith(colors: ...)` only replaces the colors on the root theme. The component themes were built from the old colors and keep them. To change a base color, border radius or font everywhere, build the theme again with `ImpaktfullUiDefaultTheme.withMinimalChanges(...)` and use `copyWith` for the component tokens on top of that.

### Right-to-left

Every component supports right-to-left layouts (e.g. Arabic or Hebrew). They follow the `Directionality` of the widget tree, which `ImpaktfullUiApp` sets from its `locale`:

- Paddings, alignments and positions use start and end instead of left and right, so they mirror in a right-to-left layout.
- Directional icons (back, previous/next arrows and chevrons) point in the reading direction. Mark your own directional assets with `ImpaktfullUiAsset.icon(icon, matchTextDirection: true)` (or `asset.copyWith(matchTextDirection: true)`) to mirror them in a right-to-left layout.
- Location enums with left and right in their name (`ImpaktfullUiNotificationBadgeLocation`, `ImpaktfullUiDropdownAlignment`) follow the reading direction: in a right-to-left layout `topRight` is the top left corner.

### Accessibility

The components work with screen readers (TalkBack, VoiceOver, NVDA, ...), keyboards and the "reduce motion" setting of the platform.

#### Screen readers

- Checkboxes, radio buttons and switches announce their state (`checked`, `mixed`, `toggled`, in a mutually exclusive group), whether they are enabled, and can be activated. In `ImpaktfullUiCheckboxListItem`, `ImpaktfullUiRadioButtonListItem`, `ImpaktfullUiSwitchListItem` and `ImpaktfullUiSelectableListItem` the whole row is one element with the title as label.
- Buttons, navigation items (bottom navigation, tab bar, horizontal tabs, sidebar), segmented control segments and tappable badges and avatars are buttons with a `selected` state where it applies. Tabs have the tab role. Accordions, sidebar groups and the dropdown button announce whether they are expanded.
- A stepper announces every step (`Step 2 of 4`) and which step is completed or current, pagination announces the page when it changes, a carousel the current slide, a progress indicator its value as a percentage, a slider its value with increase and decrease actions, a notification badge the amount (`3 notifications`).
- Loading indicators announce `Loading`, skeletons and illustrations of placeholders are hidden. The error of `ImpaktfullUiLoadingErrorData` is announced when it appears.
- Modals, bottom sheets and the command menu hide the screen behind them. The command menu and the dropdown can be dismissed by screen readers.
- Icon-only buttons of the library have a tooltip, which screen readers announce.

Add a label where only you know what something means:

```dart
ImpaktfullUiCheckbox(value: accepted, onChanged: _onChanged, semanticLabel: 'Accept the terms');
ImpaktfullUiSlider(value: volume, min: 0, max: 10, onChanged: _onChanged, semanticLabel: 'Volume');
ImpaktfullUiAvatar(url: user.avatarUrl, semanticLabel: user.name); // decorative without a label
ImpaktfullUiNetworkImage(url: url, semanticLabel: 'A red bicycle'); // or excludeFromSemantics: true
ImpaktfullUiAssetWidget(asset: asset, semanticLabel: 'Warning'); // or excludeFromSemantics: true
ImpaktfullUiLineChart(data: data, semanticLabel: 'Revenue rose from 10k to 25k this year');
ImpaktfullUiProgressIndicator(value: 0.4, semanticLabel: 'Upload');
ImpaktfullUiIconButton(asset: asset, onTap: _onTap, tooltip: 'Add'); // always pass a tooltip
```

The texts that are only announced (`Loading`, `3 notifications`, `Step 2 of 4`, ...) come from `ImpaktfullUiAccessibilityLocalizations` (`ImpaktfullUiLocalizations(accessibility: ...)`), see [Localization](#localization).

#### Keyboard

Every interactive component can be focused with tab, shows a focus ring while navigating with a keyboard and is activated with enter or space. The slider changes with the arrow keys (left and right follow the reading direction) and goes to its minimum and maximum with home and end. The dropdown moves the focus into its items when it opens (arrow keys or tab to move, escape to close). The command menu keeps the focus in its window: tab and the arrow keys move between the input and the results, enter selects a result, escape closes it.

#### Reduce motion

When the user turns on "Remove animations" (Android), "Reduce motion" (iOS, macOS) or turns off "Show animations" (Windows), `MediaQuery.disableAnimations` is true and the components do not animate: skeletons do not shimmer, confetti is not shown, carousels do not autoplay, and accordions, the sidebar, dropdowns, modals, bottom sheets, switches, the segmented control and progress indicators change without a transition. Use the same helper in your own widgets:

```dart
AnimatedContainer(
  duration: ImpaktfullUiAnimationUtil.duration(context, const Duration(milliseconds: 200)),
  ...
);
if (!ImpaktfullUiAnimationUtil.reduceMotion(context)) _controller.repeat();
```

#### Tap targets

The Android guideline asks for tap targets of at least 48x48, iOS for 44x44. List items, bottom navigation items and large buttons meet both. The standalone checkbox (24x24), radio button (20x20) and switch keep their size by default, to not change the layout of existing apps. Opt in to a bigger tap area with the theme: the control looks the same, but takes (and reacts to taps in) at least this much space.

```dart
final theme = ImpaktfullUiTheme.getDefault();
final components = theme.components;
theme.copyWith(
  components: components.copyWith(
    checkbox: components.checkbox.copyWith(
      dimens: components.checkbox.dimens.copyWith(minTapTargetSize: const Size.square(48)),
    ),
    radioButton: components.radioButton.copyWith(
      dimens: components.radioButton.dimens.copyWith(minTapTargetSize: const Size.square(48)),
    ),
    switchTheme: components.switchTheme.copyWith(
      dimens: components.switchTheme.dimens.copyWith(minTapTargetSize: const Size.square(48)),
    ),
  ),
);
```

Inside the list items the control keeps its size: the row is the tap target. Medium buttons are 44 high (the iOS guideline), use `ImpaktfullUiButtonSize.large` for 48.

### Localization

Every text of the components and building blocks (buttons, tooltips, empty states, semantics labels) comes from a localizations class with English defaults, e.g. `ImpaktfullUiDatePickerLocalizations` or `ImpaktfullUiBBLoginLocalizations`. `ImpaktfullUiLocalizations` groups all of them.

#### Translate the whole app

Pass your translations to `ImpaktfullUiApp`. Only pass what you translate, the rest stays English:

```dart
ImpaktfullUiApp(
  title: 'My App',
  locale: const Locale('nl'),
  supportedLocales: const [Locale('en'), Locale('nl')],
  localizationsDelegates: GlobalMaterialLocalizations.delegates,
  localizations: ImpaktfullUiLocalizations(
    datePicker: const ImpaktfullUiDatePickerLocalizations(
      cancelBtn: 'Annuleren',
      applyBtn: 'Toepassen',
      selectYearTitle: 'Kies een jaar',
    ),
    pagination: ImpaktfullUiPaginationLocalizations(
      pageLabel: (page, amountOfPages) => 'Pagina $page van $amountOfPages',
    ),
    bbLogin: const ImpaktfullUiBBLoginLocalizations(
      title: 'Welkom terug!',
      loginBtn: 'Inloggen',
    ),
  ),
  home: const MyHomeScreen(),
);
```

Texts with a value (`Page 1 of 10`, `(2/3 days)`, `John is typing`) are functions, so every language can place the value (and handle plurals) where it needs to. To support more than one language, build `ImpaktfullUiLocalizations` for the current locale (e.g. from your own `AppLocalizations`) and pass it again when the locale changes. Use `copyWith` to change a single text:

```dart
const ImpaktfullUiLocalizations().copyWith(
  navBar: const ImpaktfullUiNavBarLocalizations().copyWith(backTooltip: 'Terug'),
);
```

#### Translate a single widget

Every component with texts has a `localizations` parameter that wins over the ones of the app:

```dart
ImpaktfullUiPagination(
  page: 0,
  itemsPerPage: 20,
  amountOfItems: 200,
  onLoadPage: _onLoadPage,
  localizations: ImpaktfullUiPaginationLocalizations(
    pageLabel: (page, amountOfPages) => '$page / $amountOfPages',
  ),
);
```

`ImpaktfullUiDatePicker.showModal`, `ImpaktfullUiDateTimePicker.showModal` and `ImpaktfullUiOptionSelector.show` take a `localizations` parameter too.

#### Dates, times and numbers

Dates, times, weekday and month names and percentages are formatted with [intl](https://pub.dev/packages/intl) in the locale of the app (`Localizations.localeOf(context)`):

- The locale needs `intl` date data. Register `GlobalMaterialLocalizations.delegates` (from `flutter_localizations`), which loads it for every supported locale, or call `initializeDateFormatting()` from `package:intl/date_symbol_data_local.dart`. Without data for the locale the components fall back to the default `intl` locale.
- The first day of the week of `ImpaktfullUiDatePicker` and `ImpaktfullUiCalendar` comes from `MaterialLocalizations.firstDayOfWeekIndex` (Sunday for `en` and `en_US`, Monday for `nl`, `fr` and `en_GB`). Apps without localized material localizations keep Monday. Pass `firstDayOfWeek: DateTime.monday` to choose it yourself.
- Short dates use `DateFormat.yMd` (`7/6/2023` for `en_US`, `6-7-2023` for `nl`). The plain `en` locale, the default of `ImpaktfullUiApp`, keeps `dd/MM/yyyy`. `ImpaktfullUiDateInputField(dateFormat: 'd MMMM y')` still takes a pattern.
- Times use 24 hours when `MediaQuery.alwaysUse24HourFormat` is set or the locale uses 24 hours (the plain `en` locale keeps 24 hours). `ImpaktfullUiTimePicker`, `ImpaktfullUiDateTimePicker` and `ImpaktfullUiCalendar` take `use24HourFormat` to choose it yourself; with 12 hours the time picker shows an AM/PM toggle.

### Assets

#### Images

These images are not included in the package: add your own files to the assets folder of your project (and pass your own `package` when needed). The [example app](example/assets/images) contains sample files.

- assets/images/logo.svg
- assets/images/splash_logo.svg

#### Lottie Animations

These lottie animations can be overriden by adding your own files to your assets folder. The only thing you need to do extra is override `package` (in your own project)

- assets/lottie/loading.json

#### Icons

These icons can be overriden in the theme itself. By adding your own IconData.

- add
- arrowLeft
- arrowRight
- arrowUp
- arrowDown
- check
- checkCircle
- chevronDown
- chevronLeft
- chevronRight
- chevronUp
- circle
- close
- confetti
- copy
- delete
- dot
- edit
- error
- home
- info
- lineVertical
- list
- logout
- minus
- moreHorizontal
- moreVertical
- passwordHide
- passwordShow
- refresh
- search
- settings
- success
- user
- warning
- wysiwygBold
- wysiwygCode
- wysiwygCodeBlock
- wysiwygHeader
- wysiwygItalic
- wysiwygLink
- wysiwygOrderedList
- wysiwygPhoto
- wysiwygUnorderedList
- wysiwygUnorderedListItem

# Todo

⌛️ Add tests

- Add screenshot tests for all components

⌛️ Add extra components

- ImpaktfullUiBreadcrumbs
- ImpaktfullUiQrCode
- ImpaktfullUiBarCode
- ImpaktfullUiBarChart
- ImpaktfullUiPieChart
- ImpaktfullUiStoryView
- ImpaktfullUiStoryViewItem
- ImpaktfullUiVideoPlayerControls
- ImpaktfullUiFileCropper
- ImpaktfullUiSocialLoginsButton
- ImpaktfullUiImageComparisonView
- ImpaktfullUiWebView
- ImpaktfullUiQrCodeScanner
- ImpaktfullUiBarcodeScanner
- ImpaktfullUiHtml
- ImpaktfullUiWysiwyg (HTML)
- ImpaktfullUiRating

⌛️ Add CustomRoutes

- ImpaktfullUiIosModalRoute

⌛️ Add addaptive components

- ImpaktfullUiAdaptiveNavigation
- ImpaktfullUiAdaptiveRoute
- ImpaktfullUiAdaptiveModalRoute

⌛️ Add building blocks

- ImpaktfullUiBBMoreScreen
- ImpaktfullUiBBDebugScreen
- ImpaktfullUiBBPrivacyPolicyScreen
- ImpaktfullUiBBTermsAndConditionsScreen

⌛️ Add examples

- Signup
- Forget Password
- Reset password
- 404
- Verify code

# License

You are free to use this library as long as you give credit to impaktfull. You can use it for commercial and non-commercial projects. See the [LICENSE](LICENSE) file for more information.

## Images

All images are from [Pexels](https://www.pexels.com/)

### Avatars

- Photo by Seats Photographix: https://www.pexels.com/photo/playful-28280965/
- Photo by GlassesShop GS: https://www.pexels.com/photo/blonde-beauty-s-eye-catching-glasses-27603433/
- Photo by mücahit koçhan: https://www.pexels.com/photo/a-man-in-sunglasses-and-a-hat-sitting-in-the-back-of-a-red-truck-27670175/
- Photo by Samad Ismayilov: https://www.pexels.com/photo/man-cross-legs-seating-on-white-wooden-chair-1270076/

### Gallery

- Photo by stein egil liland: https://www.pexels.com/photo/time-lapse-photo-of-northern-lights-1933316/
- Photo by Line Knipst: https://www.pexels.com/photo/enchanting-fly-agaric-mushrooms-in-autumn-forest-28987435/
- Photo by Asad Photo Maldives: https://www.pexels.com/photo/brown-dock-near-coconut-trees-1591372/
- Photo by Krivec Ales: https://www.pexels.com/photo/bird-s-eye-view-photography-of-mountains-552785/
- Photo by Alex Qian: https://www.pexels.com/photo/bird-s-eye-view-photography-of-high-rise-buildings-2304917/
