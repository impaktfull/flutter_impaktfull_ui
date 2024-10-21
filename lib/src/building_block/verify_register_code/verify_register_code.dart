import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/unified_screen_layout/unified_screen_layout.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiBBVerifyRegisterCode extends StatelessWidget {
  final WidgetBuilder? topBuilder;
  final WidgetBuilder? bottomBuilder;
  final Widget? Function(BuildContext)? startBuilder;
  final Widget? Function(BuildContext)? endBuilder;
  final String code;
  final Function(String) onChangedVerificationCode;
  final AsyncCallback onVerifyCodeTapped;
  final VoidCallback? onBackTapped;
  final Alignment alignment;

  const ImpaktfullUiBBVerifyRegisterCode({
    required this.code,
    required this.onChangedVerificationCode,
    required this.onVerifyCodeTapped,
    this.topBuilder,
    this.startBuilder,
    this.endBuilder,
    this.bottomBuilder,
    this.onBackTapped,
    this.alignment = Alignment.center,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiUnifiedScreenLayout(
      startBuilder: startBuilder,
      endBuilder: endBuilder,
      topBuilder: topBuilder,
      bottomBuilder: bottomBuilder,
      alignment: alignment,
      centerChild: ImpaktfullUiAutoLayout.vertical(
        mainAxisSize: MainAxisSize.min,
        spacing: 48,
        children: [
          ImpaktfullUiAutoLayout.vertical(
            spacing: 8,
            children: [
              Text(
                "You've got mail",
                style: theme.textStyles.onCanvas.display.large,
              ),
              Text(
                "Enter the verification code you received by email",
                style: theme.textStyles.onCardTertiary.text.small,
              ),
            ],
          ),
          ImpaktfullUiAutoLayout.vertical(
            spacing: 16,
            children: [
              ImpaktfullUiInputField(
                label: 'Verification code',
                placeholder: 'Enter your verification code',
                value: code,
                autofill: const [
                  AutofillHints.oneTimeCode,
                ],
                onChanged: onChangedVerificationCode,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              ImpaktfullUiButton(
                type: ImpaktfullUiButtonType.primary,
                title: 'Verify',
                fullWidth: true,
                onAsyncTap: onVerifyCodeTapped,
              ),
              if (onBackTapped != null) ...[
                ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.linkGrey,
                  title: 'Go back',
                  fullWidth: true,
                  onTap: onBackTapped,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
