import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/building_block/forget_password/forget_password.localizations.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/components/unified_screen_layout/unified_screen_layout.dart';
import 'package:impaktfull_ui/src/components/localization/localization_provider.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

export 'forget_password.localizations.dart';

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
  final ImpaktfullUiBBForgetPasswordLocalizations? localizations;

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
    this.localizations,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiLocalizationProvider<
        ImpaktfullUiBBForgetPasswordLocalizations>(
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
                  autofill: const [
                    AutofillHints.email,
                  ],
                  onChanged: onChangedEmail,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.primary,
                  title: localizations.resetPasswordBtn,
                  fullWidth: true,
                  onAsyncTap: onResetPasswordTapped,
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
