import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/file_picker/file_picker_style.dart';
import 'package:impaktfull_ui_2/src/components/file_picker/model/file_picker_data.dart';
import 'package:impaktfull_ui_2/src/components/file_picker/model/file_picker_progress_type.dart';
import 'package:impaktfull_ui_2/src/components/file_picker/widgets/file_picker_content.dart';
import 'package:impaktfull_ui_2/src/components/file_picker/widgets/file_picker_empty.dart';
import 'package:impaktfull_ui_2/src/components/hover_feedback/hover_feedback.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'model/file_picker_data.dart';
export 'file_picker_style.dart';

part 'file_picker.describe.dart';

class ImpaktfullUiFilePicker extends StatelessWidget
    with ComponentDescriptorMixin {
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
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiFilePickerTheme>(
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

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

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
