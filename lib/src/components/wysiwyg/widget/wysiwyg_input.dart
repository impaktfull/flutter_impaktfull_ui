import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/card/card.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/widget/actions/wysiwig_actions.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/wysiwyg.dart';
import 'package:impaktfull_ui_2/src/util/extension/border_radius_geometry_extension.dart';

class ImpaktfullUiWysiwygInputField extends StatefulWidget {
  final String? placeholder;
  final String? hint;
  final String? error;
  final ImpaktfullUiWysiwygType type;
  final List<ImpaktfullUiWysiwygAction> actions;
  final String? value;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final bool autofocus;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChanged;
  final ImpaktfullUiWysiwygTheme? theme;

  const ImpaktfullUiWysiwygInputField({
    required this.value,
    required this.onChanged,
    required this.type,
    required this.actions,
    this.placeholder,
    this.hint,
    this.error,
    this.controller,
    this.focusNode,
    this.onFocusChanged,
    this.autofocus = false,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiWysiwygInputField> createState() =>
      _ImpaktfullUiWysiwygInputFieldState();
}

class _ImpaktfullUiWysiwygInputFieldState
    extends State<ImpaktfullUiWysiwygInputField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  TextSelection? _textSelection;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.value);
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChanged);
    _controller.addListener(_onTextChanged);
    if (widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiWysiwygInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value && _controller.text != widget.value) {
      final currentSelection = _controller.selection;
      _controller.text = widget.value ?? '';
      _controller.selection = currentSelection;
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.removeListener(_onFocusChanged);
    _controller.removeListener(_onTextChanged);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _textSelection = _controller.selection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiInputFieldTheme>(
      builder: (context, inputFieldTheme) =>
          ImpaktfullUiComponentThemeBuidler<ImpaktfullUiWysiwygTheme>(
        overrideComponentTheme: widget.theme,
        builder: (context, componentTheme) => ImpaktfullUiAutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            ImpaktfullUiCard(
              cursor: SystemMouseCursors.text,
              error: widget.error != null && widget.error!.isNotEmpty,
              onFocus: _onFocus,
              padding: EdgeInsets.zero,
              borderRadius: inputFieldTheme.dimens.borderRadius,
              child: ImpaktfullUiAutoLayout.vertical(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImpaktfullUiTouchFeedback(
                    onTap: _onTap,
                    useFocusColor: false,
                    canRequestFocus: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          textSelectionTheme: TextSelectionThemeData(
                            cursorColor: inputFieldTheme.colors.cursor,
                            selectionColor: inputFieldTheme.colors.selection,
                            selectionHandleColor:
                                inputFieldTheme.colors.selectionHandle,
                          ),
                        ),
                        child: TextField(
                          focusNode: _focusNode,
                          controller: _controller,
                          scrollPadding: EdgeInsets.zero,
                          cursorColor: inputFieldTheme.colors.cursor,
                          style: inputFieldTheme.textStyles.text,
                          onChanged: widget.onChanged,
                          textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.multiline,
                          minLines: 3,
                          maxLines: null,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: widget.placeholder,
                            focusColor: Colors.transparent,
                            hintStyle: inputFieldTheme.textStyles.placeholder,
                            border: OutlineInputBorder(
                              borderRadius:
                                  inputFieldTheme.dimens.borderRadius.value,
                            ),
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          inputFormatters: [
                            TextInputFormatter.withFunction(
                                (oldValue, newValue) {
                              if (newValue.text.endsWith('\t')) {
                                final newText =
                                    newValue.text.replaceAll('\t', '    ');
                                return TextEditingValue(
                                  text: newText,
                                  selection: TextSelection.collapsed(
                                      offset: newText.length),
                                );
                              }
                              return newValue;
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const ImpaktfullUiDivider(),
                  WysiwygActions(
                    text: _controller.text,
                    type: widget.type,
                    actions: widget.actions,
                    onChangedText: _onChangedTextFromAction,
                    componentTheme: componentTheme,
                    textSelected: _textSelection,
                  ),
                ],
              ),
            ),
            if (widget.error != null) ...[
              Text(
                widget.error ?? '',
                style: inputFieldTheme.textStyles.error,
              ),
            ] else if (widget.hint != null) ...[
              Text(
                widget.hint ?? '',
                style: inputFieldTheme.textStyles.hint,
              ),
            ]
          ],
        ),
      ),
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

  void _onChangedTextFromAction(String text, TextSelection? textSelection) {
    _controller.text = text;
    widget.onChanged(text);
    if (textSelection != null) {
      _controller.selection = textSelection;
      _focusNode.requestFocus();
    }
  }
}
