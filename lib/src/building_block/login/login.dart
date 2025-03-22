import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullUiBBLogin extends StatelessWidget {
  final WidgetBuilder? topBuilder;
  final WidgetBuilder? bottomBuilder;
  final Widget? Function(BuildContext)? startBuilder;
  final Widget? Function(BuildContext)? endBuilder;
  final String email;
  final String password;
  final Function(String) onChangedEmail;
  final Function(String) onChangedPassword;
  final AsyncCallback onLoginTapped;
  final VoidCallback? onRegisterTapped;
  final Alignment alignment;
  final ImpaktfullUiLoginLocalizations localizations;

  const ImpaktfullUiBBLogin({
    required this.email,
    required this.password,
    required this.onChangedEmail,
    required this.onChangedPassword,
    required this.onLoginTapped,
    this.topBuilder,
    this.startBuilder,
    this.endBuilder,
    this.bottomBuilder,
    this.onRegisterTapped,
    this.alignment = Alignment.center,
    this.localizations = const ImpaktfullUiLoginLocalizations(),
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
                localizations.title,
                style: theme.textStyles.onCanvas.display.large,
              ),
              Text(
                localizations.subtitle,
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
                onChanged: onChangedEmail,
                autofill: const [
                  AutofillHints.email,
                ],
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              ImpaktfullUiInputField(
                label: 'Password',
                placeholder: 'Enter your password',
                value: password,
                onChanged: onChangedPassword,
                autofill: const [
                  AutofillHints.password,
                ],
                obscureText: true,
                textInputAction: TextInputAction.done,
              ),
              ImpaktfullUiButton(
                type: ImpaktfullUiButtonType.primary,
                title: 'Login',
                fullWidth: true,
                onAsyncTap: onLoginTapped,
              ),
              if (onRegisterTapped != null) ...[
                ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.linkGrey,
                  title: 'Create new account',
                  fullWidth: true,
                  onTap: onRegisterTapped,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class ImpaktfullUiLoginLocalizations {
  final String title;
  final String subtitle;
  final String emailInputLabel;
  final String passwordInputLabel;
  final String loginBtn;
  final String createNewAccountBtn;

  const ImpaktfullUiLoginLocalizations({
    this.title = 'Welcome back!',
    this.subtitle = 'Log in to your account to continue',
    this.emailInputLabel = 'Email',
    this.passwordInputLabel = 'Password',
    this.loginBtn = 'Login',
    this.createNewAccountBtn = 'Create new account',
  });
}
