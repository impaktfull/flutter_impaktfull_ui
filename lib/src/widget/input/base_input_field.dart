import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/util/extension/border_radius_geometry_extension.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class BaseInputField extends StatefulWidget {
  final String? placeholder;
  final String? value;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmit;
  final TextEditingController controller;
  final bool autofocus;
  final FocusNode focusNode;
  final ValueChanged<bool>? onFocusChanged;
  final bool obscureText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool multiline;
  final int? maxLines;
  final TextAlign textAlign;
  final List<String> autofill;
  final bool autocorrect;
  final bool readOnly;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter> inputFormatters;
  final ImpaktfullUiInputFieldTheme? theme;
  final Duration debounceDuration;

  const BaseInputField({
    required this.value,
    required this.onChanged,
    required this.onSubmit,
    required this.focusNode,
    required this.controller,
    required this.placeholder,
    required this.onFocusChanged,
    required this.autofocus,
    required this.obscureText,
    required this.textInputType,
    required this.textInputAction,
    required this.multiline,
    required this.maxLines,
    required this.textAlign,
    required this.autofill,
    required this.autocorrect,
    required this.readOnly,
    required this.textCapitalization,
    required this.inputFormatters,
    required this.theme,
    this.debounceDuration = Duration.zero,
    super.key,
  });

  @override
  State<BaseInputField> createState() => _BaseInputFieldState();
}

class _BaseInputFieldState extends State<BaseInputField> {
  Timer? _debounceTimer;

  /// The values this field reported through `onChanged` that have not come
  /// back as [BaseInputField.value] yet.
  ///
  /// Someone who types faster than the widget above rebuilds gets a `value`
  /// that is behind what the controller already holds. Writing that value
  /// back would undo the keystrokes in between and leave the cursor in the
  /// middle of the text, so the next character replaces what is there. The
  /// queue tells the two apart: a value this field reported itself is an echo
  /// that is on its way, anything else is a change of the app.
  final _reportedValues = <String>[];

  /// Enough to cover a burst of typing; a widget above that never sends the
  /// value back must not grow the queue forever.
  static const _maxReportedValues = 64;

  TextEditingController get _controller => widget.controller;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChanged);
    if (widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.focusNode.requestFocus();
      });
    }
  }

  @override
  void didUpdateWidget(covariant BaseInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode) {
      oldWidget.focusNode.removeListener(_onFocusChanged);
      widget.focusNode.addListener(_onFocusChanged);
    }
    if (oldWidget.value == widget.value) return;
    final text = widget.value ?? '';
    final echo = _reportedValues.indexOf(text);
    if (echo >= 0) {
      // The value of the widget above is catching up with what this field
      // reported. What the user typed after it is already in the controller.
      _reportedValues.removeRange(0, echo + 1);
      return;
    }
    _reportedValues.clear();
    if (_controller.text == text) return;
    // Keep the selection, clamped to the new text
    final selection = _controller.selection;
    _controller.value = TextEditingValue(
      text: text,
      selection: selection.isValid
          ? TextSelection(
              baseOffset: selection.baseOffset.clamp(0, text.length),
              extentOffset: selection.extentOffset.clamp(0, text.length),
            )
          : TextSelection.collapsed(offset: text.length),
    );
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    widget.focusNode.removeListener(_onFocusChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => Theme(
        data: Theme.of(context).copyWith(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: componentTheme.colors.cursor,
            selectionColor: componentTheme.colors.selection,
            selectionHandleColor: componentTheme.colors.selectionHandle,
          ),
        ),
        child: CupertinoTheme(
          data: CupertinoTheme.of(context).copyWith(
            primaryColor: componentTheme.colors.selectionHandle,
          ),
          child: TextField(
            focusNode: widget.focusNode,
            controller: _controller,
            scrollPadding: EdgeInsets.zero,
            style: componentTheme.textStyles.text,
            onChanged: _debouncedOnChanged,
            obscureText: widget.obscureText,
            onSubmitted: widget.onSubmit,
            textInputAction: widget.multiline
                ? TextInputAction.newline
                : widget.textInputAction,
            keyboardType: widget.multiline
                ? TextInputType.multiline
                : widget.textInputType,
            maxLines: widget.multiline ? widget.maxLines : 1,
            minLines: widget.multiline ? 3 : 1,
            textAlign: widget.textAlign,
            autofillHints: widget.autofill,
            autocorrect: widget.autocorrect,
            readOnly: widget.readOnly,
            textCapitalization: widget.textCapitalization,
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
              isDense: true,
              hintText: widget.placeholder,
              focusColor: Colors.transparent,
              hintStyle: componentTheme.textStyles.placeholder,
              border: OutlineInputBorder(
                borderRadius: componentTheme.dimens.borderRadius.value,
              ),
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              contentPadding: componentTheme.dimens.contentPadding,
            ),
          ),
        ),
      ),
    );
  }

  void _debouncedOnChanged(String value) {
    _debounceTimer?.cancel();
    if (widget.debounceDuration == Duration.zero) {
      // A `Timer` of zero still reports in a later turn of the event loop, so
      // a fast typist gets another character in before the widget above hears
      // about this one.
      _report(value);
      return;
    }
    _debounceTimer = Timer(widget.debounceDuration, () => _report(value));
  }

  void _report(String value) {
    _reportedValues.add(value);
    if (_reportedValues.length > _maxReportedValues) {
      _reportedValues.removeAt(0);
    }
    widget.onChanged(value);
  }

  void _onFocusChanged() =>
      widget.onFocusChanged?.call(widget.focusNode.hasFocus);
}
