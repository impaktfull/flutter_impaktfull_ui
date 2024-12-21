import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/card/card.dart';
import 'package:impaktfull_ui/src/components/date_input_field/date_input_field_style.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui/src/components/section_title/section_title.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';

export 'date_input_field_style.dart';

part 'date_input_field.describe.dart';

class ImpaktfullUiDateInputField extends StatefulWidget
    with ComponentDescriptorMixin {
  final DateTime? date;
  final ValueChanged<DateTime?> onDateSelected;
  final String dateFormat;
  final ImpaktfullUiAsset? leadingIcon;
  final WidgetBuilder? leadingBuilder;
  final String? label;
  final List<Widget>? labelActions;
  final String? placeholder;
  final String? hint;
  final String? error;
  final bool isDisabled;
  final bool readOnly;
  final ImpaktfullUiDateInputFieldTheme? theme;

  const ImpaktfullUiDateInputField({
    required this.date,
    required this.onDateSelected,
    this.dateFormat = 'dd/MM/yyyy',
    this.leadingIcon,
    this.leadingBuilder,
    this.label,
    this.labelActions,
    this.placeholder,
    this.hint,
    this.error,
    this.isDisabled = false,
    this.readOnly = false,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiDateInputField> createState() =>
      _ImpaktfullUiDateInputFieldState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiDateInputFieldState
    extends State<ImpaktfullUiDateInputField> {
  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiDateInputFieldTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        return ImpaktfullUiAutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            if (widget.label != null) ...[
              ImpaktfullUiSectionTitle(
                title: widget.label ?? '',
                margin: EdgeInsets.zero,
                actions: widget.labelActions ?? [],
              ),
            ],
            Opacity(
              opacity: widget.isDisabled && !widget.readOnly ? 0.66 : 1,
              child: ImpaktfullUiCard(
                cursor: SystemMouseCursors.click,
                error: widget.error != null && widget.error!.isNotEmpty,
                onTap: widget.isDisabled ? null : _onTap,
                padding: EdgeInsets.zero,
                borderRadius: componentTheme.dimens.borderRadius,
                child: ImpaktfullUiAutoLayout.vertical(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: ImpaktfullUiAutoLayout.horizontal(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8,
                        children: [
                          if (widget.leadingIcon != null) ...[
                            ImpaktfullUiAssetWidget(
                              asset: widget.leadingIcon,
                              size: 20,
                              color: componentTheme.textStyles.text.color,
                            ),
                          ],
                          if (widget.leadingBuilder != null) ...[
                            widget.leadingBuilder!(context),
                          ],
                          Expanded(
                            child: Container(
                              constraints: const BoxConstraints(minHeight: 40),
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Text(
                                  widget.date?.format(widget.dateFormat) ??
                                      widget.placeholder ??
                                      '',
                                  style: widget.date == null
                                      ? componentTheme.textStyles.placeholder
                                      : componentTheme.textStyles.text,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (widget.error != null) ...[
              Text(
                widget.error ?? '',
                style: componentTheme.textStyles.error,
              ),
            ] else if (widget.hint != null) ...[
              Text(
                widget.hint ?? '',
                style: componentTheme.textStyles.hint,
              ),
            ]
          ],
        );
      },
    );
  }

  Future<void> _onTap() async {
    final result = await ImpaktfullUiDatePicker.showModal(
      context: context,
      selectedDate: widget.date,
    );
    if (result == null) return;
    widget.onDateSelected(result);
  }
}
