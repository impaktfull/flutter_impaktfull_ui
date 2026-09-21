import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiBBVerifyRegisterCodeLocalizations
    extends ImpaktfullUiBBLocalizations {
  final String title;
  final String subtitle;
  final String codeInputLabel;
  final String codeInputPlaceholder;
  final String verifyBtn;
  final String backBtn;

  static ImpaktfullUiBBVerifyRegisterCodeLocalizations of(
          BuildContext context) =>
      ImpaktfullUiLocalizations.of<
          ImpaktfullUiBBVerifyRegisterCodeLocalizations>(context);

  const ImpaktfullUiBBVerifyRegisterCodeLocalizations({
    this.title = "You've got mail",
    this.subtitle = 'Enter the verification code you received by email',
    this.codeInputLabel = 'Verification code',
    this.codeInputPlaceholder = 'Enter your verification code',
    this.verifyBtn = 'Verify',
    this.backBtn = 'Go back',
  });

  ImpaktfullUiBBVerifyRegisterCodeLocalizations copyWith({
    String? title,
    String? subtitle,
    String? codeInputLabel,
    String? codeInputPlaceholder,
    String? verifyBtn,
    String? backBtn,
  }) =>
      ImpaktfullUiBBVerifyRegisterCodeLocalizations(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        codeInputLabel: codeInputLabel ?? this.codeInputLabel,
        codeInputPlaceholder: codeInputPlaceholder ?? this.codeInputPlaceholder,
        verifyBtn: verifyBtn ?? this.verifyBtn,
        backBtn: backBtn ?? this.backBtn,
      );
}
