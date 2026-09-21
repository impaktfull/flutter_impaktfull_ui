import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/card/card.dart';
import 'package:impaktfull_ui/src/components/date_input_field/date_input_field_style.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui/src/components/section_title/section_title.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/locale/locale_util.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'date_input_field_style.dart';

class ImpaktfullUiDateInputField extends StatefulWidget {
  final DateTime? date;
  final ValueChanged<DateTime?> onDateSelected;
  final String? _dateFormat;
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

  /// The first day of the week of the date picker
  /// ([DateTime.monday] ... [DateTime.sunday]). Defaults to the locale.
  final int? firstDayOfWeek;

  /// The texts of the date picker. Defaults to the localizations of the app.
  final ImpaktfullUiDatePickerLocalizations? datePickerLocalizations;

  /// The `intl` pattern of the date, e.g. `dd/MM/yyyy`.
  ///
  /// When no pattern is passed, the date uses the short date format of the
  /// locale (`dd/MM/yyyy` for the default `en` locale, `M/d/y` for `en_US`,
  /// `d-M-y` for `nl`, ...).
  String get dateFormat => _dateFormat ?? 'dd/MM/yyyy';

  const ImpaktfullUiDateInputField({
    required this.date,
    required this.onDateSelected,
    String? dateFormat,
    this.firstDayOfWeek,
    this.datePickerLocalizations,
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
  }) : _dateFormat = dateFormat;

  @override
  State<ImpaktfullUiDateInputField> createState() =>
      _ImpaktfullUiDateInputFieldState();
}

class _ImpaktfullUiDateInputFieldState
    extends State<ImpaktfullUiDateInputField> {
  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
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
                theme: _getCardTheme(context, componentTheme),
                cursor: SystemMouseCursors.click,
                error: widget.error != null && widget.error!.isNotEmpty,
                onTap: widget.isDisabled || widget.readOnly ? null : _onTap,
                padding: EdgeInsets.zero,
                borderRadius: componentTheme.dimens.borderRadius,
                child: ImpaktfullUiAutoLayout.vertical(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                  _formatDate(context) ??
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

  String? _formatDate(BuildContext context) {
    final date = widget.date;
    if (date == null) return null;
    final dateFormat = widget._dateFormat;
    if (dateFormat == null) {
      return ImpaktfullUiLocaleUtil.formatShortDate(context, date);
    }
    return ImpaktfullUiLocaleUtil.formatPattern(context, date, dateFormat);
  }

  Future<void> _onTap() async {
    final result = await ImpaktfullUiDatePicker.showModal(
      context: context,
      selectedDate: widget.date,
      localizations: widget.datePickerLocalizations,
      firstDayOfWeek: widget.firstDayOfWeek,
    );
    if (result == null) return;
    widget.onDateSelected(result);
  }

  /// The card of the field uses the colors of the [ImpaktfullUiDateInputFieldTheme].
  ImpaktfullUiCardTheme _getCardTheme(
    BuildContext context,
    ImpaktfullUiDateInputFieldTheme componentTheme,
  ) {
    final cardTheme = ImpaktfullUiCardTheme.of(context);
    return cardTheme.copyWith(
      colors: cardTheme.colors.copyWith(
        background: componentTheme.colors.background,
        border: componentTheme.colors.border,
        borderError: componentTheme.colors.borderError,
      ),
    );
  }
}
