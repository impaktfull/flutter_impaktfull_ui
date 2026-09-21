import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/localization/localization_configurator.dart';

abstract class ImpaktfullUiCoreLocalizations {
  const ImpaktfullUiCoreLocalizations();
}

abstract class ImpaktfullUiComponentLocalizations
    extends ImpaktfullUiCoreLocalizations {
  const ImpaktfullUiComponentLocalizations();
}

abstract class ImpaktfullUiBBLocalizations
    extends ImpaktfullUiCoreLocalizations {
  const ImpaktfullUiBBLocalizations();
}

/// All texts of the components and building blocks.
///
/// Pass it to `ImpaktfullUiApp(localizations: ...)` to translate the library
/// for the whole app. Every component with texts also has a `localizations`
/// parameter to override them for one widget. The defaults are English.
class ImpaktfullUiLocalizations {
  // Building blocks
  final ImpaktfullUiBBForgetPasswordLocalizations bbForgetPassword;
  final ImpaktfullUiBBLicensesLocalizations bbLicenses;
  final ImpaktfullUiBBLoginLocalizations bbLogin;
  final ImpaktfullUiBBNotFoundLocalizations bbNotFound;
  final ImpaktfullUiBBRegisterLocalizations bbRegister;
  final ImpaktfullUiBBVerifyRegisterCodeLocalizations bbVerifyRegisterCode;

  // Components
  final ImpaktfullUiCalendarLocalizations calendar;
  final ImpaktfullUiChatLocalizations chat;
  final ImpaktfullUiCmsHeaderLocalizations cmsHeader;
  final ImpaktfullUiColorInputFieldLocalizations colorInputField;
  final ImpaktfullUiDatePickerLocalizations datePicker;
  final ImpaktfullUiDateTimePickerLocalizations dateTimePicker;
  final ImpaktfullUiFilePickerLocalizations filePicker;
  final ImpaktfullUiGalleryLocalizations gallery;
  final ImpaktfullUiGridViewLocalizations gridView;
  final ImpaktfullUiListViewLocalizations listView;
  final ImpaktfullUiMasterDetailLocalizations masterDetail;
  final ImpaktfullUiNavBarLocalizations navBar;
  final ImpaktfullUiOptionSelectorLocalizations optionSelector;
  final ImpaktfullUiPaginationLocalizations pagination;
  final ImpaktfullUiWysiwygLocalizations wysiwyg;

  const ImpaktfullUiLocalizations({
    this.bbForgetPassword = const ImpaktfullUiBBForgetPasswordLocalizations(),
    this.bbLicenses = const ImpaktfullUiBBLicensesLocalizations(),
    this.bbLogin = const ImpaktfullUiBBLoginLocalizations(),
    this.bbNotFound = const ImpaktfullUiBBNotFoundLocalizations(),
    this.bbRegister = const ImpaktfullUiBBRegisterLocalizations(),
    this.bbVerifyRegisterCode =
        const ImpaktfullUiBBVerifyRegisterCodeLocalizations(),
    this.calendar = const ImpaktfullUiCalendarLocalizations(),
    this.chat = const ImpaktfullUiChatLocalizations(),
    this.cmsHeader = const ImpaktfullUiCmsHeaderLocalizations(),
    this.colorInputField = const ImpaktfullUiColorInputFieldLocalizations(),
    this.datePicker = const ImpaktfullUiDatePickerLocalizations(),
    this.dateTimePicker = const ImpaktfullUiDateTimePickerLocalizations(),
    this.filePicker = const ImpaktfullUiFilePickerLocalizations(),
    this.gallery = const ImpaktfullUiGalleryLocalizations(),
    this.gridView = const ImpaktfullUiGridViewLocalizations(),
    this.listView = const ImpaktfullUiListViewLocalizations(),
    this.masterDetail = const ImpaktfullUiMasterDetailLocalizations(),
    this.navBar = const ImpaktfullUiNavBarLocalizations(),
    this.optionSelector = const ImpaktfullUiOptionSelectorLocalizations(),
    this.pagination = const ImpaktfullUiPaginationLocalizations(),
    this.wysiwyg = const ImpaktfullUiWysiwygLocalizations(),
  });

  /// The localizations of the closest `ImpaktfullUiApp`, or the English
  /// defaults when there is none.
  static ImpaktfullUiLocalizations ofApp(BuildContext context) =>
      ImpaktfullUiLocalizationConfigurator.maybeOf(context)?.localizations ??
      const ImpaktfullUiLocalizations();

  static T of<T extends ImpaktfullUiCoreLocalizations>(BuildContext context) {
    final localization = ofApp(context);
    if (T == ImpaktfullUiNavBarLocalizations) {
      return localization.navBar as T;
    } else if (T == ImpaktfullUiBBLoginLocalizations) {
      return localization.bbLogin as T;
    } else if (T == ImpaktfullUiBBLicensesLocalizations) {
      return localization.bbLicenses as T;
    } else if (T == ImpaktfullUiBBForgetPasswordLocalizations) {
      return localization.bbForgetPassword as T;
    } else if (T == ImpaktfullUiBBNotFoundLocalizations) {
      return localization.bbNotFound as T;
    } else if (T == ImpaktfullUiBBRegisterLocalizations) {
      return localization.bbRegister as T;
    } else if (T == ImpaktfullUiBBVerifyRegisterCodeLocalizations) {
      return localization.bbVerifyRegisterCode as T;
    } else if (T == ImpaktfullUiListViewLocalizations) {
      return localization.listView as T;
    } else if (T == ImpaktfullUiGridViewLocalizations) {
      return localization.gridView as T;
    } else if (T == ImpaktfullUiCalendarLocalizations) {
      return localization.calendar as T;
    } else if (T == ImpaktfullUiChatLocalizations) {
      return localization.chat as T;
    } else if (T == ImpaktfullUiCmsHeaderLocalizations) {
      return localization.cmsHeader as T;
    } else if (T == ImpaktfullUiColorInputFieldLocalizations) {
      return localization.colorInputField as T;
    } else if (T == ImpaktfullUiDatePickerLocalizations) {
      return localization.datePicker as T;
    } else if (T == ImpaktfullUiDateTimePickerLocalizations) {
      return localization.dateTimePicker as T;
    } else if (T == ImpaktfullUiFilePickerLocalizations) {
      return localization.filePicker as T;
    } else if (T == ImpaktfullUiGalleryLocalizations) {
      return localization.gallery as T;
    } else if (T == ImpaktfullUiMasterDetailLocalizations) {
      return localization.masterDetail as T;
    } else if (T == ImpaktfullUiOptionSelectorLocalizations) {
      return localization.optionSelector as T;
    } else if (T == ImpaktfullUiPaginationLocalizations) {
      return localization.pagination as T;
    } else if (T == ImpaktfullUiWysiwygLocalizations) {
      return localization.wysiwyg as T;
    } else {
      throw Exception('Localization $T not found');
    }
  }

  ImpaktfullUiLocalizations copyWith({
    ImpaktfullUiBBForgetPasswordLocalizations? bbForgetPassword,
    ImpaktfullUiBBLicensesLocalizations? bbLicenses,
    ImpaktfullUiBBLoginLocalizations? bbLogin,
    ImpaktfullUiBBNotFoundLocalizations? bbNotFound,
    ImpaktfullUiBBRegisterLocalizations? bbRegister,
    ImpaktfullUiBBVerifyRegisterCodeLocalizations? bbVerifyRegisterCode,
    ImpaktfullUiCalendarLocalizations? calendar,
    ImpaktfullUiChatLocalizations? chat,
    ImpaktfullUiCmsHeaderLocalizations? cmsHeader,
    ImpaktfullUiColorInputFieldLocalizations? colorInputField,
    ImpaktfullUiDatePickerLocalizations? datePicker,
    ImpaktfullUiDateTimePickerLocalizations? dateTimePicker,
    ImpaktfullUiFilePickerLocalizations? filePicker,
    ImpaktfullUiGalleryLocalizations? gallery,
    ImpaktfullUiGridViewLocalizations? gridView,
    ImpaktfullUiListViewLocalizations? listView,
    ImpaktfullUiMasterDetailLocalizations? masterDetail,
    ImpaktfullUiNavBarLocalizations? navBar,
    ImpaktfullUiOptionSelectorLocalizations? optionSelector,
    ImpaktfullUiPaginationLocalizations? pagination,
    ImpaktfullUiWysiwygLocalizations? wysiwyg,
  }) =>
      ImpaktfullUiLocalizations(
        bbForgetPassword: bbForgetPassword ?? this.bbForgetPassword,
        bbLicenses: bbLicenses ?? this.bbLicenses,
        bbLogin: bbLogin ?? this.bbLogin,
        bbNotFound: bbNotFound ?? this.bbNotFound,
        bbRegister: bbRegister ?? this.bbRegister,
        bbVerifyRegisterCode: bbVerifyRegisterCode ?? this.bbVerifyRegisterCode,
        calendar: calendar ?? this.calendar,
        chat: chat ?? this.chat,
        cmsHeader: cmsHeader ?? this.cmsHeader,
        colorInputField: colorInputField ?? this.colorInputField,
        datePicker: datePicker ?? this.datePicker,
        dateTimePicker: dateTimePicker ?? this.dateTimePicker,
        filePicker: filePicker ?? this.filePicker,
        gallery: gallery ?? this.gallery,
        gridView: gridView ?? this.gridView,
        listView: listView ?? this.listView,
        masterDetail: masterDetail ?? this.masterDetail,
        navBar: navBar ?? this.navBar,
        optionSelector: optionSelector ?? this.optionSelector,
        pagination: pagination ?? this.pagination,
        wysiwyg: wysiwyg ?? this.wysiwyg,
      );
}
