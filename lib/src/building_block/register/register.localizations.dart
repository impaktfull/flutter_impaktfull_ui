import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiBBRegisterLocalizations extends ImpaktfullUiBBLocalizations {
  final String title;
  final String subtitle;
  final String emailInputLabel;
  final String emailInputPlaceholder;
  final String passwordInputLabel;
  final String passwordInputPlaceholder;
  final String registerBtn;
  final String backToLoginBtn;

  static ImpaktfullUiBBRegisterLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiBBRegisterLocalizations>(
          context);

  const ImpaktfullUiBBRegisterLocalizations({
    this.title = 'Hi there!',
    this.subtitle = 'Create your account to get started',
    this.emailInputLabel = 'Email',
    this.emailInputPlaceholder = 'Enter your email',
    this.passwordInputLabel = 'Password',
    this.passwordInputPlaceholder = 'Enter your password',
    this.registerBtn = 'Register',
    this.backToLoginBtn = 'Back to login',
  });

  ImpaktfullUiBBRegisterLocalizations copyWith({
    String? title,
    String? subtitle,
    String? emailInputLabel,
    String? emailInputPlaceholder,
    String? passwordInputLabel,
    String? passwordInputPlaceholder,
    String? registerBtn,
    String? backToLoginBtn,
  }) =>
      ImpaktfullUiBBRegisterLocalizations(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        emailInputLabel: emailInputLabel ?? this.emailInputLabel,
        emailInputPlaceholder:
            emailInputPlaceholder ?? this.emailInputPlaceholder,
        passwordInputLabel: passwordInputLabel ?? this.passwordInputLabel,
        passwordInputPlaceholder:
            passwordInputPlaceholder ?? this.passwordInputPlaceholder,
        registerBtn: registerBtn ?? this.registerBtn,
        backToLoginBtn: backToLoginBtn ?? this.backToLoginBtn,
      );
}
