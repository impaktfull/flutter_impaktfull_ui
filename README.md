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

## Usage

<!--[![pub package](https://img.shields.io/pub/v/impaktfull_ui.svg)](https://pub.dartlang.org/packages/impaktfull_ui)-->

### Setup

- Setup your theme (colors, textStyles, shadows, dimens, assets)
- Use ImapktfullUiApp
- Use the components provided in the UI library

### Component List

Components are always prefixed with `ImpaktfullUi` to avoid conflicts with other libraries.

- ImpaktfullUiAccordion
- ImpaktfullUiAdaptiveNavBar
  - ImpaktfullUiAdaptiveNavBarAction
- ImpaktfullUiAdaptivePageRoute
- ImpaktfullUiAdaptiveSafeArea
- ImpaktfullUiAdaptiveScreen
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
- ImpaktfullUiBottomActions
- ImpaktfullUiBottomNavigation
  - ImpaktfullUiBottomNavigationItem
- ImpaktfullUiBottomSheet
- ImpaktfullUiButton
- ImpaktfullUiCalendar
  - ImpaktfullUiCalendarList
  - ImpaktfullUiCalendarWeek
- ImpaktfullUiCard
- ImpaktfullUiCarrousel
- ImpaktfullUiChat
  - ImpaktfullUiChatListItem
  - ImpaktfullUiChatListItemAvatar
  - ImpaktfullUiChatListItemBackground
- ImpaktfullUiCheckBox
- ImpaktfullUiCheckBoxListItem
- ImpaktfullUiClampedFractionallySizedBox
- ImpaktfullUiCmsHeader
- ImpaktfullUiColorInputField
- ImpaktfullUiColorPicker
- ImpaktfullUiCommandMenu
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
  - ImpaktfullUiGalleryFullScreenItem
  - ImpaktfullUiGalleryHeroItem
- ImpaktfullUiGridView
- ImpaktfullUiHorizontalTab
  - ImpaktfullUiHorizontalTabs
- ImpaktfullUiHoverFeedback
- ImpaktfullUiIconButton
- ImpaktfullUiImageCrop
- ImpaktfullUiInputField
- ImpaktfullUiIntroduction
- ImpaktfullUiKanbanBoard
  - ImpaktfullUiKanbanBoardColumn
  - ImpaktfullUiKanbanBoardCard
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
- ImpaktfullUiBBLicensesScreen
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
