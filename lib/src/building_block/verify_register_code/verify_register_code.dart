import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/building_block/verify_register_code/verify_register_code.localizations.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/components/unified_screen_layout/unified_screen_layout.dart';
import 'package:impaktfull_ui/src/components/localization/localization_provider.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

export 'verify_register_code.localizations.dart';

class ImpaktfullUiBBVerifyRegisterCode extends StatelessWidget {
  final WidgetBuilder? topBuilder;
  final WidgetBuilder? bottomBuilder;
  final Widget? Function(BuildContext)? startBuilder;
  final Widget? Function(BuildContext)? endBuilder;
  final String code;
  final ValueChanged<String> onCodeChanged;
  final AsyncCallback onVerifyCodeTapped;
  final VoidCallback? onBackTapped;
  final Alignment alignment;
  final ImpaktfullUiBBVerifyRegisterCodeLocalizations? localizations;

  const ImpaktfullUiBBVerifyRegisterCode({
    required this.code,
    // `onCodeChanged` becomes `required` again in 1.0.0, when
    // `onChangedVerificationCode` is removed.
    ValueChanged<String>? onCodeChanged,
    @Deprecated('Use onCodeChanged instead. Will be removed in 1.0.0.')
    Function(String)? onChangedVerificationCode,
    required this.onVerifyCodeTapped,
    this.topBuilder,
    this.startBuilder,
    this.endBuilder,
    this.bottomBuilder,
    this.onBackTapped,
    this.alignment = Alignment.center,
    this.localizations,
    super.key,
  })  : assert(onCodeChanged != null || onChangedVerificationCode != null,
            'onCodeChanged is required'),
        onCodeChanged = (onCodeChanged ?? onChangedVerificationCode)
            as ValueChanged<String>;

  @Deprecated('Use onCodeChanged instead. Will be removed in 1.0.0.')
  Function(String) get onChangedVerificationCode => onCodeChanged;

  @override
  Widget build(BuildContext context) {
    final theme = ImpaktfullUiTheme.of(context);
    return ImpaktfullUiLocalizationProvider<
        ImpaktfullUiBBVerifyRegisterCodeLocalizations>(
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
                  label: localizations.codeInputLabel,
                  placeholder: localizations.codeInputPlaceholder,
                  value: code,
                  autofill: const [
                    AutofillHints.oneTimeCode,
                  ],
                  onChanged: onCodeChanged,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.primary,
                  title: localizations.verifyBtn,
                  fullWidth: true,
                  onAsyncTap: onVerifyCodeTapped,
                ),
                if (onBackTapped != null) ...[
                  ImpaktfullUiButton(
                    type: ImpaktfullUiButtonType.linkGrey,
                    title: localizations.backBtn,
                    fullWidth: true,
                    onTap: onBackTapped,
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
