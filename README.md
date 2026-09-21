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
