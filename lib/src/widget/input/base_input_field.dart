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
  late final TextEditingController _controller;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
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
    if (oldWidget.value != widget.value && _controller.text != widget.value) {
      final currentSelection = _controller.selection;
      _controller.text = widget.value ?? '';
      _controller.selection = currentSelection;
    }
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
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ),
    );
  }

  void _debouncedOnChanged(String value) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(widget.debounceDuration, () {
      widget.onChanged(value);
    });
  }

  void _onFocusChanged() =>
      widget.onFocusChanged?.call(widget.focusNode.hasFocus);
}
