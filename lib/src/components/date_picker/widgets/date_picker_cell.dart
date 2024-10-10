import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/touch_feedback/touch_feedback.dart';

enum ImpaktfullUiDatePickerCellType {
  single,
  start,
  between,
  end,
}

class ImpaktfullUiDatePickerCell extends StatelessWidget {
  final String value;
  final bool isSelected;
  final bool active;
  final ImpaktfullUiDatePickerCellType type;
  final VoidCallback? onTap;
  final bool fullWidth;
  final ImpaktfullUiDatePickerTheme theme;

  const ImpaktfullUiDatePickerCell({
    required this.value,
    required this.theme,
    required this.isSelected,
    required this.onTap,
    this.active = true,
    this.fullWidth = false,
    this.type = ImpaktfullUiDatePickerCellType.single,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiDatePickerTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiTouchFeedback(
        onTap: onTap,
        color: _getBackgroundColor(componentTheme),
        borderRadius: _getBorderRadius(componentTheme),
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
      ),
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
    }
  }

  TextStyle _getTextStyle(ImpaktfullUiDatePickerTheme componentTheme) {
    if (isSelected) {
      return componentTheme.textStyles.cellSelected;
    }
    if (active) {
      return componentTheme.textStyles.cell;
    }
    return componentTheme.textStyles.cellInActive;
  }

  Color _getBackgroundColor(ImpaktfullUiDatePickerTheme componentTheme) {
    if (isSelected) {
      return componentTheme.colors.selected;
    }
    if (type == ImpaktfullUiDatePickerCellType.between) {
      return componentTheme.colors.inRange;
    }
    return Colors.transparent;
  }
}
