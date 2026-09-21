// Every deprecated name with a data-driven fix in lib/fix_data.yaml.
// `dart fix --compare-to-golden` (run from this folder) applies the fixes to
// this file and compares the result with deprecated_names.dart.expect.
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

void main() {
  // Renamed classes
  ImpaktfullUiCarrousel? carousel;
  ImpaktfullUiCarrouselTheme? carouselTheme;
  ImpaktfullUiCarrouselAssetsTheme? carouselAssetsTheme;
  ImpaktfullUiCarrouselColorTheme? carouselColorTheme;
  ImpaktfullUiCarrouselDimensTheme? carouselDimensTheme;
  ImpaktfullUiCarrouselTextStyleTheme? carouselTextStyleTheme;
  ImpaktfullUiCheckBoxListItemType? checkboxListItemType;
  ImpaktfullUiCheckBoxListItemTheme? checkboxListItemTheme;
  ImpaktfullUiCheckBoxListItemAssetsTheme? checkboxListItemAssetsTheme;
  ImpaktfullUiCheckBoxListItemColorTheme? checkboxListItemColorTheme;
  ImpaktfullUiCheckBoxListItemDimensTheme? checkboxListItemDimensTheme;
  ImpaktfullUiCheckBoxListItemTextStyleTheme? checkboxListItemTextStyleTheme;
  ImpaktfullUiThemeBuidler? themeBuilder;
  ImpaktfullUiAlignment? alignment;
  DefaultTheme? defaultTheme;
  CustomBadgeWidget? customBadgeWidget;
  CommandMenuWindow? commandMenuWindow;
  InputFieldValidator? inputFieldValidator;
  CircleProgressPainter? circleProgressPainter;
  HalfCircleProgressPainter? halfCircleProgressPainter;
  VirtualKeyboardConfig? virtualKeyboardConfig;
  ImpaktfullUiBBLicenseLocalizations? bbLicensesLocalizations;
  ImpaktfullUIAdaptivePageRoute.create<void>(
      builder: (context) => const SizedBox());
  const TableColumnConfig(flex: 1);
  const PasswordStrengthIndicatorRequirement(requirement: '', isMet: true);

  // Renamed constructors, called through the old and the new class name
  ImpaktfullUiCheckBox(value: true, onChanged: (_) {});
  final checkbox =
      ImpaktfullUiCheckBox.indermediate(value: null, onChanged: (_) {});
  ImpaktfullUiCheckbox.indermediate(value: null, onChanged: (_) {});
  final checkboxListItem = ImpaktfullUiCheckBoxListItem.indermediate(
      title: '', value: null, onChanged: (_) {});
  ImpaktfullUiCheckboxListItem.indermediate(
      title: '', value: null, onChanged: (_) {});

  // Renamed getters, fields and enum values
  checkbox.onChangedInterpediate;
  checkboxListItem.onChangedInterpediate;
  const checkboxAssets = ImpaktfullUiCheckboxAssetsTheme(
      check: ImpaktfullUiAsset.icon(IconData(0)),
      indermediate: ImpaktfullUiAsset.icon(IconData(0)));
  checkboxAssets.indermediate;
  checkboxAssets.copyWith(
      indermediate: const ImpaktfullUiAsset.icon(IconData(0)));
  const passwordAssets = ImpaktfullUiPasswordStrengthIndicatorAssetsTheme(
      leadingRequerement: null, leadingRequerementIsMet: null);
  passwordAssets.leadingRequerement;
  passwordAssets.leadingRequerementIsMet;
  final components = ImpaktfullUiTheme.getDefault().components;
  components.carrousel;
  components.copyWith(carrousel: components.carrousel);
  final touchFeedback = ImpaktfullUiTouchFeedback(
      onTap: null, toolTip: '', child: const SizedBox());
  touchFeedback.toolTip;
  ImpaktfullUiListItemType.neutral.simpleLisItemType;
  ImpaktfullUiWysiwygAction.orderdList;
  const ImpaktfullUiScreen(
      fabAlignment: Alignment.bottomLeft, child: SizedBox());
  ImpaktfullUiAdaptiveScreen(
      fabAlignment: Alignment.bottomLeft,
      builder: (context) => const SizedBox());

  debugPrint([
    carousel,
    carouselTheme,
    carouselAssetsTheme,
    carouselColorTheme,
    carouselDimensTheme,
    carouselTextStyleTheme,
    checkboxListItemType,
    checkboxListItemTheme,
    checkboxListItemAssetsTheme,
    checkboxListItemColorTheme,
    checkboxListItemDimensTheme,
    checkboxListItemTextStyleTheme,
    themeBuilder,
    alignment,
    defaultTheme,
    customBadgeWidget,
    commandMenuWindow,
    inputFieldValidator,
    circleProgressPainter,
    halfCircleProgressPainter,
    virtualKeyboardConfig,
    bbLicensesLocalizations,
  ].toString());
}
