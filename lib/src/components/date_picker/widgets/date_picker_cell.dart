import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/accessibility/accessibility.localizations.dart';

enum ImpaktfullUiDatePickerCellType {
  single,
  start,
  between,
  end,
  today,
}

class ImpaktfullUiDatePickerCell extends StatelessWidget {
  final String value;
  final bool isSelected;
  final bool active;
  final ImpaktfullUiDatePickerCellType type;
  final VoidCallback? onTap;
  final bool fullWidth;
  final ImpaktfullUiDatePickerTheme theme;

  /// Whether the date is outside `firstDate` / `lastDate`: the cell is not
  /// tappable, not focusable and announced as a disabled button.
  final bool isDisabled;

  const ImpaktfullUiDatePickerCell({
    required this.value,
    required this.theme,
    required this.isSelected,
    required this.onTap,
    this.active = true,
    this.fullWidth = false,
    this.isDisabled = false,
    this.type = ImpaktfullUiDatePickerCellType.single,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final cell = ImpaktfullUiTouchFeedback(
          onTap: isDisabled ? null : onTap,
          color: _getBackgroundColor(componentTheme),
          borderRadius: _getBorderRadius(componentTheme),
          border: _getBorder(componentTheme),
          tooltip: isDisabled
              ? ImpaktfullUiAccessibilityLocalizations.of(context)
                  .unavailableDate
              : null,
          child: Center(
            child: SizedBox(
              width: fullWidth ? double.infinity : 40,
              height: fullWidth ? 40 : 40,
              child: Center(
                child: Text(
                  value,
                  style: _getTextStyle(componentTheme),
                ),
              ),
            ),
          ),
        );
        if (!isDisabled) return cell;
        return Semantics(
          container: true,
          button: true,
          enabled: false,
          child: cell,
        );
      },
    );
  }

  BorderRadiusGeometry _getBorderRadius(
      ImpaktfullUiDatePickerTheme componentTheme) {
    switch (type) {
      case ImpaktfullUiDatePickerCellType.single:
        return componentTheme.dimens.borderRadius;
      case ImpaktfullUiDatePickerCellType.start:
        return componentTheme.dimens.borderRadiusRangeStart;
      case ImpaktfullUiDatePickerCellType.between:
        return componentTheme.dimens.borderRadiusRangeBetween;
      case ImpaktfullUiDatePickerCellType.end:
        return componentTheme.dimens.borderRadiusRangeEnd;
      case ImpaktfullUiDatePickerCellType.today:
        return componentTheme.dimens.borderRadius;
    }
  }

  Border? _getBorder(ImpaktfullUiDatePickerTheme componentTheme) {
    if (isDisabled) return null;
    switch (type) {
      case ImpaktfullUiDatePickerCellType.today:
        return Border.all(
          color: componentTheme.colors.selected,
          width: componentTheme.dimens.selectedBorderWidth,
        );
      case ImpaktfullUiDatePickerCellType.single:
      case ImpaktfullUiDatePickerCellType.start:
      case ImpaktfullUiDatePickerCellType.between:
      case ImpaktfullUiDatePickerCellType.end:
        return null;
    }
  }

  TextStyle _getTextStyle(ImpaktfullUiDatePickerTheme componentTheme) {
    if (isDisabled) {
      return componentTheme.textStyles.cellDisabled ??
          componentTheme.textStyles.cellInActive;
    }
    if (isSelected) {
      return componentTheme.textStyles.cellSelected;
    }
    if (active) {
      return componentTheme.textStyles.cell;
    }
    return componentTheme.textStyles.cellInActive;
  }

  Color _getBackgroundColor(ImpaktfullUiDatePickerTheme componentTheme) {
    if (isDisabled) return Colors.transparent;
    if (isSelected) {
      return componentTheme.colors.selected;
    }
    if (type == ImpaktfullUiDatePickerCellType.between) {
      return componentTheme.colors.inRange;
    }
    return Colors.transparent;
  }
}
