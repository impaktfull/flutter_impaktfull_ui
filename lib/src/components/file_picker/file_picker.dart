import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/file_picker/file_picker_style.dart';
import 'package:impaktfull_ui/src/components/file_picker/model/file_picker_data.dart';
import 'package:impaktfull_ui/src/components/file_picker/model/file_picker_progress_type.dart';
import 'package:impaktfull_ui/src/components/file_picker/widgets/file_picker_content.dart';
import 'package:impaktfull_ui/src/components/file_picker/widgets/file_picker_empty.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/hover_feedback/hover_feedback.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'model/file_picker_data.dart';
export 'file_picker_style.dart';

class ImpaktfullUiFilePicker extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final ImpaktfullUiFilePickerData? data;
  final VoidCallback? onTap;
  final VoidCallback? onDeleteTapped;
  final VoidCallback? onRetryTapped;
  final WidgetBuilder? leadingBuilder;
  final ImpaktfullUiFilePickerProgressType progressType;
  final ImpaktfullUiFilePickerTheme? theme;

  const ImpaktfullUiFilePicker({
    this.title,
    this.subtitle,
    this.data,
    this.onTap,
    this.onRetryTapped,
    this.onDeleteTapped,
    this.leadingBuilder,
    this.progressType = ImpaktfullUiFilePickerProgressType.progressLineWithText,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiHoverFeedback(
        cursor: data == null ? SystemMouseCursors.click : MouseCursor.defer,
        builder: (context, isHovered) => ImpaktfullUiTouchFeedback(
          color: componentTheme.colors.background,
          borderRadius: componentTheme.dimens.borderRadius,
          border: _getBorder(componentTheme, isHovered),
          onTap: data == null ? onTap : null,
          child: SizedBox(
            width: double.infinity,
            child: Builder(
              builder: (context) {
                if (data == null) {
                  return ImpaktfullUiFilePickerEmpty(
                    title: title,
                    subtitle: subtitle,
                    componentTheme: componentTheme,
                  );
                }
                return ImpaktfullUiFilePickerContent(
                  leadingBuilder: leadingBuilder,
                  data: data!,
                  onDeleteTapped: onDeleteTapped,
                  onRetryTapped: onRetryTapped,
                  progressType: progressType,
                  componentTheme: componentTheme,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  BoxBorder _getBorder(
      ImpaktfullUiFilePickerTheme componentTheme, bool isHovered) {
    Color color;
    if (data == null && isHovered) {
      color = componentTheme.colors.borderDrop;
    } else if (data != null && onRetryTapped != null) {
      color = componentTheme.colors.borderError;
    } else {
      color = componentTheme.colors.border;
    }
    return Border.all(
      color: color,
    );
  }
}
