# 0.67.2

## Fix

- `ImpaktfullUiMarkdown` deprecation warning

# 0.67.1

## Fix

- `ImpaktfullUiIconButton` color override

# 0.67.0

## Feature

- Added `borderWidth` to `ImpaktfullUiBadgeTheme`
- Added `borderWidth` to `ImpaktfullUiModalTheme`

# 0.66.1

## Fix

- `ImpaktfullUiCard` now correctly handles the border width

# 0.66.0

## Feature

- Added `borderWidth` to `ImpaktfullUiCardTheme`

# 0.65.0

## Feature

- Added `tooltip` to `ImpaktfullUiButton`

# 0.64.0

## Feature

- Add support for thickness of a divider

# 0.63.1

## Fix

- Border width buttons should stay on 1 in default theme

# 0.63.0

## Feature

- Added support for Raised buttons in the `ImpaktfullUiButton`
- Added extra theme in the example to show the raised buttons

## Fix

- Theming copy bug
- Impaktfull to impaktfull

# 0.62.0

## Feature

- Added `customTheme` to `ImpaktfullUiTheme.getDefault` to allow customizing the theme

# 0.61.2

## Fix

- `ImpaktfullUiLocalizations` fix to get `ImpaktfullUiBBLoginLocalizations`

# 0.61.1

## Fix

- `ImpaktfullUiGridView` fix padding

# 0.61.0

## Feature (Breaking)

- Added `placeholderData` to `ImpaktfullUiGridView` (now `noDataLabel` is deprecated)
- Added `placeholderData` to `ImpaktfullUiListView.separated` (now `noDataLabel` is deprecated)
- Added `isLoading` to `ImpaktfullUiGridView`

# 0.60.0

## Feature (might be breaking)

- Added `textSecondary` & `textTertiary` to `ImpaktfullUiColorTheme`
- Changed `onCanvasSecondary` & `onCardSecondary` to use `textSecondary`
- Changed `onCanvasTertiary` & `onCardTertiary` to use `textTertiary`

# 0.59.0

## Feature

- Export `ImpaktfullUiThemeComponentBuilder`

# 0.58.0

## Feat

- Use `textCapitalization` & `inputFormatters` in `ImpaktfullUiInputField`

# 0.57.1

## Fix

- Use `ImpaktfullUiInputFieldValidatorResult` instead od `InputFieldValidatorResult`

# 0.57.0

## Feature

- Added `validator` to `ImpaktfullUiInputField` to validate the input field
- Added `autocorrect` to `ImpaktfullUiInputField` to enable/disable autocorrect

# 0.56.0

## Feature

- Added support for overriding the components
- Added `ImpaktfullUiOverridableComponentBuilder` to override the components
- Added `ImpaktfullUiOverridableComponentConfigurator` to configure the override components
- Added `overrideComponents` to `ImpaktfullUiApp` to override the components in the `ImpaktfullUiOverridableComponentConfigurator`

## Fix

- Use deploy keys in GitHub Actions

# 0.55.1

## Fix

- Alchemist update

# 0.55.0

## Feature

- Added `ImpaktfullUiCheckBoxListItem` to handle check box list items

## Fix

- ImpaktfullUiCheckBoxListItem now correctly handles the `onChanged` & `onChangedInterpediate`

# 0.54.0

## Feature

- Correct use of sizes in the `ListItem` widgets

# 0.53.0

## Feature

- Added `ImpaktfullUiStatusBar` to control the status bar color & style

# 0.52.0

## Feature

- Added `labelMargin` to ImpaktfullUiInputFieldTheme

# 0.51.0

## Feature

- When tapping outside (on the screen) the keyboard will be closed (this tap gesture is excluded from the semantics tree)

# 0.50.1

## Fix

- ImpaktfullUiPlaceholder `assetBuilder` now correctly handles the asset

# 0.50.0

## Feature

- Added `routeSettings` to ImpaktfullUiBottomSheet & ImpaktfullUiModal

# 0.49.2

## Fix

- Use the `asset` from the `ImpaktfullUiListViewPlaceholderData` in the `ImpaktfullUiListView`

# 0.49.1

## Fix

- ImpaktfullUiListViewPlaceholderData `showRefreshBtn` default is now `true`

# 0.49.0

## Feat (Breaking)

- Renamed `ImpaktfullUiPlaceholderState` to `ImpaktfullUiPlaceholder`
- Renamed `ImpaktfullUiPlaceholderStateTheme` to `ImpaktfullUiPlaceholderTheme`
- Added `ImpaktfullUiListViewPlaceholderData` to handle the placeholder data for the ImpaktfullUiListView
- Removed `noDataLabel` & `refreshBtnLabel` from ImpaktfullUiListView (use `placeholderData` instead)

# 0.48.2

## Fix

- Export all ImpaktfullUiLocalizations

# 0.48.1

## Fix

- Set default ImpaktfullUiLocalizations
- Export `ImpaktfullUiLocalizations`
- Validate on T correctly for ImpaktfullUiLocalizations

# 0.48.0

## Feat (Breaking)

- Move localizations to its own configurator & override it on the app itself or on component level

# 0.47.2

## Fix

- ImpaktfullUiBBLogin incorrect localization

# 0.47.1

## Fix

- ImpaktfullUiBBLogin to use localizations everywhere

# 0.47.0

## Feat

- Added ImpaktfullUiLicenseLocalizations to allow customizing the licenses screen
- Added ImpaktfullUiLoginLocalizations to allow customizing the login screen

# 0.46.4

## Fix

- ImpaktfullUiNumberInput now correctly handles the min & max values

# 0.46.3

## Fix

- ImpaktfullUiNumberInput text controller was now correctly initialized

# 0.46.2

## Fix

- ImpaktfullUiNumberInput is validated with regex validation on allowed int & double values

# 0.46.0 - 0.46.1

## Feat

- Added double support to ImpaktfullUiNumberInput

# 0.45.1

## Fix

- Sidebar navigation padding

# 0.45.0

## Feat

- Added extra color picker to ImpaktfullUiColorInputField

# 0.44.0

## Feat

- Added ImpaktfullUiColorInputField

# 0.43.3

## Fix

- Remove unused code

# 0.43.2

## Fix

- ImpaktfullUiButton disabled state

# 0.43.1

## Fix

- ImpaktfullUiNavBarSmallLoadingWrapper color

# 0.43.0

## Feat

- Added ImpaktfullUiAdaptiveNavBarActionItem `onAsyncTap` to handle async actions

## Fix

- ImpaktfullUiNavBarSmallLoadingWrapper correct color
- ImpaktfullUiNavBarSmallLoadingWrapper now correctly handles the loading state

# 0.42.0

## Feat

- Added ImpaktfullUiApp `onGenerateInitialRoutes` to generate initial routes

# 0.41.4

## Fix

- Deprecated color methods
- Button not clickable when loading
- Bottom navbar child adding padding

# 0.41.3

## Fix

- Fixed the ImpaktfullUiModal.simple actions order

# 0.41.2

## Fix

- Fixed the size of the asset widget

# 0.41.1

## Fix

- Fixed the modal actions orientation

# 0.41.0

## Feat

- Added ImpaktfullUiModal.simple with basic strings & actions

# 0.40.0

## Feat

- Added `triggerMode` to ImpaktfullUiTooltip

# 0.39.0

## Feat

- Added notificationBadge support to ImpaktfullUiIconButton

# 0.38.1 - 0.38.5

## Fix

- Github pages upload

# 0.38.0

## Feat

- Added `leadingBuilder` & `trailingBuilder` to ImpaktfullUiListView

# 0.37.0

## Fix

- ImpaktfullUiListView make `useSafeArea` configurable

# 0.36.0

## Feat

- Added `width` to ImpaktfullUiLineProgressIndicator

# 0.35.0

## Feat

- Added `animate` to ImpaktfullUiProgressIndicator

# 0.34.1

## Fix

- ImpaktfullUiSidebarNavigationItem now correctly handles the selected state

# 0.34.0

## Feat

- Added `trailingWidgetBuilder` to ImpaktfullUiAccordion

# 0.33.0

## Feat

- Added `useSafeArea` to ImpaktfullUiBottomSheet
- Added `padding` to ImpaktfullUiBottomSheet

# 0.32.0

## Feat

- Added `isLoading` to ImpaktfullUiTable

# 0.31.0

## Feat

- Added `isLoading` to ImpaktfullUiTable

# 0.30.1

## Fix

- ImpaktfullUiPagination now correctly handles the amount of pages

# 0.30.0

## Feat

- Added `selectedAsset` to ImpaktfullUiBottomNavigationItem

# 0.29.0

## Feat

- Starting to add `copyWith` methods to the themes: TmpaktfullUiButton & ImpaktfullUiInputField for now

# 0.28.1

## Fix

- ImpaktfullUiInputField now correctly handles the focus (removed duplicate events)

# 0.28.0

## Feat

- Added ImpaktfullUiTouchFeedback `focusNode` to control if the touch feedback can request focus

# 0.27.0

## Feat

- Added ImpaktfullUiIconButton `canRequestFocus` to control if the icon button can request focus
- Added ImpaktfullUiButton `canRequestFocus` to control if the button can request focus

# 0.26.0

## Feat

- Added ImpaktfullUiInputField `trailingInputActions` to add actions to the input field

# 0.25.0

## Feat

- Added ImpaktfullUiTouchFeedback `onDoubleTap` & `onLongTap` to handle double tap & long tap events

# 0.24.0

## Feat

- Added ImpaktfullUiInputField `obscureText` to show a password hide/show icon
- Animated ImpaktfullUiPasswordStrengthIndicator colors
- Added ImpaktfullUiVirtualKeyboard `obscureText` to show a password hide/show icon

## Fix

- ImpaktfullUiVirtualKeyboard now handles the shift keys correctly (tap to activate, deactivated by taping again or using another normal key)

# 0.23.2

## Fix

- ImpaktfullUiPasswordStrengthIndicator use a leading asset if provided

# 0.23.1

## Breaking

- ImpaktfullUiPasswordStrengthIndicator now using PasswordStrengthIndicatorRequirement instead of string

# 0.23.0

## Feat

- Added ImpaktfullUiPasswordStrengthIndicator

# 0.22.0

## Feat

- Added margin to ImpaktfullUiPlaceholderState & ImpaktfullUiPlaceholderStateTheme

# 0.21.8

## Fix

- License update to 2025

# 0.21.7

## Fix

- ImpaktfullUiNavBar padding is now based on leading & trailing actions instead of isFullScreen

# 0.21.6

## Fix

- ImpaktfullUiScreen should consider the safearea padding when adding the fab

# 0.21.5

## Fix

- ImpaktfullUiBottomNavigation make removing the top padding configurable

# 0.21.4

## Fix

- ImpaktfullUiBottomNavigation make removing the top padding configurable

# 0.21.3

## Fix

- Cleanup of the ImpaktfullUiBottomNavigation by removing the top padding config

# 0.21.2

## Fix

- Fix the removal of the padding on the ImpaktfullUiScreen when using a bottom child

# 0.21.1

## Fix

- Fixed the cursor color of the ImpaktfullUiInputField

# 0.21.0

## Feat

- Added ImpaktfullUiBottomActions

# 0.20.0

## Feat

- Added ImpaktfullUiTheme `fontFamilyDisplay` & `fontFamilyText` to set the font family for the display & text

# 0.19.1

## Fix

- Fix the ImpaktfullUiScreen to expose `centerTitle` to the ImpaktfullUiNavBar

# 0.19.0

## Feat

- Added ImpaktfullUiNavBar `centerTitle` to center the title when there are actions

# 0.18.1

## Fix

- Fix the safe area padding when using the ImpaktfullUiAdaptiveScreen

# 0.18.0

## Feat

- Added ImpaktfullUiSwitch `verticalPadding` & `horizontalPadding` to control the padding of the switch

# 0.17.1

## Fix

- Make sure the customTheme is not null when calling the getter to simplify the usage of the custom theme

# 0.17.0

## Feat

- Added ImpaktfullUiTheme.customTheme to allow custom themes (through generics so it can be anything you want)

# 0.16.1

## Fix

- ImpaktfullUiBottomNavigation now has a center alignment

# 0.16.0

## Feat

- Added ImpaktfullUiListItem.trailing asset

# 0.15.0

## Feat

- Added ImpaktfullUiPathRouteObserver to log the routes

# 0.14.1

## Fix

- Fixed the package name in the theme use `impaktfull_ui` instead of `impaktfull_ui_2`

# 0.14.0

## Feat

- Added ImpaktfullDateInputField

# 0.13.0

## Feat

- Added ImpaktfullStatusBar

## Version bump

- Version bump figma sync

# 0.12.0

## !!!BREAKING!!!

- We refactored a lot of components to make them more flexible & customizable
- We changed the prefix from impaktfull to ImpaktfukllUi
- Because this is a pre stable release we don't have a migration guide
- If the previous version was working for you just pin it to 0.11.3

# 0.11.3

## Fix

- License
- Version bump snacky

# 0.11.2

## Fix

- Fixed changelog

# 0.11.1

## Fix

- Fixed changelog

# 0.11.0

## Feat

- Added a ThemeConfiguratorWidget so you don't always need to use the ImpaktfullApp

# 0.10.2

## Fix

- export the theme_configurator.dart file

# 0.10.1

## Fix

- version bump dependencies

# 0.10.0

## Feat

- ImpaktfullDialog now has loading states for the actions
- ImpaktfullLoadingIndicator now has a `color` parameter

# 0.9.0

## Breaking

- Support for Flutter 3.22.x
- intl updated to 0.19.0

# 0.8.0

## Breaking

- ImpaktfullCheckBox custom theme

## Feat

- ImpaktfullTheme added components & checkbox theme
- ImpaktfullCheckboxListItem

# 0.7.0

## Feat

- ImpaktfullInputField cursor color
- ImpaktfullSimpleListItem crossAxisAlignment

# 0.6.0

## Feat

- ImpaktfullBottomNavigationItem added `badgeColor` & `badgeBorderRadius`

## Fix

- ImpaktfullBottomNavigationItem use correct collor when item is selected

# 0.5.3

## Fix

- ImpaktfullScreen unfocus when tapped outside

# 0.5.2

## Fix

- ImpaktfullNavBarAction can now use the default color of the svg

# 0.5.1

## Fix

- ImpaktfullBottomSheet with listview instead of vertical autolayout

# 0.5.0

## Breaking

- ImpaktfullListView all builders now have an `index` parameter

## Feat

- Added add icon
- Added menu icon
- Added delete icon
- Added search icon
- Added settings icon
- Added the possibility to use a specific package for the icons
- Added the possibility to use a specific package for the lottie animations
- Icons are baked in impaktfull_ui so no need to override, you will always have the icons
- Lottie animations are baked in impaktfull_ui so no need to override, you will always have the Lottie animations
- Export lottie dependency
- Export lottie dependency
- ImpaktfullBadge borderradius is exposed
- ImpaktfullInputField added textInputAction (default is `TextInputAction.done`)
- ImpaktfullInputField added controller
- ImpaktfullInputField added onSubmit
- ImpaktfullSimpleListItem added textStyle
- ImpaktfullSimpleListItem added subtitleTextStyle
- ImpaktfullSimpleListItem added backgroundColor
- ImpaktfullListView added ignoreThemePadding so you can use your own padding

#3 Updated

- ImpaktfullTopNavBar example to show a list that is searchable
- ImpaktfullTopNavBar cleanup

## Fix

- allowEnterRouteSnapping on an ZoomPageTransitionsBuilder: snapping is now disabled by default on Android
- ImpaktfullButton only show shaddow if `type` not `secondary`

# 0.4.0

## Feat

- Override color of ImpaktfullBadge
- ImpaktfullSimpleListItem expose (backgroundColor, titleStyle, subTitleStyle)

# 0.3.0

## Feat

- Added ImpaktfullBottomSheetItem
- Added ImpaktfullSeparatedColumn clip option to check if items should be clipped with the global border radius (mostly used with bottom sheet items)
- Added ImpaktfullBadge to show a badge with a number or other text
- Added ImpaktfullTopNavBar as a basic component (alpha)
- ImpaktfullBottomNavigationItem supports adding a badge

## Fix

- ImpaktfullSwitch accessibility
- ImpaktfullCheckBox hover state
- ImpaktfullBottomNavigation no supports different kind of "items" not only ImpaktfullBottomNavigationItem
- ImpaktfullInputField cleanup on the spacing of the field itself

## Example

- Bottonm sheet example improvements

# 0.2.1

## Fix

- ListView empty state correctly aligned (center)

# 0.2.0

## Feat

- Added universal_io as a dependency to support web & desktop & exported it by default

# 0.1.0

## Feat

- Added support for setting target platform

# 0.0.34

## Fix

- Separated column uses correct border radius again

# 0.0.33

## Update

- Updated readme with disclaimer everything under <1.0.0 should not be used unless you want to test it

# 0.0.32

## Breaking

- ImpaktfullDialog `isPrimaryDange` => `primaryButtonType = ImpaktfullDialogPrimaryButtonType.danger`

## Feat

- TextStyleExtension added `withOpacity()` method to override the color opacity
- ImpaktfullButton now has an `onAccent` property to flag a secondary button that it is shown on an accent color
- ImpaktfullCheckbox now has the option to override the colors
- ImpaktfullSwitch now has the option to override the colors
- ImpaktfullDialog added `padding` & `margin`
- ImpaktfullListItem added `padding`
- ImpaktfullSimpleListItem added `padding` & `spacing`
- ImpaktfullSwitchListItem added `padding` & `spacing`
- ImpaktfullListView.child added to have a listview with a child instead of children
- ImpaktfullLoadingIndicator added `custom` constructor where we can pass an `asset` (lottie file asset path)
- ImpaktfullNavBar added option to mark a navbar as `isFullScreen`
- ImpaktfullNavBar title nullable to hide the title
- ImpaktfullScreen added option to mark a navbar as `isFullScreen`
- ImpaktfullScreen title nullable to hide the title
- ImpaktfullSeparatedColumn added 2 options: `showFirstSeparator` & `showLastSeparator` to control the visibility of the separators for the first & last item

## Fix

- ImpaktfullNavBarAction use correct color for the icon

# 0.0.31

## Feat

- Added ImpaktfullBottomSheet
- Added ImpaktfullSimpleListItem
- Added ImpaktfullIconButton
- ImpaktfullInputField has a title
- Theme: Added close icon
- Theme: Added danger color
- ImpaktfullScreen: tap outside to unfocus
- ImpaktfullSwitch made onChanged optional to make it a read-only switch
- ImpaktfullSwitchListItem made onChanged optional to make it a read-only switchListItem
- ImpaktfullListItemTitle added option to set textAlign
- ImpaktfullListItemTitle added danger option
- ImpaktfullDialog primary action can be danger action
- ImpaktfullButton added danger option
- ImpaktfullAutoLayout added maiinAxisSize

## Fix

- ImpaktfullAutoLayout removed padding & backgroundColor

# 0.0.30

## Feat

- ImpaktfullInputField has a title

## Docs

- Updated readme

# 0.0.29

## Feat

- `extraPadding` added to ImpaktfullListView

# 0.0.28

## Feat

- Added `margin` & `padding` to the ImpaktfullCard

# 0.0.27

## Fix

- ImpaktfullSwitch & ImpaktfullCheckbox with the turned off state (accent1TurnedOffState)

# 0.0.26

## Feat

- Check if leadingAsset is an icon or an image so a color should be a applied or not (on ImpaktfullListItem & ImpaktfullSelectableListItem)

# 0.0.25

## Feat

- ImpaktfullTheme added `listViewTitleHorizontalPadding` && `listViewTitleVerticalPadding` to better control the padding of the title in the ImpaktfullListView

# 0.0.24

## Feat

- ImpaktfullCard has now an `onTap` parameter

# 0.0.23

## Feat

- ImpaktfullTheme expose the defaultSplashFactory
- RTL & LTR support for ImpaktfullApp (detection by the locale param)

# 0.0.22

## Feat

- ImpaktfullApp now exposes `snackyController` to set a custom snackyController

# 0.0.21

## Feat

- ImpaktfullApp now exposes `snackyBuilder` to set a custom snakcyBuilder

# 0.0.20

## Feat

- Readme added pub.dev badge
- Example better icons & assets
- Added ImpaktfullCard
- Added ImpaktfullDialog
- Added ImpaktfullFab
- Added ImpaktfullPagination
- Added ImpaktfullScreen
- ImpaktfullBottomNavigationItem supports selected icon assets
- ImpaktfullListView refresh action & loading state
- ImpaktfullListView pull to refresh
- ImpaktfullRefreshIndicator
- ImpaktfullApp now supports showing or hiding the debugFlag
- ImpaktfullButton can have a loading state with `onAsyncTap`
- ImpaktfullTouchFeedback now has actual feedback based on the platform
- ImpaktfullTheme now has more shadow options (`card`, `selectedCard`, `bottomNavigation`, `button`)
- ImpaktfullTheme now has border options (`card`, `selectedCard`)

## Fix

- ImpaktfullDatePicker now uses the borderRadius from the theme
- Small disposed errors in ImpaktfullListItem

# 0.0.18 - 0.0.19

## Fix

- Snacky config to use the correct colors

# 0.0.17

## Feat

- Added ImpaktfullRadioButtonListItem

# 0.0.16

## Fix

- Version bump intl

# 0.0.15

## Feat

- Added ImpaktfullDateTimePickerDialog
- Added ImpaktfullDateTimeRangePicker
- Added ImpaktfullDialog

# 0.0.14

## Feat

- Added ImpaktfullRadioButton
- Added ImpaktfullDatePicker
- Added ImpaktfullTimePicker
- Added ImpaktfullCheckbox
- Added ImpaktfullDateTimePicker
- Added borderWidth to ImpaktfullTheme.ImpaktfullDimens

## Fix

- ImpaktfullSwitchListItem removed isSelected

# 0.0.13

## Fix

- Bug in ImpaktfullListItem where trailing widget was not shown correctly

# 0.0.12

## Feat

- ImpaktfullSwitch & ImpaktfullSwitchListItem added

# 0.0.11

## Fix

- Assets not loading in Android

# 0.0.10

## Fix

- SvgIcon pixelated (because of flutter_svg/Impeller bug)

# 0.0.9

## Fix

- Documentation
- obscureText on ImpaktfullInputField

# 0.0.8

## Fix

- ImpaktfullNavBar height & moved to a new component

# 0.0.7

## Feat

- ImpaktfullTabBar & ImpaktfullTabBarItem added

# 0.0.6

## Feat

- ImpaktfullInputField added

# 0.0.5

## Feat

- ImpaktfullBottomNavigationItem & ImpaktfullBottomNavigation added

# 0.0.4

## Fix

- ImpaktfullApp fixed required home widget (now optional)
- ImpaktfullApp fixed has now the option to override the material themeing

# 0.0.3

## Feat

- Added a couple new components:

```
    ImpaktfullListItem
    ImpaktfullListItemTitle
    ImpaktfullSelectableListItem
    ImpaktfullSeparatedColumn
```

- Added a couple new default icons:

```
    assets/icons/check.svg
    assets/icons/chevron_right.svg
```

- Added support for custom durations

## Refactor

- Some onCard is now onCardPrimary and we added onCardSecondary

# 0.0.2

## Feat

- Github actions for CI/CD

# 0.0.1

## Feat

- Initial release
