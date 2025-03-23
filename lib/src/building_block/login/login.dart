import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/localization/localization_provider.dart';

export 'login.localizations.dart';

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
  final ImpaktfullUiBBLoginLocalizations? localizations;

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
    this.localizations,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiLocalizationProvider(
      localizations: localizations,
      builder: (context, localizations) => ImpaktfullUiUnifiedScreenLayout(
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
                  label: localizations.emailInputLabel,
                  placeholder: localizations.emailInputPlaceholder,
                  value: email,
                  onChanged: onChangedEmail,
                  autofill: const [
                    AutofillHints.email,
                  ],
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                ImpaktfullUiInputField(
                  label: localizations.passwordInputLabel,
                  placeholder: localizations.passwordInputPlaceholder,
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
                  title: localizations.loginBtn,
                  fullWidth: true,
                  onAsyncTap: onLoginTapped,
                ),
                if (onRegisterTapped != null) ...[
                  ImpaktfullUiButton(
                    type: ImpaktfullUiButtonType.linkGrey,
                    title: localizations.createNewAccountBtn,
                    fullWidth: true,
                    onTap: onRegisterTapped,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
