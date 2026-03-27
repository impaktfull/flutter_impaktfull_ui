// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// UiPlaygroundAggregatingGenerator
// **************************************************************************

// ignore_for_file: implementation_imports, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:ui_playground/ui_playground.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';

// **************************************************************************
// GeneratedUiPlaygroundComponents
// **************************************************************************

class GeneratedUiPlaygroundComponents {
  GeneratedUiPlaygroundComponents._();

  static List<UiPlaygroundItem> get items => [
        ImpaktfullUiButtonPlaygroundItem(),
      ];
}

// **************************************************************************
// ImpaktfullUiButton
// **************************************************************************

class ImpaktfullUiButtonPlaygroundItem extends UiPlaygroundItem {
  @override
  String get title => 'ImpaktfullUiButton';

  @override
  List<UiPlaygroundVariant> get variants => [
        ImpaktfullUiButtonPlaygroundVariant(),
      ];
}

class ImpaktfullUiButtonPlaygroundVariant
    extends UiPlaygroundVariant<ImpaktfullUiButtonPlaygroundInputs> {
  @override
  String get title => 'Default';

  @override
  Widget build(
      BuildContext context, ImpaktfullUiButtonPlaygroundInputs inputs) {
    return ImpaktfullUiButton(
      type: inputs.type.valueOrDefaultRequired,
      title: inputs.title.valueOrDefault,
      size: inputs.size.valueOrDefaultRequired,
      fullWidth: inputs.fullWidth.valueOrDefaultRequired,
      isLoading: inputs.isLoading.valueOrDefaultRequired,
      canRequestFocus: inputs.canRequestFocus.valueOrDefaultRequired,
      onTap: () => UiPlaygroundNotification.show(context, 'onTap()'),
      onAsyncTap: () async =>
          UiPlaygroundNotification.show(context, 'onAsyncTap()'),
      tooltip: inputs.tooltip.valueOrDefault,
    );
  }

  @override
  ImpaktfullUiButtonPlaygroundInputs inputs() =>
      ImpaktfullUiButtonPlaygroundInputs();
}

class ImpaktfullUiButtonPlaygroundInputs extends UiPlaygroundInputs {
  final type = UiPlaygroundEnumInput<ImpaktfullUiButtonType>(
    'Type',
    isNullable: false,
    options: ImpaktfullUiButtonType.values,
  );
  final title = UiPlaygroundStringInput(
    'Title',
    isNullable: true,
  );
  final size = UiPlaygroundEnumInput<ImpaktfullUiButtonSize>(
    'Size',
    isNullable: false,
    initialValue: ImpaktfullUiButtonSize.medium,
    options: ImpaktfullUiButtonSize.values,
  );
  final fullWidth = UiPlaygroundBooleanInput(
    'Full Width',
    isNullable: false,
    initialValue: false,
  );
  final isLoading = UiPlaygroundBooleanInput(
    'Is Loading',
    isNullable: false,
    initialValue: false,
  );
  final canRequestFocus = UiPlaygroundBooleanInput(
    'Can Request Focus',
    isNullable: false,
    initialValue: true,
  );
  final onTap = UiPlaygroundCallbackInput(
    'On Tap',
    isNullable: true,
  );
  final onAsyncTap = UiPlaygroundCallbackInput(
    'On Async Tap',
    isNullable: true,
  );
  final tooltip = UiPlaygroundStringInput(
    'Tooltip',
    isNullable: true,
  );

  @override
  List<UiPlaygroundInputItem<dynamic>> buildInputItems() => [
        type,
        title,
        size,
        fullWidth,
        isLoading,
        canRequestFocus,
        onTap,
        onAsyncTap,
        tooltip,
      ];
}
