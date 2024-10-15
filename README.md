# impaktfull_ui

A UI library of impaktfull.

[![test](https://github.com/impaktfull/flutter_impaktfull_ui_2/actions/workflows/test.yaml/badge.svg)](https://github.com/impaktfull/flutter_impaktfull_ui_2/actions/workflows/test.yaml/badge.svg)
[![publish to github pages](https://github.com/impaktfull/flutter_impaktfull_ui_2/actions/workflows/publish_to_githubpages.yaml/badge.svg)](https://github.com/impaktfull/flutter_impaktfull_ui_2/actions/workflows/publish_to_githubpages.yaml/badge.svg)
[![live_demo](https://img.shields.io/badge/Live%20Demo-Available-7D64F2)](https://example.impaktfull-ui.opensource.impaktfull.com)

## Disclaimer

**impaktfull_ui is still in unstable & untested. everything under <1.0.0 should not be used unless you want to test it**

## Purpose

This UI library was built to have a simple way to build UIs for impaktfull. This will limit the maintenance cost of open-source projects and make it easier to build applications. That way we can focus on building new tools & features instead of bugfixing and maintaining UI changes from Flutter.

- Open-source example projects
- impaktfull applications

# Demo

[Live Web Demo](https://example.impaktfull-ui.opensource.impaktfull.com)

## Usage

<!--[![pub package](https://img.shields.io/pub/v/impaktfull_ui.svg)](https://pub.dartlang.org/packages/impaktfull_ui)-->

### Setup

- Setup your theme (colors, textStyles, shadows, dimens, assets)
- Use ImapktfullUiApp
- Use the components provided in the UI library

### Component List

Components are always prefixed with `ImpaktfullUi` to avoid conflicts with other libraries.

- ImpaktfullUiAccordion
- ImpaktfullUiApp
- ImpaktfullUiAssetWidget
  - ImpaktfullUiAsset.icon
  - ImpaktfullUiAsset.svg
  - ImpaktfullUiAsset.image
  - ImpaktfullUiAsset.lottie
  - ImpaktfullUiAsset.rive
- ImpaktfullUiAutoComplete
- ImpaktfullUiAutoLayout
- ImpaktfullUiAvatar
- ImpaktfullUiBadge
- ImpaktfullUiBottomNavigation
  - ImpaktfullUiBottomNavigationItem
- ImpaktfullUiBottomSheet
- ImpaktfullUiButton
- ImpaktfullUiCheckBox
- ImpaktfullUiCmsHeader
- ImpaktfullUiColorPicker
- ImpaktfullUiCommandMenu
  - ImpaktfullUiCommandMenu
- ImpaktfullUiDatePicker
  - ImpaktfullUiDatePicker.range
- ImpaktfullUiDivider
- ImpaktfullUiDropdown
- ImpaktfullUiFocusFeedback
- ImpaktfullUiFilePicker
- ImpaktfullUiFloatingActionButton
- ImpaktfullUiFluidPadding
- ImpaktfullUiGridView
- ImpaktfullUiHoverFeedback
- ImpaktfullUiHorizontalTabs
  - ImpaktfullUiHorizontalTab
- ImpaktfullUiIconButton
- ImpaktfullUiInputField
- ImpaktfullUiListItem
  - ImpaktfullUiSimpleListItem
- ImpaktfullUiLoadingErrorData
- ImpaktfullUiLoadingIndicator
- ImpaktfullUiModal
- ImpaktfullUiNavBar
- ImpaktfullUiNetworkImage
- ImpaktfullUiNotification
- ImpaktfullUiNotificationBadge
- ImpaktfullUiPagination
- ImpaktfullUiRadioButton
- ImpaktfullUiRadioButtonListItem
- ImpaktfullUiRefreshIndicator
- ImpaktfullUiScreen
- ImpaktfullUiSectionTitle
- ImpaktfullUiSelectableListItem
- ImpaktfullUiSeparatedColumn
- ImpaktfullUiSideNavigation
  - ImpaktfullUiSideNavigationItem
- ImpaktfullUiSkeleton
- ImpaktfullUiSnackyConfigurator
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
- ImpaktfullUiTooltip
- ImpaktfullUiTouchFeedback
- ImpaktfullUiWrap
- ImpaktfullUiWysiwyg

#### Future

Many more to come in the future, always with the focus on minimizing maintenance and maximizing a recognizable UI/brand for impaktfull (Checkout the TODO list below)

### Theming

The provided theme contains the default impaktfull branding. But it is super important for us that the theme is easy to configure and highly configurable. That is why we choose for component based theming.

### Assets

#### Images

These images animations can be overriden by adding your own files to your assets folder. The only thing you need to do extra is override `package` (in your own project)

- asssets/images/logo.svg
- asssets/images/splash_logo.svg

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
- chevronDown
- chevronLeft
- chevronRight
- chevronUp
- circle
- close
- confetti
- copy
- delete
- edit
- error
- home
- info
- lineVertical
- list
- logout
- minus
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

- [ ] Add tests
- [ ] Add extra components

  - ImpaktfullUiNumberInput
  - ImpaktfullUiTimePicker
  - ImpaktfullUiDateTimePicker
  - ImpaktfullUiDateTimePickerDialog
  - ImpaktfullUiSlider
  - ImpaktfullUiStepper
  - ImpaktfullUiSegmentedControll
  - ImpaktfullUiBreadcrumbs
  - ImpaktfullUiCalendar
  - ImpaktfullUiMetrics
  - ImpaktfullUiLineChart
  - ImpaktfullUiQrCode
  - ImpaktfullUiBarCode
  - ImpaktfullUiBarChart
  - ImpaktfullUiPieChart
  - ImpaktfullUiPasswordStrengthIndicator
  - ImpaktfullUiGallery
  - ImpaktfullUiStoryView
  - ImpaktfullUiStoryViewItem
  - ImpaktfullUiVidoPlayerControls
  - ImpaktfullUiFileCropper
  - ImpaktfullUiSocialLoginsButton
  - ImpaktfullUiImageComparisonView
  - ImpaktfullUiWebView
  - ImpaktfullUiQrCodeScanner
  - ImpaktfullUiBarcodeScanner
  - ImpaktfullUiHtml
  - ImpaktfullUiWysiwyg (HTML)
  - ImpaktfullUiRating

- [ ] Add CustomRoutes

  - ImpaktfullUiIosModalRoute

- [ ] Add addaptive components

  - ImpaktfullUiResponsiveLayout
  - ImpaktfullUiMasterDetail
  - ImpaktfullUiAdaptiveScreen
  - ImpaktfullUiAdaptiveNavBar
  - ImpaktfullUiAdaptiveNavBarAction
  - ImpaktfullUiAdaptiveNavigation
  - ImpaktfullUiAdaptiveModalRoute

- [ ] Add building blocks

  - ImpaktfullUiBBLogin
  - ImpaktfullUiBBRegister
  - ImpaktfullUiBBForgotPassword
  - ImpaktfullUiBBResetPassword
  - ImpaktfullUiBBVerifyEmail
  - ImpaktfullUiBBMoreScreen
  - ImpaktfullUiBBDebugScreen
  - ImpaktfullUiBBPrivacyPolicyScreen
  - ImpaktfullUiBBTermsAndConditionsScreen
  - ImpaktfullUiBBLicensesScreen

- [ ] Add examples

  - Dashboard

# License

You are free to use this library as long as you give credit to impaktfull. You can use it for commercial and non-commercial projects. See the [LICENSE](LICENSE) file for more information.
