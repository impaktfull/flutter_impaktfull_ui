import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/card/card.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

export 'input_field_style.dart';

class ImpaktfullUiInputField extends StatefulWidget {
  final String? label;
  final String? hint;
  final IconData? leadingIcon;
  final String? value;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputAction textInputAction;
  final ImpaktfullUiInputFieldTheme? theme;

  const ImpaktfullUiInputField({
    required this.value,
    required this.onChanged,
    this.leadingIcon,
    this.hint,
    this.label,
    this.controller,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiInputField> createState() => _ImpaktfullUiInputFieldState();
}

class _ImpaktfullUiInputFieldState extends State<ImpaktfullUiInputField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_controller.text != widget.value) {
      _controller.text = widget.value ?? '';
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiInputFieldTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, theme, componentTheme) => ImpaktfullUiAutoLayout.vertical(
        spacing: 4,
        children: [
          if (widget.label != null) ...[
            Text(
              widget.label ?? '',
              style: componentTheme.textStyles.label,
            ),
          ],
          ImpaktfullUiCard(
            cursor: SystemMouseCursors.text,
            onTap: _onTap,
            onFocus: _onFocus,
            child: ImpaktfullUiAutoLayout.horizontal(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                if (widget.leadingIcon != null) ...[
                  Icon(
                    widget.leadingIcon,
                    size: 20,
                    color: componentTheme.textStyles.text.color,
                  ),
                ],
                Expanded(
                  child: TextField(
                    focusNode: _focusNode,
                    controller: _controller,
                    scrollPadding: EdgeInsets.zero,
                    style: componentTheme.textStyles.text,
                    onChanged: widget.onChanged,
                    obscureText: widget.obscureText,
                    textInputAction: widget.textInputAction,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: widget.hint,
                      focusColor: Colors.transparent,
                      hintStyle: componentTheme.textStyles.hint,
                      border: OutlineInputBorder(borderRadius: componentTheme.dimens.borderRadius),
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
}
