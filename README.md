# impaktfull_ui

A UI library of Impaktfull.

## Disclaimer 

**impaktfull_ui is still in unstable & untested. everything under <1.0.0 should not be used unless you want to test it**

## Purpose

This UI library was built to have a simple way to build UIs for Impaktfull. This will limit the maintenance cost of open-source projects and make it easier to build applications. That way we can focus on building new tools & features instead of bugfixing and maintaining UI changes from Flutter.

- Open-source example projects
- Impaktfull applications

## Usage

[![pub package](https://img.shields.io/pub/v/impaktfull_ui.svg)](https://pub.dartlang.org/packages/impaktfull_ui)

### Setup

- Setup your theme (colors, textStyles, shadows, dimens, assets)
- Use ImapktfullApp
- Use the components provided in the UI library

### Component List

Components are always prefixed with `Impaktfull` to avoid conflicts with other libraries.

- ImpaktfullAutoLayout
- ImpaktfullBottomNavigation
- ImpaktfullBottomNavigationItem
- ImpaktfullBottomSheet
- ImpaktfullButton
- ImpaktfullCard
- ImpaktfullCheckbox
- ImpaktfullDatePicker
- ImpaktfullDateTimePicker
- ImpaktfullDateTimePickerDialog
- ImpaktfullDateTimeRangePicker
- ImpaktfullDialog
- ImpaktfullInputField
- ImpaktfullLoadingIndicator
- ImpaktfullTouchFeedback
- ImpaktfullListItem
- ImpaktfullListItemTitle
- ImpaktfullListView
- ImpaktfullNavBar
- ImpaktfullPagination
- ImpaktfullRadioButton
- ImpaktfullRadioButtonListItem
- ImpaktfullRefreshIndicator
- ImpaktfullScreen
- ImpaktfullSelectableListItem
- ImpaktfullSimpleListItem
- ImpaktfullSeparator
- ImpaktfullSeparatedColumn
- ImpaktfullSvgIcon
- ImpaktfullSwitch
- ImpaktfullSwitchListItem
- ImpaktfullTabBar
- ImpaktfullTabBarItem
- ImpaktfullTimePicker

Many more to come in the future, always with the focus on minimizing maintenance and maximizing a recognizable UI/brand for Impaktfull

### Assets

#### Lottie Animations

These icons can be overriden be added to your assets folder to use the default lottie animations. The only thing you need to do extra is override `package`  (in your own project)

- assets/lottie/loading.json

#### Default Icons

These icons can be overriden be added to your assets folder to use the default icons. The only thing you need to do extra is override `package` (in your own project)

- assets/icons/add.svg
- assets/icons/arrow_left.svg
- assets/icons/check.svg
- assets/icons/chevron_right.svg
- assets/icons/close.svg
- assets/icons/delete.svg
- assets/icons/edit.svg
- assets/icons/menu.svg
- assets/icons/search.svg
- assets/icons/settings.svg

## License

You are free to use this library as long as you give credit to Impaktfull. You can use it for commercial and non-commercial projects.  See the [LICENSE](LICENSE) file for more information.