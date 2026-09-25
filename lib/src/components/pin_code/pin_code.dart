import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/pin_code/pin_code_style.dart';
import 'package:impaktfull_ui/src/components/pin_code/widget/pin_code_button.dart';
import 'package:impaktfull_ui/src/components/pin_code/widget/pin_code_value.dart';
import 'package:impaktfull_ui/src/widget/keyboard/keyboard_listener.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'pin_code_style.dart';

class ImpaktfullUiPinCode extends StatefulWidget {
  final ImpaktfullUiPinCodeTheme? theme;
  final String code;
  final int length;
  final void Function(String) onChanged;
  final ValueChanged<String>? onSubmitted;

  const ImpaktfullUiPinCode({
    required this.code,
    required this.onChanged,
    this.length = 4,
    this.theme,
    ValueChanged<String>? onSubmitted,
    @Deprecated('Use onSubmitted instead. Will be removed in 1.0.0.')
    ValueChanged<String>? onSubmit,
    super.key,
  }) : onSubmitted = onSubmitted ?? onSubmit;

  @Deprecated('Use onSubmitted instead. Will be removed in 1.0.0.')
  ValueChanged<String>? get onSubmit => onSubmitted;

  @override
  State<ImpaktfullUiPinCode> createState() => _ImpaktfullUiPinCodeState();
}

class _ImpaktfullUiPinCodeState extends State<ImpaktfullUiPinCode> {
  var _code = '';

  bool get hasFullPin => _code.length == widget.length;

  @override
  void initState() {
    super.initState();
    _code = widget.code;
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiPinCode oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_code != widget.code) {
      _code = widget.code;
    }
  }

  void _onKeyTap(String number) {
    if (int.tryParse(number) == null) return;
    if (_code.length >= widget.length) return;
    setState(() {
      _code += number;
    });
    widget.onChanged(_code);
  }

  void _onDelete() {
    if (_code.isEmpty) return;
    setState(() {
      _code = _code.substring(0, _code.length - 1);
    });
    widget.onChanged(_code);
  }

  void _onSubmit() {
    if (!hasFullPin) return;
    widget.onSubmitted?.call(_code);
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiKeyboardListener(
      onSubmit: _onSubmit,
      onDelete: _onDelete,
      allowedKeys: ImpaktfullUiKeyboardListener.numpadKeys,
      onNumberTap: _onKeyTap,
      child: ImpaktfullUiOverridableComponentBuilder(
        component: widget,
        overrideComponentTheme: widget.theme,
        builder: (context, componentTheme) => ImpaktfullUiAutoLayout.vertical(
          spacing: componentTheme.dimens.spacing,
          children: [
            ImpaktfullUiPinCodeValue(
              code: _code,
              length: widget.length,
              theme: componentTheme,
            ),
            Expanded(
              child: ImpaktfullUiAutoLayout.vertical(
                spacing: componentTheme.dimens.fieldSpacing,
                children: [
                  Expanded(
                    child: ImpaktfullUiAutoLayout.horizontal(
                      spacing: componentTheme.dimens.fieldSpacing,
                      children: [
                        _buildNumberButton('1'),
                        _buildNumberButton('2'),
                        _buildNumberButton('3'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ImpaktfullUiAutoLayout.horizontal(
                      spacing: componentTheme.dimens.fieldSpacing,
                      children: [
                        _buildNumberButton('4'),
                        _buildNumberButton('5'),
                        _buildNumberButton('6'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ImpaktfullUiAutoLayout.horizontal(
                      spacing: componentTheme.dimens.fieldSpacing,
                      children: [
                        _buildNumberButton('7'),
                        _buildNumberButton('8'),
                        _buildNumberButton('9'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ImpaktfullUiAutoLayout.horizontal(
                      spacing: componentTheme.dimens.fieldSpacing,
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: ImpaktfullUiPinCodeButton(
                              asset: componentTheme.assets.backspace,
                              onTap: _onDelete,
                            ),
                          ),
                        ),
                        _buildNumberButton('0'),
                        if (widget.onSubmitted != null) ...[
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: ImpaktfullUiPinCodeButton(
                                asset: componentTheme.assets.check,
                                onTap: hasFullPin ? _onSubmit : null,
                              ),
                            ),
                          )
                        ] else ...[
                          const Expanded(child: SizedBox()),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: ImpaktfullUiPinCodeButton(
          onTap: () => _onKeyTap(number),
          value: number,
        ),
      ),
    );
  }
}
