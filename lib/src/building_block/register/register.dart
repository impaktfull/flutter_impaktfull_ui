import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/building_block/register/register.localizations.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/components/unified_screen_layout/unified_screen_layout.dart';
import 'package:impaktfull_ui/src/components/localization/localization_provider.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

export 'register.localizations.dart';

class ImpaktfullUiBBRegister extends StatelessWidget {
  final WidgetBuilder? topBuilder;
  final WidgetBuilder? bottomBuilder;
  final Widget? Function(BuildContext)? startBuilder;
  final Widget? Function(BuildContext)? endBuilder;
  final String email;
  final String password;
  final Function(String) onChangedEmail;
  final Function(String) onChangedPassword;
  final AsyncCallback onRegisterTapped;
  final VoidCallback? onBackToLoginTapped;
  final Alignment alignment;
  final ImpaktfullUiBBRegisterLocalizations? localizations;

  const ImpaktfullUiBBRegister({
    required this.email,
    required this.password,
    required this.onChangedEmail,
    required this.onChangedPassword,
    required this.onRegisterTapped,
    this.topBuilder,
    this.startBuilder,
    this.endBuilder,
    this.bottomBuilder,
    this.onBackToLoginTapped,
    this.alignment = Alignment.center,
    this.localizations,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ImpaktfullUiTheme.of(context);
    return ImpaktfullUiLocalizationProvider<
        ImpaktfullUiBBRegisterLocalizations>(
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
              spacing: 16,
              children: [
                ImpaktfullUiInputField(
                  label: localizations.emailInputLabel,
                  placeholder: localizations.emailInputPlaceholder,
                  value: email,
                  autofill: const [
                    AutofillHints.email,
                    AutofillHints.newUsername,
                  ],
                  onChanged: onChangedEmail,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                ImpaktfullUiInputField(
                  label: localizations.passwordInputLabel,
                  placeholder: localizations.passwordInputPlaceholder,
                  value: password,
                  autofill: const [
                    AutofillHints.newPassword,
                  ],
                  onChanged: onChangedPassword,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                ),
                ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.primary,
                  title: localizations.registerBtn,
                  fullWidth: true,
                  onAsyncTap: onRegisterTapped,
                ),
                if (onBackToLoginTapped != null) ...[
                  ImpaktfullUiButton(
                    type: ImpaktfullUiButtonType.linkGrey,
                    title: localizations.backToLoginBtn,
                    fullWidth: true,
                    onTap: onBackToLoginTapped,
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
