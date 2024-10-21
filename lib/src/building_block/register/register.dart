import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/unified_screen_layout/unified_screen_layout.dart';

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
  final Alignment alignment;

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
        spacing: 8,
        children: [
          ImpaktfullUiInputField(
            label: 'Email',
            placeholder: 'Enter your email',
            value: email,
            onChanged: onChangedEmail,
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          ImpaktfullUiInputField(
            label: 'Password',
            placeholder: 'Enter your password',
            value: password,
            onChanged: onChangedPassword,
            obscureText: true,
            textInputAction: TextInputAction.done,
          ),
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Register',
            fullWidth: true,
            onAsyncTap: onRegisterTapped,
          ),
        ],
      ),
    );
  }
}
