import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/card/card.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/section_title/section_title.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui_2/src/util/extension/border_radius_geometry_extension.dart';
import 'package:impaktfull_ui_2/src/widget/input/base_input_field.dart';

export 'input_field_style.dart';
export 'action/input_field_action.dart';

part 'input_field.describe.dart';

class ImpaktfullUiInputField extends StatefulWidget
    with ComponentDescriptorMixin {
  final String? label;
  final List<Widget> labelActions;
  final String? placeholder;
  final String? hint;
  final String? error;
  final WidgetBuilder? leadingBuilder;
  final WidgetBuilder? topBuilder;
  final ImpaktfullUiAsset? leadingIcon;
  final Widget? trailingAction;
  final String? value;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final bool autofocus;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChanged;
  final bool obscureText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool multiline;
  final int? maxLines;
  final List<String> autofill;
  final TextAlign textAlign;
  final ImpaktfullUiInputFieldTheme? theme;

  const ImpaktfullUiInputField({
    required this.value,
    required this.onChanged,
    this.leadingIcon,
    this.leadingBuilder,
    this.topBuilder,
    this.trailingAction,
    this.placeholder,
    this.hint,
    this.error,
    this.label,
    this.labelActions = const [],
    this.autofill = const [],
    this.controller,
    this.focusNode,
    this.onFocusChanged,
    this.autofocus = false,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.multiline = false,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiInputField> createState() => _ImpaktfullUiInputFieldState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiInputFieldState extends State<ImpaktfullUiInputField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.value);
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChanged);
    if (widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value && _controller.text != widget.value) {
      _controller.text = widget.value ?? '';
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.removeListener(_onFocusChanged);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trailingAction = widget.trailingAction;
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiInputFieldTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        final trailingActionAllowed =
            widget.multiline == false && trailingAction != null;
        return ImpaktfullUiAutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            if (widget.label != null) ...[
              ImpaktfullUiSectionTitle(
                title: widget.label ?? '',
                margin: EdgeInsets.zero,
                actions: widget.labelActions,
              ),
            ],
            ImpaktfullUiAutoLayout.horizontal(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ImpaktfullUiCard(
                    cursor: SystemMouseCursors.text,
                    error: widget.error != null && widget.error!.isNotEmpty,
                    onTap: _onTap,
                    onFocus: _onFocus,
                    padding: EdgeInsets.zero,
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: componentTheme.dimens.borderRadius.topStart,
                      bottomStart:
                          componentTheme.dimens.borderRadius.bottomStart,
                      topEnd: trailingActionAllowed
                          ? Radius.zero
                          : componentTheme.dimens.borderRadius.topEnd,
                      bottomEnd: trailingActionAllowed
                          ? Radius.zero
                          : componentTheme.dimens.borderRadius.bottomEnd,
                    ),
                    child: ImpaktfullUiAutoLayout.vertical(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.topBuilder != null) ...[
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                              left: 8,
                              right: 8,
                            ),
                            child: widget.topBuilder!(context),
                          ),
                        ],
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
                                child: BaseInputField(
                                  value: widget.value,
                                  onChanged: widget.onChanged,
                                  focusNode: _focusNode,
                                  controller: _controller,
                                  autofill: widget.autofill,
                                  theme: componentTheme,
                                  maxLines: widget.maxLines,
                                  textInputAction: widget.textInputAction,
                                  textInputType: widget.textInputType,
                                  obscureText: widget.obscureText,
                                  placeholder: widget.placeholder,
                                  autofocus: widget.autofocus,
                                  multiline: widget.multiline,
                                  onFocusChanged: widget.onFocusChanged,
                                  textAlign: widget.textAlign,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (trailingActionAllowed) ...[
                  trailingAction,
                ],
              ],
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

  void _onTap() {
    _focusNode.requestFocus();
    // Hack to make sure the cursor is at the end of the text
    WidgetsBinding.instance.addPostFrameCallback((d) {
      if (!mounted) return;
      _controller.selection = TextSelection(
        baseOffset: _controller.text.length,
        extentOffset: _controller.text.length,
      );
    });
  }

  void _onFocus() => _focusNode.requestFocus();

  void _onFocusChanged() => widget.onFocusChanged?.call(_focusNode.hasFocus);
}
