import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/card/card.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/widget/actions/wysiwig_actions.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/wysiwyg.dart';
import 'package:impaktfull_ui_2/src/widget/input/base_input_field.dart';

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

  @override
  void initState() {
    super.initState();
    final widgetController = widget.controller;
    _controller = widgetController ?? TextEditingController(text: widget.value);
    if (widgetController == null) {
      _controller.selection = TextSelection(
          baseOffset: widget.value!.length, extentOffset: widget.value!.length);
    }
    _focusNode = widget.focusNode ?? FocusNode();
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
      _controller.text = widget.value ?? '';
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _controller.removeListener(_onTextChanged);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiInputFieldTheme>(
      builder: (context, inputFieldTheme) =>
          ImpaktfullUiComponentThemeBuilder<ImpaktfullUiWysiwygTheme>(
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
                      child: ImpaktfullUiAutoLayout.vertical(
                        children: [
                          BaseInputField(
                            value: widget.value,
                            onChanged: widget.onChanged,
                            focusNode: _focusNode,
                            controller: _controller,
                            placeholder: widget.placeholder,
                            onFocusChanged: widget.onFocusChanged,
                            autofocus: widget.autofocus,
                            obscureText: false,
                            autofill: const [],
                            textInputType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            multiline: true,
                            maxLines: null,
                            textAlign: TextAlign.start,
                            theme: inputFieldTheme,
                          ),
                        ],
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
                    textSelected: _controller.selection,
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
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      if (!mounted) return;
      _controller.selection = TextSelection(
        baseOffset: _controller.text.length,
        extentOffset: _controller.text.length,
      );
    });
  }

  void _onFocus() => _focusNode.requestFocus();

  void _onChangedTextFromAction(String text, TextSelection? textSelection) {
    _controller.text = text;
    widget.onChanged(text);
    if (textSelection != null) {
      _controller.selection = textSelection;
      _focusNode.requestFocus();
    }
  }
}
