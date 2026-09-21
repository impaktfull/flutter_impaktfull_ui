import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiBBForgetPasswordLocalizations
    extends ImpaktfullUiBBLocalizations {
  final String title;
  final String subtitle;
  final String emailInputLabel;
  final String emailInputPlaceholder;
  final String resetPasswordBtn;
  final String backToLoginBtn;

  static ImpaktfullUiBBForgetPasswordLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiBBForgetPasswordLocalizations>(
          context);

  const ImpaktfullUiBBForgetPasswordLocalizations({
    this.title = 'Forgot password?',
    this.subtitle =
        'No problem, we will send you a link to reset your password.',
    this.emailInputLabel = 'Email',
    this.emailInputPlaceholder = 'Enter your email',
    this.resetPasswordBtn = 'Reset password',
    this.backToLoginBtn = 'Back to login',
  });

  ImpaktfullUiBBForgetPasswordLocalizations copyWith({
    String? title,
    String? subtitle,
    String? emailInputLabel,
    String? emailInputPlaceholder,
    String? resetPasswordBtn,
    String? backToLoginBtn,
  }) =>
      ImpaktfullUiBBForgetPasswordLocalizations(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        emailInputLabel: emailInputLabel ?? this.emailInputLabel,
        emailInputPlaceholder:
            emailInputPlaceholder ?? this.emailInputPlaceholder,
        resetPasswordBtn: resetPasswordBtn ?? this.resetPasswordBtn,
        backToLoginBtn: backToLoginBtn ?? this.backToLoginBtn,
      );
}
