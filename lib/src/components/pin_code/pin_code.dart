import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/pin_code/pin_code_style.dart';
import 'package:impaktfull_ui_2/src/components/pin_code/widget/pin_code_button.dart';
import 'package:impaktfull_ui_2/src/components/pin_code/widget/pin_code_value.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'pin_code_style.dart';

part 'pin_code.describe.dart';

class ImpaktfullUiPinCode extends StatefulWidget with ComponentDescriptorMixin {
  final ImpaktfullUiPinCodeTheme? theme;
  final int length;
  final Function(String) onComplete;
  final bool showSubmitButton;

  const ImpaktfullUiPinCode({
    required this.onComplete,
    this.length = 4,
    this.theme,
    this.showSubmitButton = false,
    super.key,
  });

  @override
  State<ImpaktfullUiPinCode> createState() => _ImpaktfullUiPinCodeState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiPinCodeState extends State<ImpaktfullUiPinCode> {
  var _code = '';

  bool get hasFullPin => _code.length == widget.length;

  void _onNumberTap(String number) {
    if (_code.length < widget.length) {
      setState(() {
        _code += number;
      });

      if (widget.showSubmitButton) return;
      _onSubmit();
    }
  }

  void _onDelete() {
    if (_code.isNotEmpty) {
      setState(() {
        _code = _code.substring(0, _code.length - 1);
      });
    }
  }

  void _onSubmit() {
    if (!hasFullPin) return;
    widget.onComplete(_code);
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiPinCodeTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.vertical(
        spacing: 16,
        children: [
          ImpaktfullUiPinCodeValue(
            code: _code,
            length: widget.length,
            theme: componentTheme,
          ),
          Expanded(
            child: ImpaktfullUiAutoLayout.vertical(
              spacing: 8,
              children: [
                Expanded(
                  child: ImpaktfullUiAutoLayout.horizontal(
                    spacing: 8,
                    children: [
                      _buildNumberButton('1'),
                      _buildNumberButton('2'),
                      _buildNumberButton('3'),
                    ],
                  ),
                ),
                Expanded(
                  child: ImpaktfullUiAutoLayout.horizontal(
                    spacing: 8,
                    children: [
                      _buildNumberButton('4'),
                      _buildNumberButton('5'),
                      _buildNumberButton('6'),
                    ],
                  ),
                ),
                Expanded(
                  child: ImpaktfullUiAutoLayout.horizontal(
                    spacing: 8,
                    children: [
                      _buildNumberButton('7'),
                      _buildNumberButton('8'),
                      _buildNumberButton('9'),
                    ],
                  ),
                ),
                Expanded(
                  child: ImpaktfullUiAutoLayout.horizontal(
                    spacing: 8,
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
                      if (widget.showSubmitButton) ...[
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: AnimatedOpacity(
                              opacity: hasFullPin ? 1 : 0.33,
                              duration: componentTheme.durations.submitOpacity,
                              child: ImpaktfullUiPinCodeButton(
                                asset: componentTheme.assets.check,
                                onTap: _onSubmit,
                              ),
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
    );
  }

  Widget _buildNumberButton(String number) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: ImpaktfullUiPinCodeButton(
          onTap: () => _onNumberTap(number),
          value: number,
        ),
      ),
    );
  }
}
