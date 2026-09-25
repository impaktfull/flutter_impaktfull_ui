# Changelog

## [0.80.0](https://github.com/impaktfull/flutter_impaktfull_ui/compare/v0.79.0...v0.80.0) (2026-09-25)


### Features

* a focused and a hovered border and a focus ring for ImpaktfullUiInputField (borderFocused, borderHover, focusRing, focusRingWidth) ([28108ae](https://github.com/impaktfull/flutter_impaktfull_ui/commit/28108ae9f0fc684392766ac811d27cc67af2c6fd))
* a hovered tab of the Ant Design theme only changes the colour of its title ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* a radius seed grows the border radius scale in ImpaktfullUiDimensTheme.getDefault ([c67d086](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c67d086bb19ce42c1348725f68db77b9e9ed823a))
* accessibility for every component ([#86](https://github.com/impaktfull/flutter_impaktfull_ui/issues/86)) ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* accordions, sidebar groups and the dropdown button announce whether they are expanded ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* add badge to ImpaktfullUiNavBar ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* add copyWith to every component theme and sub-theme ([a8d879f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/a8d879fc562384bf615ae80a2f63bb24fb97ea2d))
* add copyWith to ImpaktfullUiLocalizations and every localizations class ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add excludeFromSemantics to ImpaktfullUiNetworkImage and ImpaktfullUiAssetWidget ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* add firstDayOfWeek and datePickerLocalizations to ImpaktfullUiDateInputField, dateFormat is now optional ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add floatingActionButtonAlignment (AlignmentGeometry) to ImpaktfullUiScreen and ImpaktfullUiAdaptiveScreen ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* add ImpaktfullUiAccessibilityLocalizations for the announced texts, registered as ImpaktfullUiLocalizations.accessibility ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* add ImpaktfullUiAccordion.onExpansionChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiAdaptivePageRoute, ImpaktfullUiThemeBuilder and ImpaktfullUiDropdownAlignment ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* add ImpaktfullUiAdaptivePageRoute, ImpaktfullUiThemeBuilder and ImpaktfullUiDropdownAlignment ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* add ImpaktfullUiAdaptivePageRoute, ImpaktfullUiThemeBuilder and ImpaktfullUiDropdownAlignment ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* add ImpaktfullUiAdaptivePageRoute, ImpaktfullUiThemeBuilder and ImpaktfullUiDropdownAlignment ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* add ImpaktfullUiAdaptivePageRoute, ImpaktfullUiThemeBuilder and ImpaktfullUiDropdownAlignment ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* add ImpaktfullUiAdaptivePageRoute, ImpaktfullUiThemeBuilder and ImpaktfullUiDropdownAlignment ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* add ImpaktfullUiAdaptivePageRoute, ImpaktfullUiThemeBuilder and ImpaktfullUiDropdownAlignment ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* add ImpaktfullUiAdaptiveScreen.floatingActionButton ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiAnimationUtil to respect the reduce motion setting of the platform ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* add ImpaktfullUiAsset.matchTextDirection and ImpaktfullUiAsset.copyWith to mirror directional assets in right-to-left layouts ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* add ImpaktfullUiBadge.onCloseTapped ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiBadge.title ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiBBForgetPassword.onEmailChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiBBForgetPasswordLocalizations, ImpaktfullUiBBRegisterLocalizations, ImpaktfullUiBBVerifyRegisterCodeLocalizations and ImpaktfullUiBBNotFoundLocalizations with a localizations parameter on their building blocks ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add ImpaktfullUiBBLicensesLocalizations ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add ImpaktfullUiBBLogin.onEmailChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiBBLogin.onPasswordChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiBBRegister.onEmailChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiBBRegister.onPasswordChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiBBVerifyRegisterCode.onCodeChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiBottomNavigationItem.showTitle ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiBottomNavigationItem.title ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiButtonTheme.shadows and ImpaktfullUiComponentsTheme.checkboxListItem ([0822096](https://github.com/impaktfull/flutter_impaktfull_ui/commit/082209631039150b56ca1a274a737de36ac4a5e9))
* add ImpaktfullUiCalendar.onEventTapped ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiCalendarList.onEventTapped ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiCalendarLocalizations and localizations, firstDayOfWeek and use24HourFormat to ImpaktfullUiCalendar, ImpaktfullUiCalendarWeek and ImpaktfullUiCalendarList ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add ImpaktfullUiCalendarWeek.onEventTapped ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiCarousel, ImpaktfullUiCheckbox and ImpaktfullUiCheckboxListItem with their themes ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* add ImpaktfullUiCarousel, ImpaktfullUiCheckbox and ImpaktfullUiCheckboxListItem with their themes ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* add ImpaktfullUiCarousel, ImpaktfullUiCheckbox and ImpaktfullUiCheckboxListItem with their themes ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* add ImpaktfullUiCarousel, ImpaktfullUiCheckbox and ImpaktfullUiCheckboxListItem with their themes ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* add ImpaktfullUiCarousel, ImpaktfullUiCheckbox and ImpaktfullUiCheckboxListItem with their themes ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* add ImpaktfullUiCarousel, ImpaktfullUiCheckbox and ImpaktfullUiCheckboxListItem with their themes ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* add ImpaktfullUiCarousel, ImpaktfullUiCheckbox and ImpaktfullUiCheckboxListItem with their themes ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* add ImpaktfullUiChatLocalizations and a semantics label for the typing indicator of ImpaktfullUiChat ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add ImpaktfullUiCheckbox.indeterminate and ImpaktfullUiCheckboxListItem.indeterminate ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* add ImpaktfullUiCheckbox.indeterminate and ImpaktfullUiCheckboxListItem.indeterminate ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* add ImpaktfullUiCheckbox.indeterminate and ImpaktfullUiCheckboxListItem.indeterminate ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* add ImpaktfullUiCheckbox.indeterminate and ImpaktfullUiCheckboxListItem.indeterminate ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* add ImpaktfullUiCheckbox.indeterminate and ImpaktfullUiCheckboxListItem.indeterminate ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* add ImpaktfullUiCheckbox.indeterminate and ImpaktfullUiCheckboxListItem.indeterminate ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* add ImpaktfullUiCheckbox.indeterminate and ImpaktfullUiCheckboxListItem.indeterminate ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* add ImpaktfullUiCmsHeaderLocalizations and a localizations parameter to ImpaktfullUiCmsHeader ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add ImpaktfullUiColorInputFieldLocalizations and a localizations parameter to ImpaktfullUiColorInputField ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add ImpaktfullUiColorPicker.onChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiColorPicker.onChangeEnd ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiCommandMenuWindow.onChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiDateInputField.onChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiDateInputField.value ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiDatePickerLocalizations and localizations and firstDayOfWeek to ImpaktfullUiDatePicker, showModal and showRangeModal ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add ImpaktfullUiDateTimePickerLocalizations and datePickerLocalizations, firstDayOfWeek and use24HourFormat to ImpaktfullUiDateTimePicker and showModal ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add ImpaktfullUiDropdown.buttonTitle ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiDropdownItem.title ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiFilePickerLocalizations and a localizations parameter to ImpaktfullUiFilePicker ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add ImpaktfullUiFloatingActionButton.title ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiGalleryItem.bytes and ImpaktfullUiGalleryItem.xFile, which show local images on every platform including the web ([003b8e1](https://github.com/impaktfull/flutter_impaktfull_ui/commit/003b8e18f9fa043b4a281d0c4cf001544759aa3f))
* add ImpaktfullUiGalleryLocalizations and a localizations parameter to ImpaktfullUiGallery and ImpaktfullUiGalleryFullScreen ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add ImpaktfullUiHorizontalTab.title ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiHorizontalTabConfig.title ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiHorizontalTabs.onChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiHorizontalTabs.value ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiIconButtonTheme and theme support to ImpaktfullUiIconButton ([4cb7081](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4cb7081138752405d0abe2283f084fee987dc8e4))
* add ImpaktfullUiImageCropController.cropImageBytes and ImpaktfullUiImageCropController.cropXFile, and imageBytes and xFile to ImpaktfullUiImageCropCropper.cropImage ([003b8e1](https://github.com/impaktfull/flutter_impaktfull_ui/commit/003b8e18f9fa043b4a281d0c4cf001544759aa3f))
* add ImpaktfullUiImageCropCropper.decodeImage ([003b8e1](https://github.com/impaktfull/flutter_impaktfull_ui/commit/003b8e18f9fa043b4a281d0c4cf001544759aa3f))
* add ImpaktfullUiInputField.onFocusChange ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiInputField.onSubmitted ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiInputFieldAction.title ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiMarkdown.onLinkTapped ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiMasterDetailLocalizations and a localizations parameter to ImpaktfullUiMasterDetail ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add ImpaktfullUiModal.onPrimaryActionTapped ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiModal.onSecondaryActionTapped ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiModal.primaryActionTitle ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiModal.secondaryActionTitle ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiOptionSelector.value ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiOptionSelectorLocalizations and a localizations parameter to ImpaktfullUiOptionSelector and ImpaktfullUiOptionSelector.show ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add ImpaktfullUiPagination.onPageChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiPaginationLocalizations and a localizations parameter to ImpaktfullUiPagination ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add ImpaktfullUiPinCode.onSubmitted ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiScreen.floatingActionButton ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiScreen.maybeOf ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* add ImpaktfullUiSegmentedControl.titleBuilder ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiTabBarItem.title ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiTouchFeedback.onLongPress ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiTouchFeedbackTheme to configure the pressed, hover, focus and splash colors ([#95](https://github.com/impaktfull/flutter_impaktfull_ui/issues/95)) ([a685db6](https://github.com/impaktfull/flutter_impaktfull_ui/commit/a685db64335aca11fb12cf99c4ddb0c4e3c762fb))
* add ImpaktfullUiVirtualKeyboard.onSubmitted ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiVirtualKeyboardTextEditController.onSubmitted ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiWysiwyg.value ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* add ImpaktfullUiWysiwygLocalizations with a tooltip per ImpaktfullUiWysiwygAction and a localizations parameter to ImpaktfullUiWysiwyg ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add minTapTargetSize to the dimens theme of the checkbox, radio button and switch, an opt-in 48x48 tap area that keeps the look of the control ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* add navBarLocalizations and cmsHeaderLocalizations to ImpaktfullUiAdaptiveNavBar ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* add onColorChangeEnd to ImpaktfullUiColorPicker ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* add previousWeek and nextWeek to ImpaktfullUiCalendarLocalizations, previousPage and nextPage to ImpaktfullUiPaginationLocalizations and deleteFile to ImpaktfullUiFilePickerLocalizations ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* add semanticLabel to ImpaktfullUiCheckbox, ImpaktfullUiRadioButton, ImpaktfullUiSwitch, ImpaktfullUiSlider, ImpaktfullUiAvatar, ImpaktfullUiNetworkImage, ImpaktfullUiAssetWidget, ImpaktfullUiLineChart, ImpaktfullUiProgressIndicator, ImpaktfullUiLoadingIndicator, ImpaktfullUiBadge and ImpaktfullUiNotificationBadge ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* add step and semanticFormatterCallback to ImpaktfullUiSlider ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* add the ImpaktfullUi prefix to ImpaktfullUiDefaultTheme, ImpaktfullUiTableColumnConfig, ImpaktfullUiCustomBadgeWidget, ImpaktfullUiCommandMenuWindow, ImpaktfullUiInputFieldValidator, ImpaktfullUiPasswordStrengthIndicatorRequirement, ImpaktfullUiCircleProgressPainter, ImpaktfullUiHalfCircleProgressPainter and ImpaktfullUiVirtualKeyboardConfig ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* add the ImpaktfullUi prefix to ImpaktfullUiDefaultTheme, ImpaktfullUiTableColumnConfig, ImpaktfullUiCustomBadgeWidget, ImpaktfullUiCommandMenuWindow, ImpaktfullUiInputFieldValidator, ImpaktfullUiPasswordStrengthIndicatorRequirement, ImpaktfullUiCircleProgressPainter, ImpaktfullUiHalfCircleProgressPainter and ImpaktfullUiVirtualKeyboardConfig ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* add the ImpaktfullUi prefix to ImpaktfullUiDefaultTheme, ImpaktfullUiTableColumnConfig, ImpaktfullUiCustomBadgeWidget, ImpaktfullUiCommandMenuWindow, ImpaktfullUiInputFieldValidator, ImpaktfullUiPasswordStrengthIndicatorRequirement, ImpaktfullUiCircleProgressPainter, ImpaktfullUiHalfCircleProgressPainter and ImpaktfullUiVirtualKeyboardConfig ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* add the ImpaktfullUi prefix to ImpaktfullUiDefaultTheme, ImpaktfullUiTableColumnConfig, ImpaktfullUiCustomBadgeWidget, ImpaktfullUiCommandMenuWindow, ImpaktfullUiInputFieldValidator, ImpaktfullUiPasswordStrengthIndicatorRequirement, ImpaktfullUiCircleProgressPainter, ImpaktfullUiHalfCircleProgressPainter and ImpaktfullUiVirtualKeyboardConfig ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* add the ImpaktfullUi prefix to ImpaktfullUiDefaultTheme, ImpaktfullUiTableColumnConfig, ImpaktfullUiCustomBadgeWidget, ImpaktfullUiCommandMenuWindow, ImpaktfullUiInputFieldValidator, ImpaktfullUiPasswordStrengthIndicatorRequirement, ImpaktfullUiCircleProgressPainter, ImpaktfullUiHalfCircleProgressPainter and ImpaktfullUiVirtualKeyboardConfig ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* add the ImpaktfullUi prefix to ImpaktfullUiDefaultTheme, ImpaktfullUiTableColumnConfig, ImpaktfullUiCustomBadgeWidget, ImpaktfullUiCommandMenuWindow, ImpaktfullUiInputFieldValidator, ImpaktfullUiPasswordStrengthIndicatorRequirement, ImpaktfullUiCircleProgressPainter, ImpaktfullUiHalfCircleProgressPainter and ImpaktfullUiVirtualKeyboardConfig ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* add the ImpaktfullUi prefix to ImpaktfullUiDefaultTheme, ImpaktfullUiTableColumnConfig, ImpaktfullUiCustomBadgeWidget, ImpaktfullUiCommandMenuWindow, ImpaktfullUiInputFieldValidator, ImpaktfullUiPasswordStrengthIndicatorRequirement, ImpaktfullUiCircleProgressPainter, ImpaktfullUiHalfCircleProgressPainter and ImpaktfullUiVirtualKeyboardConfig ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* add tooltips to the icon buttons of the modal, bottom sheet, metric, password fields, calendar week, file picker and image crop, and to the pagination buttons ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* add use24HourFormat and a 12-hour mode with an AM/PM toggle to ImpaktfullUiTimePicker ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* base theme tokens reach every component theme ([#99](https://github.com/impaktfull/flutter_impaktfull_ui/issues/99)) ([c67d086](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c67d086bb19ce42c1348725f68db77b9e9ed823a))
* buttons, icon buttons, navigation items, tabs, sidebar items and segmented control segments are buttons with a selected state; tabs have the tab role ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* checkboxes, radio buttons, switches and their list items announce their state (checked, mixed, toggled, radio group), enabled and a label; the list item row is one element with the title as label ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* close API gaps in notification, auto complete, table, icon button and introduction ([#85](https://github.com/impaktfull/flutter_impaktfull_ui/issues/85)) ([4cb7081](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4cb7081138752405d0abe2283f084fee987dc8e4))
* colors, textStyles, dimens, durations, shadows and assets parameters on withMinimalChanges and ImpaktfullUiTheme.custom ([c67d086](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c67d086bb19ce42c1348725f68db77b9e9ed823a))
* consistent parameter names in line with Flutter ([#88](https://github.com/impaktfull/flutter_impaktfull_ui/issues/88)) ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* copyWith on every component theme ([#67](https://github.com/impaktfull/flutter_impaktfull_ui/issues/67)) ([a8d879f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/a8d879fc562384bf615ae80a2f63bb24fb97ea2d))
* custom licenses with an image credit ([#93](https://github.com/impaktfull/flutter_impaktfull_ui/issues/93)) ([8d4f66b](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d4f66ba38c74cbed5ec37bc29908e07cefa0244))
* dark theme, faster theme lookup and honest theme defaults ([#96](https://github.com/impaktfull/flutter_impaktfull_ui/issues/96)) ([727fed3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/727fed38846b13505e7f3d4c67cc9dc422008df4))
* dart fix support to migrate deprecated APIs automatically (lib/fix_data.yaml) ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* dart fix support to migrate deprecated APIs automatically (lib/fix_data.yaml) ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* dart fix support to migrate deprecated APIs automatically (lib/fix_data.yaml) ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* dart fix support to migrate deprecated APIs automatically (lib/fix_data.yaml) ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* dart fix support to migrate deprecated APIs automatically (lib/fix_data.yaml) ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* dart fix support to migrate deprecated APIs automatically (lib/fix_data.yaml) ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* dart fix support to migrate deprecated APIs automatically (lib/fix_data.yaml) ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* days outside firstDate and lastDate are disabled, dimmed with the new textStyles.cellDisabled of the date picker theme and announced as a disabled button ([c8a6881](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c8a6881fdd64089ae284f7c1d73695a2b565aa6b))
* deprecate misspelled and unprefixed public APIs ([#65](https://github.com/impaktfull/flutter_impaktfull_ui/issues/65)) ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* deprecate unprefixed extensions, the global theme getter and inconsistent theme class names ([#84](https://github.com/impaktfull/flutter_impaktfull_ui/issues/84)) ([0822096](https://github.com/impaktfull/flutter_impaktfull_ui/commit/082209631039150b56ca1a274a737de36ac4a5e9))
* dimens tokens for the nav bar, bottom navigation item, horizontal tabs, sidebar navigation, screen, stepper, table, table header, table row, badge, dropdown and segmented control ([70d63c6](https://github.com/impaktfull/flutter_impaktfull_ui/commit/70d63c6381e6384ffa9ef41c99cf1adea2bc2a26))
* durations sub themes for the accordion, carousel, chat, confetti, dropdown, floating action button, image crop, modal, segmented control and virtual keyboard ([70d63c6](https://github.com/impaktfull/flutter_impaktfull_ui/commit/70d63c6381e6384ffa9ef41c99cf1adea2bc2a26))
* every component reads its geometry from its theme ([#106](https://github.com/impaktfull/flutter_impaktfull_ui/issues/106)) ([4d837a2](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4d837a2f15b4fb0cf03c5b272d160965d39481d8))
* export ImpaktfullUiContainer ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* export ImpaktfullUiFocusFeedback and ImpaktfullUiHoverFeedback ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* export ImpaktfullUiImageCropCircleOverlay and ImpaktfullUiImageCropSquareOverlay ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* export ImpaktfullUiSnackyConfigurator ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* export ImpaktfullUiThemeConfigurator, so a theme can be scoped to a subtree ([c67d086](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c67d086bb19ce42c1348725f68db77b9e9ed823a))
* firstDate and lastDate on ImpaktfullUiDateInputField ([c8a6881](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c8a6881fdd64089ae284f7c1d73695a2b565aa6b))
* firstDate and lastDate on ImpaktfullUiDatePicker, ImpaktfullUiDatePicker.range and their showModal and showRangeModal helpers ([c8a6881](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c8a6881fdd64089ae284f7c1d73695a2b565aa6b))
* firstDate and lastDate on ImpaktfullUiDateTimePicker and ImpaktfullUiDateTimePicker.showModal ([c8a6881](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c8a6881fdd64089ae284f7c1d73695a2b565aa6b))
* fontSizeText grows the text scale from the size of body text, on withMinimalChanges and ImpaktfullUiTextStylesTheme.getDefault ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* height, letterSpacing and fontWeight on the text style builders and on withMinimalChanges ([c67d086](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c67d086bb19ce42c1348725f68db77b9e9ed823a))
* hover, pressed and disabled colours per button variant, so a disabled button is no longer a blanket Opacity ([b8dae77](https://github.com/impaktfull/flutter_impaktfull_ui/commit/b8dae77218ee0134e327b1c10786459423338e2a))
* ImpaktfullUiAccessibilityLocalizations.unavailableDate for the day a date picker does not allow ([c8a6881](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c8a6881fdd64089ae284f7c1d73695a2b565aa6b))
* ImpaktfullUiApp takes an impaktfullUiDarkTheme and a themeMode, and follows the platform brightness ([727fed3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/727fed38846b13505e7f3d4c67cc9dc422008df4))
* ImpaktfullUiAsset compares by value, so two assets with the same path are equal ([9099569](https://github.com/impaktfull/flutter_impaktfull_ui/commit/909956989c3b803ea12b02ff3caa820581987058))
* ImpaktfullUiAsset.network renders an image that is loaded from the network ([8d4f66b](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d4f66ba38c74cbed5ec37bc29908e07cefa0244))
* ImpaktfullUiAsset.none() for an asset that renders nothing ([727fed3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/727fed38846b13505e7f3d4c67cc9dc422008df4))
* ImpaktfullUiAutoComplete closes its overlay on a tap outside and when the focus leaves it ([4cb7081](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4cb7081138752405d0abe2283f084fee987dc8e4))
* ImpaktfullUiAutoComplete supports arrow key navigation and onItemSelected for enter ([4cb7081](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4cb7081138752405d0abe2283f084fee987dc8e4))
* ImpaktfullUiBBLicenses.customLicenses shows the licenses of the app itself above the licenses of its packages ([8d4f66b](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d4f66ba38c74cbed5ec37bc29908e07cefa0244))
* ImpaktfullUiBBLicensesTheme sizes the image of a license (imageHeight, imageBorderRadius, imageSpacing) ([8d4f66b](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d4f66ba38c74cbed5ec37bc29908e07cefa0244))
* ImpaktfullUiButtonConfig and ImpaktfullUiFluidPaddingBreakPoint compare by value ([9099569](https://github.com/impaktfull/flutter_impaktfull_ui/commit/909956989c3b803ea12b02ff3caa820581987058))
* ImpaktfullUiButtonDurationsTheme.raisedPress and raisedRelease, and ImpaktfullUiGalleryDurationsTheme.zoom ([70d63c6](https://github.com/impaktfull/flutter_impaktfull_ui/commit/70d63c6381e6384ffa9ef41c99cf1adea2bc2a26))
* ImpaktfullUiCard.useFocusRing ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* ImpaktfullUiComponentsTheme.getDefault builds the component themes from the base tokens ([c67d086](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c67d086bb19ce42c1348725f68db77b9e9ed823a))
* ImpaktfullUiFocusFeedback takes an ImpaktfullUiFocusRingTheme to override the ring for one element ([4770494](https://github.com/impaktfull/flutter_impaktfull_ui/commit/477049496f47d082c87e13385324f8c59bcdf343))
* ImpaktfullUiFocusRingTheme with a color, a width and an offset for the focus ring, on ImpaktfullUiTouchFeedbackTheme.focusRing ([4770494](https://github.com/impaktfull/flutter_impaktfull_ui/commit/477049496f47d082c87e13385324f8c59bcdf343))
* ImpaktfullUiFocusRingTheme.enabled turns the focus ring off everywhere at once ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* ImpaktfullUiFocusRingTheme.inset, the same ring drawn against the inside edge of a component ([4f541c0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4f541c07545df0b823862cfafb597fa902b53bd6))
* ImpaktfullUiIconButton can be disabled with a null onTap ([4cb7081](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4cb7081138752405d0abe2283f084fee987dc8e4))
* ImpaktfullUiImageCrop.onCropped returns the cropped image ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiLicense takes an image and an imageSemanticLabel, and has a copyWith ([8d4f66b](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d4f66ba38c74cbed5ec37bc29908e07cefa0244))
* ImpaktfullUiModal accepts primaryActionOnTap and secondaryActionOnTap in the default constructor ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiModalColorTheme.barrier and ImpaktfullUiModalDimensTheme.barrierBlurSigma, instead of a hardcoded Colors.black54 and a blur sigma of 8 ([4770494](https://github.com/impaktfull/flutter_impaktfull_ui/commit/477049496f47d082c87e13385324f8c59bcdf343))
* ImpaktfullUiNotification.show accepts onTap, leading, trailing and width ([4cb7081](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4cb7081138752405d0abe2283f084fee987dc8e4))
* ImpaktfullUiNotification.show uses the snackyController of the app when a context is passed, and accepts a controller ([4cb7081](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4cb7081138752405d0abe2283f084fee987dc8e4))
* ImpaktfullUiNotificationDimensTheme.alignment and iconSize ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* ImpaktfullUiRadioButtonColorTheme.borderSelected ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* ImpaktfullUiShadcnTheme and ImpaktfullUiAntDesignTheme ([#104](https://github.com/impaktfull/flutter_impaktfull_ui/issues/104)) ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* ImpaktfullUiSkeletonColorTheme.highlight and ImpaktfullUiSkeletonDurationsTheme.shimmer ([70d63c6](https://github.com/impaktfull/flutter_impaktfull_ui/commit/70d63c6381e6384ffa9ef41c99cf1adea2bc2a26))
* ImpaktfullUiSnackyConfiguratorDimensTheme.margin ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* ImpaktfullUiSpacingTheme, the spacing scale of ImpaktfullUiDimensTheme.spacing ([c67d086](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c67d086bb19ce42c1348725f68db77b9e9ed823a))
* ImpaktfullUiTabBarDimensTheme.expandItems sizes a tab to its title instead of stretching it ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* ImpaktfullUiTable passes its columnConfig to its header and rows ([4cb7081](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4cb7081138752405d0abe2283f084fee987dc8e4))
* ImpaktfullUiTableColorTheme.divider and ImpaktfullUiTableDimensTheme.borderWidth ([4770494](https://github.com/impaktfull/flutter_impaktfull_ui/commit/477049496f47d082c87e13385324f8c59bcdf343))
* ImpaktfullUiTableHeaderColorTheme.border and ImpaktfullUiTableHeaderDimensTheme.borderWidth ([4770494](https://github.com/impaktfull/flutter_impaktfull_ui/commit/477049496f47d082c87e13385324f8c59bcdf343))
* ImpaktfullUiTableHeaderItemDimensTheme.sortIconSize and sortIconSpacing, and ImpaktfullUiTableHeaderItemColorTheme.sortIcon ([4770494](https://github.com/impaktfull/flutter_impaktfull_ui/commit/477049496f47d082c87e13385324f8c59bcdf343))
* ImpaktfullUiTableRow observes hover and takes an isSelected, so a row can show its hovered and selected state ([4770494](https://github.com/impaktfull/flutter_impaktfull_ui/commit/477049496f47d082c87e13385324f8c59bcdf343))
* ImpaktfullUiTableRowColorTheme has background, backgroundAlternate, backgroundHover, backgroundSelected and border ([4770494](https://github.com/impaktfull/flutter_impaktfull_ui/commit/477049496f47d082c87e13385324f8c59bcdf343))
* ImpaktfullUiTableRowItemDimensTheme.padding, customPadding and spacing, and ImpaktfullUiTableHeaderItemDimensTheme.padding and spacing: the cell padding is a token instead of a constructor default ([4770494](https://github.com/impaktfull/flutter_impaktfull_ui/commit/477049496f47d082c87e13385324f8c59bcdf343))
* ImpaktfullUiTextStylesTheme.getDefault builds the 13 text style groups from a color theme ([c67d086](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c67d086bb19ce42c1348725f68db77b9e9ed823a))
* ImpaktfullUiTheme.brightness tells a widget which variant it renders on ([727fed3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/727fed38846b13505e7f3d4c67cc9dc422008df4))
* ImpaktfullUiTheme.copyWithBaseTokens builds the component themes again from changed base tokens ([c67d086](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c67d086bb19ce42c1348725f68db77b9e9ed823a))
* ImpaktfullUiTheme.getDefault() takes fontFamilyDisplay and fontFamilyText, and every font family parameter accepts null for the font of the platform ([727fed3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/727fed38846b13505e7f3d4c67cc9dc422008df4))
* ImpaktfullUiTheme.getDefaultDark() and a brightness for ImpaktfullUiDefaultTheme.withMinimalChanges ([727fed3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/727fed38846b13505e7f3d4c67cc9dc422008df4))
* ImpaktfullUiVirtualKeyboardTextStyleTheme.text and ImpaktfullUiVirtualKeyboardDimensTheme.inputPadding ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* implement ImpaktfullUiIntroduction with pages, page indicator, skip, next and done ([4cb7081](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4cb7081138752405d0abe2283f084fee987dc8e4))
* loading indicators announce Loading, skeletons and placeholder illustrations are hidden from screen readers, errors of ImpaktfullUiLoadingErrorData are a live region ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* localizable strings and locale-aware dates in every component ([#76](https://github.com/impaktfull/flutter_impaktfull_ui/issues/76)) ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* min and max date for every date picker ([#94](https://github.com/impaktfull/flutter_impaktfull_ui/issues/94)) ([c8a6881](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c8a6881fdd64089ae284f7c1d73695a2b565aa6b))
* minWidth and windowMargin on ImpaktfullUiDropdownDimensTheme, the width a menu of a narrow button gets and the space it keeps from the edge of the window ([4d837a2](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4d837a2f15b4fb0cf03c5b272d160965d39481d8))
* padding and badge spacing for ImpaktfullUiHorizontalTab and a background for ImpaktfullUiHorizontalTabs ([b8dae77](https://github.com/impaktfull/flutter_impaktfull_ui/commit/b8dae77218ee0134e327b1c10786459423338e2a))
* padding, spacing and widget size tokens per ImpaktfullUiBadgeSize ([b8dae77](https://github.com/impaktfull/flutter_impaktfull_ui/commit/b8dae77218ee0134e327b1c10786459423338e2a))
* progress indicators announce their value as a percentage, the line chart a localized summary, the notification badge the amount of notifications ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* rename component theme classes to the naming of the others (*TextStyleTheme, *AssetsTheme, *DurationsTheme, *ShadowsTheme) ([0822096](https://github.com/impaktfull/flutter_impaktfull_ui/commit/082209631039150b56ca1a274a737de36ac4a5e9))
* right-to-left support for every component ([#75](https://github.com/impaktfull/flutter_impaktfull_ui/issues/75)) ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* size and state tokens for the button, badge and tab bar ([#101](https://github.com/impaktfull/flutter_impaktfull_ui/issues/101)) ([b8dae77](https://github.com/impaktfull/flutter_impaktfull_ui/commit/b8dae77218ee0134e327b1c10786459423338e2a))
* size and state tokens for the input field, checkbox and switch ([#100](https://github.com/impaktfull/flutter_impaktfull_ui/issues/100)) ([28108ae](https://github.com/impaktfull/flutter_impaktfull_ui/commit/28108ae9f0fc684392766ac811d27cc67af2c6fd))
* size tokens for ImpaktfullUiCheckbox (size, iconSize, borderWidth, activeBorderWidth) ([28108ae](https://github.com/impaktfull/flutter_impaktfull_ui/commit/28108ae9f0fc684392766ac811d27cc67af2c6fd))
* size tokens for ImpaktfullUiColorInputField (swatchSize, borderWidth, spacing) ([28108ae](https://github.com/impaktfull/flutter_impaktfull_ui/commit/28108ae9f0fc684392766ac811d27cc67af2c6fd))
* size tokens for ImpaktfullUiDateInputField (padding, contentPadding, minHeight, spacing, iconSize, borderWidth) ([28108ae](https://github.com/impaktfull/flutter_impaktfull_ui/commit/28108ae9f0fc684392766ac811d27cc67af2c6fd))
* size tokens for ImpaktfullUiInputField (padding, paddingWithActions, contentPadding, readOnlyContentPadding, minHeight, multilineMinHeight, spacing, iconSize, borderWidth) ([28108ae](https://github.com/impaktfull/flutter_impaktfull_ui/commit/28108ae9f0fc684392766ac811d27cc67af2c6fd))
* size tokens for ImpaktfullUiNumberInput (spacing) ([28108ae](https://github.com/impaktfull/flutter_impaktfull_ui/commit/28108ae9f0fc684392766ac811d27cc67af2c6fd))
* size tokens for ImpaktfullUiSwitch (thumbSize, iconSize) ([28108ae](https://github.com/impaktfull/flutter_impaktfull_ui/commit/28108ae9f0fc684392766ac811d27cc67af2c6fd))
* size tokens for the button: height, padding, spacing, iconSize and loadingSize per ImpaktfullUiButtonSize, plus linkPadding ([b8dae77](https://github.com/impaktfull/flutter_impaktfull_ui/commit/b8dae77218ee0134e327b1c10786459423338e2a))
* support every platform, including web and Wasm ([#83](https://github.com/impaktfull/flutter_impaktfull_ui/issues/83)) ([003b8e1](https://github.com/impaktfull/flutter_impaktfull_ui/commit/003b8e18f9fa043b4a281d0c4cf001544759aa3f))
* support Flutter 3.44.x ([#61](https://github.com/impaktfull/flutter_impaktfull_ui/issues/61)) ([f82ace2](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f82ace205f8a299ff4f9ccffcfd3c0b82a7f8059))
* table, modal and focus ring tokens ([#102](https://github.com/impaktfull/flutter_impaktfull_ui/issues/102)) ([4770494](https://github.com/impaktfull/flutter_impaktfull_ui/commit/477049496f47d082c87e13385324f8c59bcdf343))
* the command menu window moves between the input and the results with tab and the arrow keys and is a named modal route for screen readers ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* the dropdown moves the focus into its items when it opens, closes with escape and gives the focus back to the button ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* the month, year and decade navigation of the date picker stops at firstDate and lastDate, and the years list only shows the years in range ([c8a6881](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c8a6881fdd64089ae284f7c1d73695a2b565aa6b))
* the slider has slider semantics with increase and decrease actions and reacts to the arrow keys, home and end ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* the stepper announces every step and the current step, pagination the page, the carousel the current slide ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* the tabs of the Ant Design theme are an ink bar, like ant.design/components/tabs ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* theme tokens for the hardcoded durations, sizes and the skeleton shimmer ([#97](https://github.com/impaktfull/flutter_impaktfull_ui/issues/97)) ([70d63c6](https://github.com/impaktfull/flutter_impaktfull_ui/commit/70d63c6381e6384ffa9ef41c99cf1adea2bc2a26))
* tokens for the tab bar and its items: background, divider, padding, height, spacing, selected background, marker and label ([b8dae77](https://github.com/impaktfull/flutter_impaktfull_ui/commit/b8dae77218ee0134e327b1c10786459423338e2a))
* value equality for every theme, so an unchanged theme stops rebuilding the UI ([#98](https://github.com/impaktfull/flutter_impaktfull_ui/issues/98)) ([9099569](https://github.com/impaktfull/flutter_impaktfull_ui/commit/909956989c3b803ea12b02ff3caa820581987058))
* with reduce motion accordions, the sidebar, dropdowns, modals, bottom sheets, switches, the segmented control, progress indicators and the floating action button change without a transition ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* with reduce motion skeletons do not shimmer, confetti is not shown, carousels do not autoplay and chat typing dots do not bounce ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))


### Bug Fixes

* a checked radio button of the shadcn/ui theme is bg-primary with a primary border, not a grey one ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* a component that is taller than its card in the example app is clipped instead of overflowing ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* a disabled icon-only button keeps its tooltip for screen readers ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* a focused input field draws one focus ring, exactly focusRingWidth thick ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* a long file name of ImpaktfullUiFilePicker no longer overlaps the delete button ([d0323c9](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d0323c92485deab80eea2d5c3d0b789d49ef8489))
* a long label of ImpaktfullUiSegmentedControl is ellipsized instead of overflowing ([d0323c9](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d0323c92485deab80eea2d5c3d0b789d49ef8489))
* a raised ImpaktfullUiButton can be focused and activated with the keyboard ([d0323c9](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d0323c92485deab80eea2d5c3d0b789d49ef8489))
* a raised ImpaktfullUiButton no longer animates when the user asked to reduce motion ([70d63c6](https://github.com/impaktfull/flutter_impaktfull_ui/commit/70d63c6381e6384ffa9ef41c99cf1adea2bc2a26))
* a shrinkWrap ImpaktfullUiTable in a scrollable parent no longer throws when it scrolls horizontally ([cea17a3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/cea17a3bb4777a689468acdf49050fbd005488e5))
* a tappable element on mobile web can be activated with enter and space ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* a theme passed to the virtual keyboard, the image cropper, the week calendar, the list view and the horizontal tabs reaches the widgets inside them ([4d837a2](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4d837a2f15b4fb0cf03c5b272d160965d39481d8))
* an input field no longer loses what is typed while the app is rebuilding ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* apps that depend on impaktfull_ui build again on Flutter 3.44 and newer: the icons come from phosphoricons_flutter instead of phosphor_flutter 2.1.0, which does not compile since IconData became a final class ([64cee6d](https://github.com/impaktfull/flutter_impaktfull_ui/commit/64cee6d8ddccd7e1d4d9b50d610d15902962ff26))
* back, previous/next and chevron icons of ImpaktfullUiNavBar, ImpaktfullUiCmsHeader, ImpaktfullUiPagination, ImpaktfullUiDatePicker, ImpaktfullUiCalendar, ImpaktfullUiGallery, ImpaktfullUiListItem and ImpaktfullUiNotification point in the reading direction ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* borderRadiusCircle is BorderRadius.circular(999) instead of 99999999, which made a software rendered frame with an InkWell take minutes ([c67d086](https://github.com/impaktfull/flutter_impaktfull_ui/commit/c67d086bb19ce42c1348725f68db77b9e9ed823a))
* building blocks and the image crop preview follow theme overrides and rebuild when the theme changes ([0822096](https://github.com/impaktfull/flutter_impaktfull_ui/commit/082209631039150b56ca1a274a737de36ac4a5e9))
* Cancel and Apply of ImpaktfullUiDatePicker and ImpaktfullUiDateTimePicker modals close the modal instead of another route when rootNavigator is true ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* components with texts no longer need an ImpaktfullUiApp above them, they fall back to the English defaults ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* data display bugs ([#68](https://github.com/impaktfull/flutter_impaktfull_ui/issues/68)) ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* data display bugs found by new golden and interaction tests ([#81](https://github.com/impaktfull/flutter_impaktfull_ui/issues/81)) ([cea17a3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/cea17a3bb4777a689468acdf49050fbd005488e5))
* date picker and calendar start the week on the first day of the week of the locale when the app has localized material localizations ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* date picker and calendar weekday and month names use the locale of the app ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* dates in the calendar, chat and date input field use the short date format of the locale (dd/MM/yyyy stays for the default en locale) ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* DateTime beginningOfTheWeek and endOfTheWeek return the right day across a daylight saving time switch ([a4c2e2d](https://github.com/impaktfull/flutter_impaktfull_ui/commit/a4c2e2d34f9f68713292b51bee6a50cc2a7d9dd9))
* DateTime getNextMonth and getPreviousMonth no longer skip a month from the 29th, 30th or 31st, they clamp to the last day of the month ([a4c2e2d](https://github.com/impaktfull/flutter_impaktfull_ui/commit/a4c2e2d34f9f68713292b51bee6a50cc2a7d9dd9))
* DeviceUtil no longer recurses endlessly when compiled to Wasm ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* disabled ImpaktfullUiCheckbox has no hover, ripple or focus feedback ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* disabled ImpaktfullUiSlider can not be moved and min equal to max no longer throws ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* disposing an open ImpaktfullUiDropdown no longer throws ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* downloading the image to crop completes with an error when it fails and no longer leaks a listener ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* exclude build output, tests and tooling from the published package ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* export every type used by the public API ([#69](https://github.com/impaktfull/flutter_impaktfull_ui/issues/69)) ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* export ImpaktfullUiAutoCompleteControllerListener ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* export ImpaktfullUiChatStatus ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* export ImpaktfullUiCheckboxType, the type of ImpaktfullUiCheckbox.type (was the unexported CheckboxType) ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* export ImpaktfullUiCommandMenuController and ImpaktfullUiCommandMenuListener, passed to the ImpaktfullUiCommandMenu builder (were the unexported CommanderController and CommanderListener) ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* export ImpaktfullUiDatePickerType, ImpaktfullUiTableHeaderItemType and ImpaktfullUiTableRowItemType ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* export ImpaktfullUiFilePickerProgressType ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* export ImpaktfullUiGridViewLocalizations ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* export ImpaktfullUiImageCropController, ImpaktfullUiImageCropCropper and ImpaktfullUiImageCropInfo ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* export ImpaktfullUiImageCropOverlay ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* export ImpaktfullUiSnackyConfiguratorTheme and its assets, color, dimens and text styles themes ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* FileSizeCalculationUtil supports PB and EB instead of throwing above 1024 TB ([a4c2e2d](https://github.com/impaktfull/flutter_impaktfull_ui/commit/a4c2e2d34f9f68713292b51bee6a50cc2a7d9dd9))
* four component themes follow the global animation durations ([#103](https://github.com/impaktfull/flutter_impaktfull_ui/issues/103)) ([00f1e77](https://github.com/impaktfull/flutter_impaktfull_ui/commit/00f1e77fe2107ca3a34e57abe3bc180a0cd59c5c))
* ImpaktfullUiAdaptiveNavBar shows the badge on small screens and no longer calls setState after an async action finished on a removed nav bar ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiAdaptivePageRoute uses the instant desktop route on desktop and the material route on mobile (it was the other way around) ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiApp uses materialDarkTheme as the dark theme (falls back to materialLightTheme) ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiApp without a theme no longer hands down a new default theme on every build ([727fed3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/727fed38846b13505e7f3d4c67cc9dc422008df4))
* ImpaktfullUiAsset only adds the suffix to the file name, a directory with a dot is no longer changed ([a4c2e2d](https://github.com/impaktfull/flutter_impaktfull_ui/commit/a4c2e2d34f9f68713292b51bee6a50cc2a7d9dd9))
* ImpaktfullUiAutoLayout wrap mode uses Wrap spacing and respects the alignments ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiBadge truncates a label that does not fit a bounded width instead of overflowing, badges in an unbounded width keep their size ([cea17a3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/cea17a3bb4777a689468acdf49050fbd005488e5))
* ImpaktfullUiBadge uses start/end paddings around its leading and trailing content in right-to-left layouts ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiBadge uses the medium and large text style of its theme for the medium and large size ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiBBLicenses no longer calls setState after it is disposed while the licenses load ([003b8e1](https://github.com/impaktfull/flutter_impaktfull_ui/commit/003b8e18f9fa043b4a281d0c4cf001544759aa3f))
* ImpaktfullUiBottomActions takes the height of its children instead of all available height ([d2afe46](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d2afe46ee128536f73dc0aec2344bdf673c479f6))
* ImpaktfullUiBottomSheet closes when onCloseTapped returns true ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiButton shows the loading indicator and ignores taps when isLoading is true ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiButtonTheme.copyWith keeps shadow ([a8d879f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/a8d879fc562384bf615ae80a2f63bb24fb97ea2d))
* ImpaktfullUiCalendar no longer sorts (and throws on unmodifiable) event lists of the app ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiCalendar week view places partially overlapping events next to each other ([185d965](https://github.com/impaktfull/flutter_impaktfull_ui/commit/185d965edc757620d786a1f0092403e12e476830))
* ImpaktfullUiCalendar week view positions its events from the start in right-to-left layouts ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiCalendar week view positions overlapping events relative to the width of the day ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiCalendar week view shows full day events in the right column when they start or end in another week, only lets events of the visible week push others down and no longer throws without full day events ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiCalendarEvent.amountOfDaysCovered counts calendar days, not 24 hour periods ([185d965](https://github.com/impaktfull/flutter_impaktfull_ui/commit/185d965edc757620d786a1f0092403e12e476830))
* ImpaktfullUiCard with error no longer crashes without a borderError color and clips with its own borderRadius ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiCarousel no longer interrupts a swipe when the parent passes the index of onItemChanged back ([4cb7081](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4cb7081138752405d0abe2283f084fee987dc8e4))
* ImpaktfullUiCarousel pauses autoplay while the user drags, jumps back to the first page when looping, and uses indicatorPadding of its theme ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiChat aligns and rounds own messages at the end in right-to-left layouts ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiChat messages no longer overflow a chat narrower than 300px ([cea17a3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/cea17a3bb4777a689468acdf49050fbd005488e5))
* ImpaktfullUiChat only shows the typing indicator when another sender is typing, and no longer leaks timers when it is disposed ([cea17a3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/cea17a3bb4777a689468acdf49050fbd005488e5))
* ImpaktfullUiChat shows a date label above the first message of every day, not only above the oldest message ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiChat.stream shows the messages of its stream, and ImpaktfullUiChat updates when the parent passes new items or a new stream ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiColorInputField parses and shows the alpha when alphaEnabled is true ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiColorInputField slider picker only closes when the slider is released ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiColorPicker.defaultColors contains red once and the simple picker tooltips show the hex value ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiCommandMenuController.show does not add a second menu that can not be hidden ([185d965](https://github.com/impaktfull/flutter_impaktfull_ui/commit/185d965edc757620d786a1f0092403e12e476830))
* ImpaktfullUiCommandMenuWindow no longer overflows on small screens ([185d965](https://github.com/impaktfull/flutter_impaktfull_ui/commit/185d965edc757620d786a1f0092403e12e476830))
* ImpaktfullUiComponentsTheme.of&lt;T&gt; is one map lookup instead of a chain of 87 type checks ([727fed3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/727fed38846b13505e7f3d4c67cc9dc422008df4))
* ImpaktfullUiConfetti no longer blocks taps on the widgets below and no longer throws or leaves a timer running when it is removed early ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiContainer draws a border without borderRadius and keeps every side of a non-uniform border ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiContainer no longer throws for a border with different colors per side and a borderRadius ([d2afe46](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d2afe46ee128536f73dc0aec2344bdf673c479f6))
* ImpaktfullUiDateInputField uses the background, border and borderError colors of its theme ([d0323c9](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d0323c92485deab80eea2d5c3d0b789d49ef8489))
* ImpaktfullUiDatePicker highlights the selected year in the years view, no longer throws when the date changes in the years view and passes showDividers to its modal (also ImpaktfullUiDateTimePicker) ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiDatePicker marks the end day of a range as end when the end date has a time ([185d965](https://github.com/impaktfull/flutter_impaktfull_ui/commit/185d965edc757620d786a1f0092403e12e476830))
* ImpaktfullUiDatePicker no longer cuts off the last week of the month when the title or the weekdays need more space ([003b8e1](https://github.com/impaktfull/flutter_impaktfull_ui/commit/003b8e18f9fa043b4a281d0c4cf001544759aa3f))
* ImpaktfullUiDatePicker no longer skips a month when paging from the 29th, 30th or 31st ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiDateTimePicker shows its value and no longer emits a date in year 0 when only the time is picked ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiDateTimePicker without a value keeps the shown time when a date is picked ([185d965](https://github.com/impaktfull/flutter_impaktfull_ui/commit/185d965edc757620d786a1f0092403e12e476830))
* ImpaktfullUiDefaultModalRoute applies its transition curve once and disposes its animation ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiDropdown connects a new controller passed by the parent ([d0323c9](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d0323c92485deab80eea2d5c3d0b789d49ef8489))
* ImpaktfullUiDropdown fade in animation is visible and every dropdown can be opened and closed on its own ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiDropdown overlay width follows the width of the dropdown ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiDropdownAlignment bottomLeft/bottomRight follow the reading direction and the dropdown no longer jumps to the far edge in right-to-left layouts ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiFilePicker shows a rounded upload percentage ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiFilePicker uses the progressIndicator color of its theme ([d0323c9](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d0323c92485deab80eea2d5c3d0b789d49ef8489))
* ImpaktfullUiFloatingActionButton measures its label in the ambient text direction ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiGallery clips the items with itemBorderRadius ([185d965](https://github.com/impaktfull/flutter_impaktfull_ui/commit/185d965edc757620d786a1f0092403e12e476830))
* ImpaktfullUiGallery shows noDataLabel, gives every item a unique hero tag and its full screen view jumps to the right page and no longer leaks zoom animations ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiGalleryFullScreen shows its close button at the top end and mirrors its previous/next arrows and arrow keys in right-to-left layouts ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiHalfCircleProgressIndicator draws its stroke inside its bounds ([cea17a3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/cea17a3bb4777a689468acdf49050fbd005488e5))
* ImpaktfullUiImageCrop no longer disposes the controller of the app, no longer throws without an imageUrl and no longer calls setState after it is removed ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiImageCrop shows nothing instead of reporting an error for a broken imageUrl ([003b8e1](https://github.com/impaktfull/flutter_impaktfull_ui/commit/003b8e18f9fa043b4a281d0c4cf001544759aa3f))
* ImpaktfullUiImageCropController.cropImageFile crops the file instead of throwing "imageFile is not supported yet" ([003b8e1](https://github.com/impaktfull/flutter_impaktfull_ui/commit/003b8e18f9fa043b4a281d0c4cf001544759aa3f))
* ImpaktfullUiInputField and ImpaktfullUiDateInputField use start/end paddings in right-to-left layouts ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiInputField uses a new controller or focusNode and keeps the selection when the value changes ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiInputField uses the background, border and borderError colors of its theme ([d0323c9](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d0323c92485deab80eea2d5c3d0b789d49ef8489))
* ImpaktfullUiInputFieldAction uses the bottom end radius of the theme ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiLineChart repaints when its data changes, and no longer draws NaN when every value is 0 ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiLineChart uses the line color of a new theme, and gradients with more than 2 colors without stops no longer throw ([cea17a3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/cea17a3bb4777a689468acdf49050fbd005488e5))
* ImpaktfullUiListItem ignores taps while onAsyncTap is running ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiListItem uses leadingSize of its theme, and ImpaktfullUiAssetWidget.overrideColor keeps the size, width, height, fit and key ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiListView adds its spacing between the items of a horizontal list ([cea17a3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/cea17a3bb4777a689468acdf49050fbd005488e5))
* ImpaktfullUiListView and ImpaktfullUiGridView can be pulled to refresh when the items do not fill them, and an empty ImpaktfullUiGridView can be pulled to refresh ([cea17a3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/cea17a3bb4777a689468acdf49050fbd005488e5))
* ImpaktfullUiListView.separated draws a custom separator once instead of twice, and ImpaktfullUiListView with itemsPerRow no longer builds empty rows ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiListViewPlaceholderData.showAsset and ImpaktfullUiGridViewPlaceholderData.showAsset hide the asset (new ImpaktfullUiPlaceholder.showAsset) ([cea17a3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/cea17a3bb4777a689468acdf49050fbd005488e5))
* ImpaktfullUiLoadingErrorData shows the error or no data state with only an errorAssetBuilder or noDataAssetBuilder ([cea17a3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/cea17a3bb4777a689468acdf49050fbd005488e5))
* ImpaktfullUiMasterDetail back on small screens calls onBackTapped when no detail is open, instead of onCloseDetail ([d2afe46](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d2afe46ee128536f73dc0aec2344bdf673c479f6))
* ImpaktfullUiMasterDetail no longer shows a back button that does nothing for an open detail on large screens ([d2afe46](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d2afe46ee128536f73dc0aec2344bdf673c479f6))
* ImpaktfullUiMasterDetail shows its own actions again after a detail is closed ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiMasterDetail shows the master title and actions again when the detail is closed from code ([d2afe46](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d2afe46ee128536f73dc0aec2344bdf673c479f6))
* ImpaktfullUiMasterDetailItemScreen no longer rebuilds ImpaktfullUiMasterDetail in an endless loop ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiMetric shows its more button at the top end in right-to-left layouts ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiModal shows its close button at the top end in right-to-left layouts ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiModal.showSimple respects isDismissible, and ImpaktfullUiModal no longer tries to pop its route itself when tapped around (e.g. when used inline) ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiNavBar centers a centered title when there are actions on one side only ([d2afe46](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d2afe46ee128536f73dc0aec2344bdf673c479f6))
* ImpaktfullUiNetworkImage no longer throws in profile and release mode when the image fails to load (also fixes ImpaktfullUiAvatar with a broken url) ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiNotification calls onTap when tapped ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiNotificationBadge hides a badge with a text when show is false, and positions it with the text direction and text scale of the app ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiNotificationBadge locations follow the reading direction ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiNumberInput shows a new value from the parent and the clamped value after leaving the field ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiOptionSelector uses toString() for options that are not a String without a titleBuilder ([d0323c9](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d0323c92485deab80eea2d5c3d0b789d49ef8489))
* ImpaktfullUiPasswordStrengthIndicator clamps strengthIndicatorIndex instead of throwing ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiPinCode accepts numpad keys ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiResponsiveLayout.isSmallOrBigger and context.isSmallScreenOrBigger return true for every screen width ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiResponsiveRow lines up the items of an incomplete last row with the columns above ([d2afe46](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d2afe46ee128536f73dc0aec2344bdf673c479f6))
* ImpaktfullUiResponsiveRow no longer adds an empty row when the children fill the last row ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiScreen and ImpaktfullUiAdaptiveScreen place the fab at the bottom end by default in right-to-left layouts ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiScreen.of asserts with a readable message ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiSegmentedControl shows its indicator under the selected segment in right-to-left layouts ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiSegmentedControl supports a single item, a value that is not an item and non String items without labelBuilder ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiSidebarNavigation gives its content the remaining height, so scrollable content works ([d2afe46](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d2afe46ee128536f73dc0aec2344bdf673c479f6))
* ImpaktfullUiSidebarNavigationItem no longer crashes outside an ImpaktfullUiScreen and expands when a sub item becomes selected ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiSidebarNavigationItem uses durations.dropdownRotation of its theme instead of a hardcoded 200ms ([70d63c6](https://github.com/impaktfull/flutter_impaktfull_ui/commit/70d63c6381e6384ffa9ef41c99cf1adea2bc2a26))
* ImpaktfullUiSkeleton shimmer moves in the reading direction ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiSlider puts its minimum at the start and handles taps and drags in right-to-left layouts ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiSnackyConfigurator falls back to the ambient text direction without a locale ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiStepper renders every step active when all steps are completed and handles identical items ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiSwitch moves its thumb to the end in right-to-left layouts ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiTabBar and ImpaktfullUiTabBarItem follow a new TabController ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiTableHeaderItem.checkbox shows its checkbox without a title and no longer crashes without onChanged, and a table header title uses the full width of its column ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiTableRowItem.badge aligns its badge at the start in right-to-left layouts ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiTableRowItem.checkbox no longer crashes without onChanged ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiTableRowItem.checkbox without a title fits the same column as the header checkbox ([cea17a3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/cea17a3bb4777a689468acdf49050fbd005488e5))
* ImpaktfullUiTableRowItem.custom uses the padding that is passed ([cea17a3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/cea17a3bb4777a689468acdf49050fbd005488e5))
* ImpaktfullUiTheme.getDefault passes assetSuffix on to the app's own assets (the assets bundled with impaktfull_ui never get a suffix) ([a4c2e2d](https://github.com/impaktfull/flutter_impaktfull_ui/commit/a4c2e2d34f9f68713292b51bee6a50cc2a7d9dd9))
* ImpaktfullUiTimePicker shows a new value passed by the parent ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiTouchFeedback shows the keyboard focus ring (when useFocusColor is true) in the color of the theme of the context ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiTouchFeedback uses InkRipple instead of InkSparkle on the web, like ThemeData ([003b8e1](https://github.com/impaktfull/flutter_impaktfull_ui/commit/003b8e18f9fa043b4a281d0c4cf001544759aa3f))
* ImpaktfullUiUnifiedScreenLayout centers the content for centerLeft and centerRight alignments ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiVirtualKeyboard no longer throws when the text is changed from outside ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiVirtualKeyboard show/hide password button reveals the text ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiVirtualKeyboard types the shifted symbol when shift is active ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiVirtualKeyboard waits before repeating a held key ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiWysiwyg no longer throws when formatting after the text changed from outside ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiWysiwyg passes its theme to the editor and its actions ([d0323c9](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d0323c92485deab80eea2d5c3d0b789d49ef8489))
* input and control bugs ([#70](https://github.com/impaktfull/flutter_impaktfull_ui/issues/70)) ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* input and control bugs found by new golden and interaction tests ([#80](https://github.com/impaktfull/flutter_impaktfull_ui/issues/80)) ([d0323c9](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d0323c92485deab80eea2d5c3d0b789d49ef8489))
* layout and navigation bugs ([#72](https://github.com/impaktfull/flutter_impaktfull_ui/issues/72)) ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* navigation and layout bugs found by the new tests ([#79](https://github.com/impaktfull/flutter_impaktfull_ui/issues/79)) ([d2afe46](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d2afe46ee128536f73dc0aec2344bdf673c479f6))
* overlay and picker bugs ([#71](https://github.com/impaktfull/flutter_impaktfull_ui/issues/71)) ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* progress percentages and file sizes use the number format of the locale ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* readOnly ImpaktfullUiDateInputField no longer opens the date picker ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* shrink the published package from 19 MB to 1 MB ([#66](https://github.com/impaktfull/flutter_impaktfull_ui/issues/66)) ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* the actions of ImpaktfullUiCmsHeader are centred on each other and on the title ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* the actions of ImpaktfullUiSectionTitle are centred on each other and on the title ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* the calendar divider, the padding of a chat message and the radius of a radio button list item use the token they already had, instead of a hardcoded value ([4d837a2](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4d837a2f15b4fb0cf03c5b272d160965d39481d8))
* the close button of a notification of both design system themes is no longer clipped by its corner ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* the command menu input no longer takes the focus back when it loses it, which trapped keyboard and screen reader users ([0c30d49](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c30d49f2bded8cb20cbcc7d63c6b787f6e8b5e7))
* the default theme no longer points at a logo and a splash logo that the package does not ship ([727fed3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/727fed38846b13505e7f3d4c67cc9dc422008df4))
* the dot of a checked radio button of the Ant Design theme is dotSize (6), not 8 ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* the empty placeholder of ImpaktfullUiListView and ImpaktfullUiGridView scrolls instead of overflowing when it is taller than the list ([cea17a3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/cea17a3bb4777a689468acdf49050fbd005488e5))
* the example app no longer crashes when switching to another variant of the same component ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* the expanded label of ImpaktfullUiFloatingActionButton is no longer clipped ([d0323c9](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d0323c92485deab80eea2d5c3d0b789d49ef8489))
* the focus ring of a slider follows ImpaktfullUiFocusRingTheme instead of its own accent at 66% ([4d837a2](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4d837a2f15b4fb0cf03c5b272d160965d39481d8))
* the focus ring of a tab, a sidebar item and a table row is no longer clipped ([#105](https://github.com/impaktfull/flutter_impaktfull_ui/issues/105)) ([4f541c0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4f541c07545df0b823862cfafb597fa902b53bd6))
* the logo and splash logo of ImpaktfullUiAssetTheme get the asset suffix when they come from the app, and the bundled loading lottie no longer gets a suffix that impaktfull_ui does not ship ([a4c2e2d](https://github.com/impaktfull/flutter_impaktfull_ui/commit/a4c2e2d34f9f68713292b51bee6a50cc2a7d9dd9))
* the overlay of ImpaktfullUiAutoComplete uses the theme passed to the auto complete ([d0323c9](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d0323c92485deab80eea2d5c3d0b789d49ef8489))
* the package no longer imports dart:io on the web, so pub.dev lists it as supporting the web ([003b8e1](https://github.com/impaktfull/flutter_impaktfull_ui/commit/003b8e18f9fa043b4a281d0c4cf001544759aa3f))
* the placeholder of both design system themes writes its title in the text scale of the theme ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* the radio button of the shadcn/ui theme fills its dot instead of its circle ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* the scrolling tabs of the shadcn/ui theme no longer add space above and below the track ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* the selected item of the segmented control of both design system themes is a box inside the track, without a border ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* the shimmer of ImpaktfullUiSkeleton is visible again ([70d63c6](https://github.com/impaktfull/flutter_impaktfull_ui/commit/70d63c6381e6384ffa9ef41c99cf1adea2bc2a26))
* the slider of ImpaktfullUiColorPicker picks the color of its gradient, so custom allowedColors are respected ([d0323c9](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d0323c92485deab80eea2d5c3d0b789d49ef8489))
* the start and end corners of a theme border radius mirror in right-to-left layouts, e.g. the date picker range highlight ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* the tabs of the design system themes no longer touch the edge of the screen ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* the tabs of the shadcn/ui theme are a rounded track with a margin, not a bar from edge to edge ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* the text of the virtual keyboard is no longer cut off by the text style of the app around it ([0773fd0](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0773fd0f3edb60391fcfd4bce7089dc5a033121f))
* the title of an ImpaktfullUiButton wraps instead of overflowing when the button is narrower than the title ([003b8e1](https://github.com/impaktfull/flutter_impaktfull_ui/commit/003b8e18f9fa043b4a281d0c4cf001544759aa3f))
* times in the calendar follow the locale and MediaQuery.alwaysUse24HourFormat (24 hours stays for the default en locale) ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* use phosphoricons_flutter so apps can build on Flutter 3.44 and newer ([#91](https://github.com/impaktfull/flutter_impaktfull_ui/issues/91)) ([64cee6d](https://github.com/impaktfull/flutter_impaktfull_ui/commit/64cee6d8ddccd7e1d4d9b50d610d15902962ff26))


### Deprecations

* BorderRadiusGeometryExtension, EdgeInsetsGeometryExtension and ThemeDataExtension, no longer exported in 1.0.0 ([0822096](https://github.com/impaktfull/flutter_impaktfull_ui/commit/082209631039150b56ca1a274a737de36ac4a5e9))
* DateTimeExtensions and getDayForMonthWithFallback, no longer exported in 1.0.0 ([0822096](https://github.com/impaktfull/flutter_impaktfull_ui/commit/082209631039150b56ca1a274a737de36ac4a5e9))
* DefaultTheme, TableColumnConfig, CustomBadgeWidget, CommandMenuWindow, InputFieldValidator, PasswordStrengthIndicatorRequirement, CircleProgressPainter, HalfCircleProgressPainter and VirtualKeyboardConfig, use the ImpaktfullUi-prefixed names ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* DefaultTheme, TableColumnConfig, CustomBadgeWidget, CommandMenuWindow, InputFieldValidator, PasswordStrengthIndicatorRequirement, CircleProgressPainter, HalfCircleProgressPainter and VirtualKeyboardConfig, use the ImpaktfullUi-prefixed names ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* DefaultTheme, TableColumnConfig, CustomBadgeWidget, CommandMenuWindow, InputFieldValidator, PasswordStrengthIndicatorRequirement, CircleProgressPainter, HalfCircleProgressPainter and VirtualKeyboardConfig, use the ImpaktfullUi-prefixed names ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* DefaultTheme, TableColumnConfig, CustomBadgeWidget, CommandMenuWindow, InputFieldValidator, PasswordStrengthIndicatorRequirement, CircleProgressPainter, HalfCircleProgressPainter and VirtualKeyboardConfig, use the ImpaktfullUi-prefixed names ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* DefaultTheme, TableColumnConfig, CustomBadgeWidget, CommandMenuWindow, InputFieldValidator, PasswordStrengthIndicatorRequirement, CircleProgressPainter, HalfCircleProgressPainter and VirtualKeyboardConfig, use the ImpaktfullUi-prefixed names ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* DefaultTheme, TableColumnConfig, CustomBadgeWidget, CommandMenuWindow, InputFieldValidator, PasswordStrengthIndicatorRequirement, CircleProgressPainter, HalfCircleProgressPainter and VirtualKeyboardConfig, use the ImpaktfullUi-prefixed names ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* DefaultTheme, TableColumnConfig, CustomBadgeWidget, CommandMenuWindow, InputFieldValidator, PasswordStrengthIndicatorRequirement, CircleProgressPainter, HalfCircleProgressPainter and VirtualKeyboardConfig, use the ImpaktfullUi-prefixed names ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* imageFile of ImpaktfullUiImageCropCropper.cropImage, use xFile or imageBytes ([003b8e1](https://github.com/impaktfull/flutter_impaktfull_ui/commit/003b8e18f9fa043b4a281d0c4cf001544759aa3f))
* ImpaktfullUiAccordion.onExpandedChanged, use onExpansionChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUIAdaptivePageRoute, use ImpaktfullUiAdaptivePageRoute ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUIAdaptivePageRoute, use ImpaktfullUiAdaptivePageRoute ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUIAdaptivePageRoute, use ImpaktfullUiAdaptivePageRoute ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUIAdaptivePageRoute, use ImpaktfullUiAdaptivePageRoute ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUIAdaptivePageRoute, use ImpaktfullUiAdaptivePageRoute ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* ImpaktfullUIAdaptivePageRoute, use ImpaktfullUiAdaptivePageRoute ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* ImpaktfullUIAdaptivePageRoute, use ImpaktfullUiAdaptivePageRoute ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* ImpaktfullUiAdaptiveScreen.fab, use floatingActionButton ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiAlignment, use ImpaktfullUiDropdownAlignment ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiAlignment, use ImpaktfullUiDropdownAlignment ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiAlignment, use ImpaktfullUiDropdownAlignment ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiAlignment, use ImpaktfullUiDropdownAlignment ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiAlignment, use ImpaktfullUiDropdownAlignment ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* ImpaktfullUiAlignment, use ImpaktfullUiDropdownAlignment ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* ImpaktfullUiAlignment, use ImpaktfullUiDropdownAlignment ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* ImpaktfullUiAutoComplete.replaceWithOverlay, it never had an effect ([4cb7081](https://github.com/impaktfull/flutter_impaktfull_ui/commit/4cb7081138752405d0abe2283f084fee987dc8e4))
* ImpaktfullUiBadge.label, use title ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiBadge.onCloseTap, use onCloseTapped ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiBadgeTextStylesTheme, ImpaktfullUiButtonTextStylesTheme, ImpaktfullUiCmsHeaderTextStylesTheme, ImpaktfullUiHorizontalTabTextStylesTheme, ImpaktfullUiInputFieldTextStylesTheme, ImpaktfullUiListViewTextStylesTheme, ImpaktfullUiSnackyConfiguratorTextStylesTheme, ImpaktfullUiTableHeaderItemTextStylesTheme, ImpaktfullUiTableRowItemTextStylesTheme and ImpaktfullUiTableRowTextStylesTheme, use the *TextStyleTheme names ([0822096](https://github.com/impaktfull/flutter_impaktfull_ui/commit/082209631039150b56ca1a274a737de36ac4a5e9))
* ImpaktfullUiBBForgetPassword.onChangedEmail, use onEmailChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiBBLicenseLocalizations, use ImpaktfullUiBBLicensesLocalizations ([e450523](https://github.com/impaktfull/flutter_impaktfull_ui/commit/e4505235fc1cef5c03a7a64139954c13c32009cc))
* ImpaktfullUiBBLogin.onChangedEmail, use onEmailChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiBBLogin.onChangedPassword, use onPasswordChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiBBRegister.onChangedEmail, use onEmailChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiBBRegister.onChangedPassword, use onPasswordChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiBBVerifyRegisterCode.onChangedVerificationCode, use onCodeChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiBottomNavigationItem.label, use title ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiBottomNavigationItem.showLabel, use showTitle ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiButtonTheme.shadow, use shadows ([0822096](https://github.com/impaktfull/flutter_impaktfull_ui/commit/082209631039150b56ca1a274a737de36ac4a5e9))
* ImpaktfullUiCalendar.onEventTap, use onEventTapped ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiCalendarList.onEventTap, use onEventTapped ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiCalendarWeek.onEventTap, use onEventTapped ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiCarrousel and its themes, use ImpaktfullUiCarousel ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiCarrousel and its themes, use ImpaktfullUiCarousel ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiCarrousel and its themes, use ImpaktfullUiCarousel ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiCarrousel and its themes, use ImpaktfullUiCarousel ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiCarrousel and its themes, use ImpaktfullUiCarousel ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* ImpaktfullUiCarrousel and its themes, use ImpaktfullUiCarousel ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* ImpaktfullUiCarrousel and its themes, use ImpaktfullUiCarousel ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* ImpaktfullUiCheckBox, use ImpaktfullUiCheckbox ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiCheckBox, use ImpaktfullUiCheckbox ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiCheckBox, use ImpaktfullUiCheckbox ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiCheckBox, use ImpaktfullUiCheckbox ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiCheckBox, use ImpaktfullUiCheckbox ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* ImpaktfullUiCheckBox, use ImpaktfullUiCheckbox ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* ImpaktfullUiCheckBox, use ImpaktfullUiCheckbox ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* ImpaktfullUiCheckBox.indermediate and ImpaktfullUiCheckBoxListItem.indermediate, use .indeterminate ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiCheckBox.indermediate and ImpaktfullUiCheckBoxListItem.indermediate, use .indeterminate ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiCheckBox.indermediate and ImpaktfullUiCheckBoxListItem.indermediate, use .indeterminate ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiCheckBox.indermediate and ImpaktfullUiCheckBoxListItem.indermediate, use .indeterminate ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiCheckBox.indermediate and ImpaktfullUiCheckBoxListItem.indermediate, use .indeterminate ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* ImpaktfullUiCheckBox.indermediate and ImpaktfullUiCheckBoxListItem.indermediate, use .indeterminate ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* ImpaktfullUiCheckBox.indermediate and ImpaktfullUiCheckBoxListItem.indermediate, use .indeterminate ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* ImpaktfullUiCheckboxAssetsTheme.indermediate, use indeterminate ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiCheckboxAssetsTheme.indermediate, use indeterminate ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiCheckboxAssetsTheme.indermediate, use indeterminate ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiCheckboxAssetsTheme.indermediate, use indeterminate ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiCheckboxAssetsTheme.indermediate, use indeterminate ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* ImpaktfullUiCheckboxAssetsTheme.indermediate, use indeterminate ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* ImpaktfullUiCheckboxAssetsTheme.indermediate, use indeterminate ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* ImpaktfullUiCheckBoxListItem and its type and themes, use ImpaktfullUiCheckboxListItem ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiCheckBoxListItem and its type and themes, use ImpaktfullUiCheckboxListItem ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiCheckBoxListItem and its type and themes, use ImpaktfullUiCheckboxListItem ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiCheckBoxListItem and its type and themes, use ImpaktfullUiCheckboxListItem ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiCheckBoxListItem and its type and themes, use ImpaktfullUiCheckboxListItem ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* ImpaktfullUiCheckBoxListItem and its type and themes, use ImpaktfullUiCheckboxListItem ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* ImpaktfullUiCheckBoxListItem and its type and themes, use ImpaktfullUiCheckboxListItem ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* ImpaktfullUiColorPicker.onColorChanged, use onChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiColorPicker.onColorChangeEnd, use onChangeEnd ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiCommandMenuWindow.onInputChanged, use onChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiComponentsTheme.carrousel, use carousel ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiComponentsTheme.carrousel, use carousel ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiComponentsTheme.carrousel, use carousel ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiComponentsTheme.carrousel, use carousel ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiComponentsTheme.carrousel, use carousel ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* ImpaktfullUiComponentsTheme.carrousel, use carousel ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* ImpaktfullUiComponentsTheme.carrousel, use carousel ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* ImpaktfullUiComponentsTheme.checkBoxListItem, use checkboxListItem ([0822096](https://github.com/impaktfull/flutter_impaktfull_ui/commit/082209631039150b56ca1a274a737de36ac4a5e9))
* ImpaktfullUiDateInputField.date, use value ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiDateInputField.onDateSelected, use onChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiDropdown.buttonText, use buttonTitle ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiDropdownItem.label, use title ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiDropdownShadowTheme, ImpaktfullUiButtonShadowTheme and ImpaktfullUiAutoCompleteShadowTheme, use the *ShadowsTheme names ([0822096](https://github.com/impaktfull/flutter_impaktfull_ui/commit/082209631039150b56ca1a274a737de36ac4a5e9))
* ImpaktfullUiFloatingActionButton.label, use title ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiGalleryItem.file (constructor and field), use ImpaktfullUiGalleryItem.xFile or ImpaktfullUiGalleryItem.bytes ([003b8e1](https://github.com/impaktfull/flutter_impaktfull_ui/commit/003b8e18f9fa043b4a281d0c4cf001544759aa3f))
* ImpaktfullUiHorizontalTab.label, use title ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiHorizontalTabConfig.label, use title ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiHorizontalTabs.onTabSelected, use onChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiHorizontalTabs.selectedValue, use value ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiImageCropController.cropImageFile, use cropXFile or cropImageBytes ([003b8e1](https://github.com/impaktfull/flutter_impaktfull_ui/commit/003b8e18f9fa043b4a281d0c4cf001544759aa3f))
* ImpaktfullUiInputField.onFocusChanged, use onFocusChange ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiInputField.onSubmit, use onSubmitted ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiInputFieldAction.label, use title ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiListItemType.simpleLisItemType, use simpleListItemType ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiListItemType.simpleLisItemType, use simpleListItemType ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiListItemType.simpleLisItemType, use simpleListItemType ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiListItemType.simpleLisItemType, use simpleListItemType ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiListItemType.simpleLisItemType, use simpleListItemType ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* ImpaktfullUiListItemType.simpleLisItemType, use simpleListItemType ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* ImpaktfullUiListItemType.simpleLisItemType, use simpleListItemType ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* ImpaktfullUiListView.separated(required:) and ImpaktfullUiListView.child(required:), a parameter added by mistake that has no effect ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiLoadingIndicatorAssetTheme, use ImpaktfullUiLoadingIndicatorAssetsTheme ([0822096](https://github.com/impaktfull/flutter_impaktfull_ui/commit/082209631039150b56ca1a274a737de36ac4a5e9))
* ImpaktfullUiMarkdown.onOpenLink, use onLinkTapped ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiModal.primaryActionLabel, use primaryActionTitle ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiModal.primaryActionOnTap, use onPrimaryActionTapped ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiModal.secondaryActionLabel, use secondaryActionTitle ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiModal.secondaryActionOnTap, use onSecondaryActionTapped ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiOptionSelector.selectedValue, use value ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiPagination.onLoadPage, use onPageChanged ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiPasswordStrengthIndicatorAssetsTheme.leadingRequerement(IsMet), use leadingRequirement(IsMet) ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiPasswordStrengthIndicatorAssetsTheme.leadingRequerement(IsMet), use leadingRequirement(IsMet) ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiPasswordStrengthIndicatorAssetsTheme.leadingRequerement(IsMet), use leadingRequirement(IsMet) ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiPasswordStrengthIndicatorAssetsTheme.leadingRequerement(IsMet), use leadingRequirement(IsMet) ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiPasswordStrengthIndicatorAssetsTheme.leadingRequerement(IsMet), use leadingRequirement(IsMet) ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* ImpaktfullUiPasswordStrengthIndicatorAssetsTheme.leadingRequerement(IsMet), use leadingRequirement(IsMet) ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* ImpaktfullUiPasswordStrengthIndicatorAssetsTheme.leadingRequerement(IsMet), use leadingRequirement(IsMet) ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* ImpaktfullUiPinCode.onSubmit, use onSubmitted ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiScreen.fab, use floatingActionButton ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiScreen.fabAlignment and ImpaktfullUiAdaptiveScreen.fabAlignment, use floatingActionButtonAlignment ([445f117](https://github.com/impaktfull/flutter_impaktfull_ui/commit/445f11797254dbe4bf3d802526fd025f8631cda3))
* ImpaktfullUiSegmentedControl.labelBuilder, use titleBuilder ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiTabBarItem.label, use title ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiThemeBuidler, use ImpaktfullUiThemeBuilder ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiThemeBuidler, use ImpaktfullUiThemeBuilder ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiThemeBuidler, use ImpaktfullUiThemeBuilder ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiThemeBuidler, use ImpaktfullUiThemeBuilder ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiThemeBuidler, use ImpaktfullUiThemeBuilder ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* ImpaktfullUiThemeBuidler, use ImpaktfullUiThemeBuilder ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* ImpaktfullUiThemeBuidler, use ImpaktfullUiThemeBuilder ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* ImpaktfullUiTooltipDurationTheme, ImpaktfullUiNotificationBadgeDurationTheme and ImpaktfullUiSidebarNavigationItemDurationTheme, use the *DurationsTheme names ([0822096](https://github.com/impaktfull/flutter_impaktfull_ui/commit/082209631039150b56ca1a274a737de36ac4a5e9))
* ImpaktfullUiTouchFeedback.onLongTap, use onLongPress ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiTouchFeedback.toolTip, use tooltip ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiTouchFeedback.toolTip, use tooltip ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiTouchFeedback.toolTip, use tooltip ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiTouchFeedback.toolTip, use tooltip ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiTouchFeedback.toolTip, use tooltip ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* ImpaktfullUiTouchFeedback.toolTip, use tooltip ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* ImpaktfullUiTouchFeedback.toolTip, use tooltip ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* ImpaktfullUiVirtualKeyboard.onSubmit, use onSubmitted ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiVirtualKeyboardTextEditController.onSubmit, use onSubmitted ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiWysiwyg.text, use value ([6e82804](https://github.com/impaktfull/flutter_impaktfull_ui/commit/6e828048748b2ae50226c34df05df4d0103bb970))
* ImpaktfullUiWysiwygAction.orderdList, use orderedList ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* ImpaktfullUiWysiwygAction.orderdList, use orderedList ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* ImpaktfullUiWysiwygAction.orderdList, use orderedList ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* ImpaktfullUiWysiwygAction.orderdList, use orderedList ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* ImpaktfullUiWysiwygAction.orderdList, use orderedList ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* ImpaktfullUiWysiwygAction.orderdList, use orderedList ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* ImpaktfullUiWysiwygAction.orderdList, use orderedList ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* onChangedInterpediate on ImpaktfullUiCheckbox and ImpaktfullUiCheckboxListItem, use onChangedIndeterminate ([f50801f](https://github.com/impaktfull/flutter_impaktfull_ui/commit/f50801f8352bc59a23bf1d81b7b120aa28028396))
* onChangedInterpediate on ImpaktfullUiCheckbox and ImpaktfullUiCheckboxListItem, use onChangedIndeterminate ([0c43dcf](https://github.com/impaktfull/flutter_impaktfull_ui/commit/0c43dcfffbb3f761e1bfdbb41a353c3876d4d77f))
* onChangedInterpediate on ImpaktfullUiCheckbox and ImpaktfullUiCheckboxListItem, use onChangedIndeterminate ([686673c](https://github.com/impaktfull/flutter_impaktfull_ui/commit/686673c0d0cc455bca8ca5b625adc81d94150f0f))
* onChangedInterpediate on ImpaktfullUiCheckbox and ImpaktfullUiCheckboxListItem, use onChangedIndeterminate ([d55bfea](https://github.com/impaktfull/flutter_impaktfull_ui/commit/d55bfeabcd4dfa6f9b954c35c7d2d5b2526ec9df))
* onChangedInterpediate on ImpaktfullUiCheckbox and ImpaktfullUiCheckboxListItem, use onChangedIndeterminate ([8d84199](https://github.com/impaktfull/flutter_impaktfull_ui/commit/8d841999b9bbb74449b0685a82cba16e86a4b210))
* onChangedInterpediate on ImpaktfullUiCheckbox and ImpaktfullUiCheckboxListItem, use onChangedIndeterminate ([73c9af3](https://github.com/impaktfull/flutter_impaktfull_ui/commit/73c9af3dafb52b0ebf4d6c74972b4c1caca1791d))
* onChangedInterpediate on ImpaktfullUiCheckbox and ImpaktfullUiCheckboxListItem, use onChangedIndeterminate ([16d0468](https://github.com/impaktfull/flutter_impaktfull_ui/commit/16d04688fae5e111420990e659532a48445bd263))
* ResponsiveExtension, use the static helpers of ImpaktfullUiResponsiveLayout ([0822096](https://github.com/impaktfull/flutter_impaktfull_ui/commit/082209631039150b56ca1a274a737de36ac4a5e9))
* TextStyleExtension, use TextStyle.copyWith ([0822096](https://github.com/impaktfull/flutter_impaktfull_ui/commit/082209631039150b56ca1a274a737de36ac4a5e9))
* the global theme and locale getters, setImpaktfullUiTheme, setImpaktfullUiLocale and setImpaktfullUiTestTheme, use ImpaktfullUiTheme.of(context) and Localizations.localeOf(context) ([0822096](https://github.com/impaktfull/flutter_impaktfull_ui/commit/082209631039150b56ca1a274a737de36ac4a5e9))

## 0.79.0

### Feature

- Added `resizeToAvoidBottomInset` parameter to `ImpaktfullUiScreen`

## 0.78.2

### Fix

- `borderRadius` now uses `borderRadius` instead of `borderRadiusSmall` for the `withMinimalChanges` constructor

## 0.78.1

### Fix

- `ImpaktfullUiBadge` now correctly handles the `onTap` callback

## 0.77.0 - 0.78.0

### Feature

- Added `ImpaktfullUiApp.of` to check if an app is available in the context
- Added `ImpaktfullUiApp.maybeOf` to check if an app is available in the context
- Added `ImpaktfullUiTheme.maybeOf` to check if a theme is available in the context

## 0.76.3

### Chore

- Removed `ComponentDescriptorMixin` and all `describe` functionality from components
- Removed 93 `.describe.dart` part files
- Updated CLAUDE skills documentation
- Updated README.md component list with all current components

## 0.76.1 - 0.76.2

### Chore

- Added CLAUDE.md with development guidelines

## 0.76.0

### Feature

- Added `theme` parameter to `ImpaktfullUiBottomSheet.show` and `ImpaktfullUiBottomSheet.showSimple`

### Feature

- Added `backgroundColor` to `ImpaktfullUiRefreshIndicatorTheme`

## 0.74.0

### Feature

- `ImpaktfullUiGridView` now accepts a `ScrollController`

## 0.73.1

### Fix

- `ImpaktfullUiGridView` now correctly handles the padding & scroll physics

## 0.73.0

### Feature

- Added `localizations` to `ImpaktfullUiGridView`
- Added `onRefresh` to `ImpaktfullUiGridView`

## 0.72.0

### Feature

- Added `textPadding` to `ImpaktfullUiNotificationBadgeTheme`

## 0.71.2

### Fix

- `ImpaktfullUiCard` now correctly handles the focus color when using `tab`

## 0.71.1

### Fix

- `ImpaktfullUiTimePicker` now correctly formats the time

## 0.71.0

### Feature

- Added `width` to `ImpaktfullUiProgressIndicator`
- Added `strokeWidth` to `ImpaktfullUiLoadingIndicator`

## 0.70.1

### Fix

- `ImpaktfullUiColorInputField` now correctly handles the `onChanged`

## 0.70.0

### Feature

- Added labelMargin to the styling of `ImpaktfullUiTimePicker`

## 0.69.0

### Feature

- Added `step` to `ImpaktfullUiNumberInput`

## 0.68.0

### Feature

- `intl` version bump to 0.20.2

## 0.67.1

### Fix

- `ImpaktfullUiIconButton` color override
- `ImpaktfullUiMarkdown` deprecation warning

## 0.67.0

### Feature

- Added `borderWidth` to `ImpaktfullUiBadgeTheme`
- Added `borderWidth` to `ImpaktfullUiModalTheme`

## 0.66.1

### Fix

- `ImpaktfullUiCard` now correctly handles the border width

## 0.66.0

### Feature

- Added `borderWidth` to `ImpaktfullUiCardTheme`

## 0.65.0

### Feature

- Added `tooltip` to `ImpaktfullUiButton`

## 0.64.0

### Feature

- Add support for thickness of a divider

## 0.63.1

### Fix

- Border width buttons should stay on 1 in default theme

## 0.63.0

### Feature

- Added support for Raised buttons in the `ImpaktfullUiButton`
- Added extra theme in the example to show the raised buttons

### Fix

- Theming copy bug
- Impaktfull to impaktfull

## 0.62.0

### Feature

- Added `customTheme` to `ImpaktfullUiTheme.getDefault` to allow customizing the theme

## 0.61.2

### Fix

- `ImpaktfullUiLocalizations` fix to get `ImpaktfullUiBBLoginLocalizations`

## 0.61.1

### Fix

- `ImpaktfullUiGridView` fix padding

## 0.61.0

### Feature (Breaking)

- Added `placeholderData` to `ImpaktfullUiGridView` (now `noDataLabel` is deprecated)
- Added `placeholderData` to `ImpaktfullUiListView.separated` (now `noDataLabel` is deprecated)
- Added `isLoading` to `ImpaktfullUiGridView`

## 0.60.0

### Feature (might be breaking)

- Added `textSecondary` & `textTertiary` to `ImpaktfullUiColorTheme`
- Changed `onCanvasSecondary` & `onCardSecondary` to use `textSecondary`
- Changed `onCanvasTertiary` & `onCardTertiary` to use `textTertiary`

## 0.59.0

### Feature

- Export `ImpaktfullUiThemeComponentBuilder`

## 0.58.0

### Feat

- Use `textCapitalization` & `inputFormatters` in `ImpaktfullUiInputField`

## 0.57.1

### Fix

- Use `ImpaktfullUiInputFieldValidatorResult` instead od `InputFieldValidatorResult`

## 0.57.0

### Feature

- Added `validator` to `ImpaktfullUiInputField` to validate the input field
- Added `autocorrect` to `ImpaktfullUiInputField` to enable/disable autocorrect

## 0.56.0

### Feature

- Added support for overriding the components
- Added `ImpaktfullUiOverridableComponentBuilder` to override the components
- Added `ImpaktfullUiOverridableComponentConfigurator` to configure the override components
- Added `overrideComponents` to `ImpaktfullUiApp` to override the components in the `ImpaktfullUiOverridableComponentConfigurator`

### Fix

- Use deploy keys in GitHub Actions

## 0.55.1

### Fix

- Alchemist update

## 0.55.0

### Feature

- Added `ImpaktfullUiCheckBoxListItem` to handle check box list items

### Fix

- ImpaktfullUiCheckBoxListItem now correctly handles the `onChanged` & `onChangedInterpediate`

## 0.54.0

### Feature

- Correct use of sizes in the `ListItem` widgets

## 0.53.0

### Feature

- Added `ImpaktfullUiStatusBar` to control the status bar color & style

## 0.52.0

### Feature

- Added `labelMargin` to ImpaktfullUiInputFieldTheme

## 0.51.0

### Feature

- When tapping outside (on the screen) the keyboard will be closed (this tap gesture is excluded from the semantics tree)

## 0.50.1

### Fix

- ImpaktfullUiPlaceholder `assetBuilder` now correctly handles the asset

## 0.50.0

### Feature

- Added `routeSettings` to ImpaktfullUiBottomSheet & ImpaktfullUiModal

## 0.49.2

### Fix

- Use the `asset` from the `ImpaktfullUiListViewPlaceholderData` in the `ImpaktfullUiListView`

## 0.49.1

### Fix

- ImpaktfullUiListViewPlaceholderData `showRefreshBtn` default is now `true`

## 0.49.0

### Feat (Breaking)

- Renamed `ImpaktfullUiPlaceholderState` to `ImpaktfullUiPlaceholder`
- Renamed `ImpaktfullUiPlaceholderStateTheme` to `ImpaktfullUiPlaceholderTheme`
- Added `ImpaktfullUiListViewPlaceholderData` to handle the placeholder data for the ImpaktfullUiListView
- Removed `noDataLabel` & `refreshBtnLabel` from ImpaktfullUiListView (use `placeholderData` instead)

## 0.48.2

### Fix

- Export all ImpaktfullUiLocalizations

## 0.48.1

### Fix

- Set default ImpaktfullUiLocalizations
- Export `ImpaktfullUiLocalizations`
- Validate on T correctly for ImpaktfullUiLocalizations

## 0.48.0

### Feat (Breaking)

- Move localizations to its own configurator & override it on the app itself or on component level

## 0.47.2

### Fix

- ImpaktfullUiBBLogin incorrect localization

## 0.47.1

### Fix

- ImpaktfullUiBBLogin to use localizations everywhere

## 0.47.0

### Feat

- Added ImpaktfullUiLicenseLocalizations to allow customizing the licenses screen
- Added ImpaktfullUiLoginLocalizations to allow customizing the login screen

## 0.46.4

### Fix

- ImpaktfullUiNumberInput now correctly handles the min & max values

## 0.46.3

### Fix

- ImpaktfullUiNumberInput text controller was now correctly initialized

## 0.46.2

### Fix

- ImpaktfullUiNumberInput is validated with regex validation on allowed int & double values

## 0.46.0 - 0.46.1

### Feat

- Added double support to ImpaktfullUiNumberInput

## 0.45.1

### Fix

- Sidebar navigation padding

## 0.45.0

### Feat

- Added extra color picker to ImpaktfullUiColorInputField

## 0.44.0

### Feat

- Added ImpaktfullUiColorInputField

## 0.43.3

### Fix

- Remove unused code

## 0.43.2

### Fix

- ImpaktfullUiButton disabled state

## 0.43.1

### Fix

- ImpaktfullUiNavBarSmallLoadingWrapper color

## 0.43.0

### Feat

- Added ImpaktfullUiAdaptiveNavBarActionItem `onAsyncTap` to handle async actions

### Fix

- ImpaktfullUiNavBarSmallLoadingWrapper correct color
- ImpaktfullUiNavBarSmallLoadingWrapper now correctly handles the loading state

## 0.42.0

### Feat

- Added ImpaktfullUiApp `onGenerateInitialRoutes` to generate initial routes

## 0.41.4

### Fix

- Deprecated color methods
- Button not clickable when loading
- Bottom navbar child adding padding

## 0.41.3

### Fix

- Fixed the ImpaktfullUiModal.simple actions order

## 0.41.2

### Fix

- Fixed the size of the asset widget

## 0.41.1

### Fix

- Fixed the modal actions orientation

## 0.41.0

### Feat

- Added ImpaktfullUiModal.simple with basic strings & actions

## 0.40.0

### Feat

- Added `triggerMode` to ImpaktfullUiTooltip

## 0.39.0

### Feat

- Added notificationBadge support to ImpaktfullUiIconButton

## 0.38.1 - 0.38.5

### Fix

- Github pages upload

## 0.38.0

### Feat

- Added `leadingBuilder` & `trailingBuilder` to ImpaktfullUiListView

## 0.37.0

### Fix

- ImpaktfullUiListView make `useSafeArea` configurable

## 0.36.0

### Feat

- Added `width` to ImpaktfullUiLineProgressIndicator

## 0.35.0

### Feat

- Added `animate` to ImpaktfullUiProgressIndicator

## 0.34.1

### Fix

- ImpaktfullUiSidebarNavigationItem now correctly handles the selected state

## 0.34.0

### Feat

- Added `trailingWidgetBuilder` to ImpaktfullUiAccordion

## 0.33.0

### Feat

- Added `useSafeArea` to ImpaktfullUiBottomSheet
- Added `padding` to ImpaktfullUiBottomSheet

## 0.32.0

### Feat

- Added `isLoading` to ImpaktfullUiTable

## 0.31.0

### Feat

- Added `isLoading` to ImpaktfullUiTable

## 0.30.1

### Fix

- ImpaktfullUiPagination now correctly handles the amount of pages

## 0.30.0

### Feat

- Added `selectedAsset` to ImpaktfullUiBottomNavigationItem

## 0.29.0

### Feat

- Starting to add `copyWith` methods to the themes: TmpaktfullUiButton & ImpaktfullUiInputField for now

## 0.28.1

### Fix

- ImpaktfullUiInputField now correctly handles the focus (removed duplicate events)

## 0.28.0

### Feat

- Added ImpaktfullUiTouchFeedback `focusNode` to control if the touch feedback can request focus

## 0.27.0

### Feat

- Added ImpaktfullUiIconButton `canRequestFocus` to control if the icon button can request focus
- Added ImpaktfullUiButton `canRequestFocus` to control if the button can request focus

## 0.26.0

### Feat

- Added ImpaktfullUiInputField `trailingInputActions` to add actions to the input field

## 0.25.0

### Feat

- Added ImpaktfullUiTouchFeedback `onDoubleTap` & `onLongTap` to handle double tap & long tap events

## 0.24.0

### Feat

- Added ImpaktfullUiInputField `obscureText` to show a password hide/show icon
- Animated ImpaktfullUiPasswordStrengthIndicator colors
- Added ImpaktfullUiVirtualKeyboard `obscureText` to show a password hide/show icon

### Fix

- ImpaktfullUiVirtualKeyboard now handles the shift keys correctly (tap to activate, deactivated by taping again or using another normal key)

## 0.23.2

### Fix

- ImpaktfullUiPasswordStrengthIndicator use a leading asset if provided

## 0.23.1

### Breaking

- ImpaktfullUiPasswordStrengthIndicator now using PasswordStrengthIndicatorRequirement instead of string

## 0.23.0

### Feat

- Added ImpaktfullUiPasswordStrengthIndicator

## 0.22.0

### Feat

- Added margin to ImpaktfullUiPlaceholderState & ImpaktfullUiPlaceholderStateTheme

## 0.21.8

### Fix

- License update to 2025

## 0.21.7

### Fix

- ImpaktfullUiNavBar padding is now based on leading & trailing actions instead of isFullScreen

## 0.21.6

### Fix

- ImpaktfullUiScreen should consider the safearea padding when adding the fab

## 0.21.5

### Fix

- ImpaktfullUiBottomNavigation make removing the top padding configurable

## 0.21.4

### Fix

- ImpaktfullUiBottomNavigation make removing the top padding configurable

## 0.21.3

### Fix

- Cleanup of the ImpaktfullUiBottomNavigation by removing the top padding config

## 0.21.2

### Fix

- Fix the removal of the padding on the ImpaktfullUiScreen when using a bottom child

## 0.21.1

### Fix

- Fixed the cursor color of the ImpaktfullUiInputField

## 0.21.0

### Feat

- Added ImpaktfullUiBottomActions

## 0.20.0

### Feat

- Added ImpaktfullUiTheme `fontFamilyDisplay` & `fontFamilyText` to set the font family for the display & text

## 0.19.1

### Fix

- Fix the ImpaktfullUiScreen to expose `centerTitle` to the ImpaktfullUiNavBar

## 0.19.0

### Feat

- Added ImpaktfullUiNavBar `centerTitle` to center the title when there are actions

## 0.18.1

### Fix

- Fix the safe area padding when using the ImpaktfullUiAdaptiveScreen

## 0.18.0

### Feat

- Added ImpaktfullUiSwitch `verticalPadding` & `horizontalPadding` to control the padding of the switch

## 0.17.1

### Fix

- Make sure the customTheme is not null when calling the getter to simplify the usage of the custom theme

## 0.17.0

### Feat

- Added ImpaktfullUiTheme.customTheme to allow custom themes (through generics so it can be anything you want)

## 0.16.1

### Fix

- ImpaktfullUiBottomNavigation now has a center alignment

## 0.16.0

### Feat

- Added ImpaktfullUiListItem.trailing asset

## 0.15.0

### Feat

- Added ImpaktfullUiPathRouteObserver to log the routes

## 0.14.1

### Fix

- Fixed the package name in the theme use `impaktfull_ui` instead of `impaktfull_ui_2`

## 0.14.0

### Feat

- Added ImpaktfullDateInputField

## 0.13.0

### Feat

- Added ImpaktfullStatusBar

### Version bump

- Version bump figma sync

## 0.12.0

### !!!BREAKING!!!

- We refactored a lot of components to make them more flexible & customizable
- We changed the prefix from impaktfull to ImpaktfukllUi
- Because this is a pre stable release we don't have a migration guide
- If the previous version was working for you just pin it to 0.11.3

## 0.11.3

### Fix

- License
- Version bump snacky

## 0.11.2

### Fix

- Fixed changelog

## 0.11.1

### Fix

- Fixed changelog

## 0.11.0

### Feat

- Added a ThemeConfiguratorWidget so you don't always need to use the ImpaktfullApp

## 0.10.2

### Fix

- export the theme_configurator.dart file

## 0.10.1

### Fix

- version bump dependencies

## 0.10.0

### Feat

- ImpaktfullDialog now has loading states for the actions
- ImpaktfullLoadingIndicator now has a `color` parameter

## 0.9.0

### Breaking

- Support for Flutter 3.22.x
- intl updated to 0.19.0

## 0.8.0

### Breaking

- ImpaktfullCheckBox custom theme

### Feat

- ImpaktfullTheme added components & checkbox theme
- ImpaktfullCheckboxListItem

## 0.7.0

### Feat

- ImpaktfullInputField cursor color
- ImpaktfullSimpleListItem crossAxisAlignment

## 0.6.0

### Feat

- ImpaktfullBottomNavigationItem added `badgeColor` & `badgeBorderRadius`

### Fix

- ImpaktfullBottomNavigationItem use correct collor when item is selected

## 0.5.3

### Fix

- ImpaktfullScreen unfocus when tapped outside

## 0.5.2

### Fix

- ImpaktfullNavBarAction can now use the default color of the svg

## 0.5.1

### Fix

- ImpaktfullBottomSheet with listview instead of vertical autolayout

## 0.5.0

### Breaking

- ImpaktfullListView all builders now have an `index` parameter

### Feat

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

### Fix

- allowEnterRouteSnapping on an ZoomPageTransitionsBuilder: snapping is now disabled by default on Android
- ImpaktfullButton only show shaddow if `type` not `secondary`

## 0.4.0

### Feat

- Override color of ImpaktfullBadge
- ImpaktfullSimpleListItem expose (backgroundColor, titleStyle, subTitleStyle)

## 0.3.0

### Feat

- Added ImpaktfullBottomSheetItem
- Added ImpaktfullSeparatedColumn clip option to check if items should be clipped with the global border radius (mostly used with bottom sheet items)
- Added ImpaktfullBadge to show a badge with a number or other text
- Added ImpaktfullTopNavBar as a basic component (alpha)
- ImpaktfullBottomNavigationItem supports adding a badge

### Fix

- ImpaktfullSwitch accessibility
- ImpaktfullCheckBox hover state
- ImpaktfullBottomNavigation no supports different kind of "items" not only ImpaktfullBottomNavigationItem
- ImpaktfullInputField cleanup on the spacing of the field itself

### Example

- Bottonm sheet example improvements

## 0.2.1

### Fix

- ListView empty state correctly aligned (center)

## 0.2.0

### Feat

- Added universal_io as a dependency to support web & desktop & exported it by default

## 0.1.0

### Feat

- Added support for setting target platform

## 0.0.34

### Fix

- Separated column uses correct border radius again

## 0.0.33

### Update

- Updated readme with disclaimer everything under <1.0.0 should not be used unless you want to test it

## 0.0.32

### Breaking

- ImpaktfullDialog `isPrimaryDange` => `primaryButtonType = ImpaktfullDialogPrimaryButtonType.danger`

### Feat

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

### Fix

- ImpaktfullNavBarAction use correct color for the icon

## 0.0.31

### Feat

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

### Fix

- ImpaktfullAutoLayout removed padding & backgroundColor

## 0.0.30

### Feat

- ImpaktfullInputField has a title

### Docs

- Updated readme

## 0.0.29

### Feat

- `extraPadding` added to ImpaktfullListView

## 0.0.28

### Feat

- Added `margin` & `padding` to the ImpaktfullCard

## 0.0.27

### Fix

- ImpaktfullSwitch & ImpaktfullCheckbox with the turned off state (accent1TurnedOffState)

## 0.0.26

### Feat

- Check if leadingAsset is an icon or an image so a color should be a applied or not (on ImpaktfullListItem & ImpaktfullSelectableListItem)

## 0.0.25

### Feat

- ImpaktfullTheme added `listViewTitleHorizontalPadding` && `listViewTitleVerticalPadding` to better control the padding of the title in the ImpaktfullListView

## 0.0.24

### Feat

- ImpaktfullCard has now an `onTap` parameter

## 0.0.23

### Feat

- ImpaktfullTheme expose the defaultSplashFactory
- RTL & LTR support for ImpaktfullApp (detection by the locale param)

## 0.0.22

### Feat

- ImpaktfullApp now exposes `snackyController` to set a custom snackyController

## 0.0.21

### Feat

- ImpaktfullApp now exposes `snackyBuilder` to set a custom snakcyBuilder

## 0.0.20

### Feat

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

### Fix

- ImpaktfullDatePicker now uses the borderRadius from the theme
- Small disposed errors in ImpaktfullListItem

## 0.0.18 - 0.0.19

### Fix

- Snacky config to use the correct colors

## 0.0.17

### Feat

- Added ImpaktfullRadioButtonListItem

## 0.0.16

### Fix

- Version bump intl

## 0.0.15

### Feat

- Added ImpaktfullDateTimePickerDialog
- Added ImpaktfullDateTimeRangePicker
- Added ImpaktfullDialog

## 0.0.14

### Feat

- Added ImpaktfullRadioButton
- Added ImpaktfullDatePicker
- Added ImpaktfullTimePicker
- Added ImpaktfullCheckbox
- Added ImpaktfullDateTimePicker
- Added borderWidth to ImpaktfullTheme.ImpaktfullDimens

### Fix

- ImpaktfullSwitchListItem removed isSelected

## 0.0.13

### Fix

- Bug in ImpaktfullListItem where trailing widget was not shown correctly

## 0.0.12

### Feat

- ImpaktfullSwitch & ImpaktfullSwitchListItem added

## 0.0.11

### Fix

- Assets not loading in Android

## 0.0.10

### Fix

- SvgIcon pixelated (because of flutter_svg/Impeller bug)

## 0.0.9

### Fix

- Documentation
- obscureText on ImpaktfullInputField

## 0.0.8

### Fix

- ImpaktfullNavBar height & moved to a new component

## 0.0.7

### Feat

- ImpaktfullTabBar & ImpaktfullTabBarItem added

## 0.0.6

### Feat

- ImpaktfullInputField added

## 0.0.5

### Feat

- ImpaktfullBottomNavigationItem & ImpaktfullBottomNavigation added

## 0.0.4

### Fix

- ImpaktfullApp fixed required home widget (now optional)
- ImpaktfullApp fixed has now the option to override the material themeing

## 0.0.3

### Feat

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

### Refactor

- Some onCard is now onCardPrimary and we added onCardSecondary

## 0.0.2

### Feat

- Github actions for CI/CD

## 0.0.1

### Feat

- Initial release
