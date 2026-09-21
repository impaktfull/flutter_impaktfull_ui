import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiBBLoginLocalizations extends ImpaktfullUiBBLocalizations {
  final String title;
  final String subtitle;
  final String emailInputLabel;
  final String emailInputPlaceholder;
  final String passwordInputLabel;
  final String passwordInputPlaceholder;
  final String loginBtn;
  final String createNewAccountBtn;

  static ImpaktfullUiBBLoginLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of(context);

  const ImpaktfullUiBBLoginLocalizations({
    this.title = 'Welcome back!',
    this.subtitle = 'Log in to your account to continue',
    this.emailInputLabel = 'Email',
    this.emailInputPlaceholder = 'Enter your email',
    this.passwordInputLabel = 'Password',
    this.passwordInputPlaceholder = 'Enter your password',
    this.loginBtn = 'Login',
    this.createNewAccountBtn = 'Create new account',
  });

  ImpaktfullUiBBLoginLocalizations copyWith({
    String? title,
    String? subtitle,
    String? emailInputLabel,
    String? emailInputPlaceholder,
    String? passwordInputLabel,
    String? passwordInputPlaceholder,
    String? loginBtn,
    String? createNewAccountBtn,
  }) =>
      ImpaktfullUiBBLoginLocalizations(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        emailInputLabel: emailInputLabel ?? this.emailInputLabel,
        emailInputPlaceholder:
            emailInputPlaceholder ?? this.emailInputPlaceholder,
        passwordInputLabel: passwordInputLabel ?? this.passwordInputLabel,
        passwordInputPlaceholder:
            passwordInputPlaceholder ?? this.passwordInputPlaceholder,
        loginBtn: loginBtn ?? this.loginBtn,
        createNewAccountBtn: createNewAccountBtn ?? this.createNewAccountBtn,
      );
}
