import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/unified_screen_layout/unified_screen_layout.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiBBForgetPassword extends StatelessWidget {
  final WidgetBuilder? topBuilder;
  final WidgetBuilder? bottomBuilder;
  final Widget? Function(BuildContext)? startBuilder;
  final Widget? Function(BuildContext)? endBuilder;
  final String email;
  final Function(String) onChangedEmail;
  final AsyncCallback onResetPasswordTapped;
  final VoidCallback? onBackToLoginTapped;
  final Alignment alignment;

  const ImpaktfullUiBBForgetPassword({
    required this.email,
    required this.onChangedEmail,
    required this.onResetPasswordTapped,
    this.topBuilder,
    this.startBuilder,
    this.endBuilder,
    this.bottomBuilder,
    this.onBackToLoginTapped,
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
                'Forgot password?',
                style: theme.textStyles.onCanvas.display.large,
              ),
              Text(
                'No problem, we will send you a link to reset your password.',
                style: theme.textStyles.onCardTertiary.text.small,
              ),
            ],
          ),
          ImpaktfullUiAutoLayout.vertical(
            spacing: 8,
            children: [
              ImpaktfullUiInputField(
                label: 'Email',
                placeholder: 'Enter your email',
                value: email,
                autofill: const [
                  AutofillHints.email,
                ],
                onChanged: onChangedEmail,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              ImpaktfullUiButton(
                type: ImpaktfullUiButtonType.primary,
                title: 'Reset password',
                fullWidth: true,
                onAsyncTap: onResetPasswordTapped,
              ),
              if (onBackToLoginTapped != null) ...[
                ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.linkGrey,
                  title: 'Back to login',
                  fullWidth: true,
                  onTap: onBackToLoginTapped,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
