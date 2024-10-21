import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';

class ImpaktfullUiBBLogin extends StatelessWidget {
  final WidgetBuilder? topBuilder;
  final WidgetBuilder? bottomBuilder;
  final Widget? Function(BuildContext)? startBuilder;
  final Widget? Function(BuildContext)? endBuilder;
  final String email;
  final String password;
  final Function(String) onChangedEmail;
  final Function(String) onChangedPassword;
  final Alignment? alignment;
  final AsyncCallback onLoginTapped;

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
    this.alignment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final startWidget = startBuilder?.call(context);
    final endWidget = endBuilder?.call(context);
    return ImpaktfullUiAutoLayout.horizontal(
      children: [
        if (startWidget != null) startWidget,
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.all(16).add(MediaQuery.paddingOf(context)),
            child: ImpaktfullUiClampedFractionallySizedBox(
              widthFactor: 0.5,
              minWidth: 700,
              maxWidth: 800,
              child: ImpaktfullUiAutoLayout.vertical(
                // TODO move the align to MainAxisAlignment to an extension
                mainAxisAlignment:
                    alignment == null || alignment == Alignment.center
                        ? MainAxisAlignment.center
                        : alignment!.y < 1
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                children: [
                  if (topBuilder != null) ...[
                    Expanded(
                      child: topBuilder!(context),
                    ),
                  ],
                  ImpaktfullUiAutoLayout.vertical(
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
                        title: 'Login',
                        fullWidth: true,
                        onAsyncTap: onLoginTapped,
                      ),
                    ],
                  ),
                  if (bottomBuilder != null) ...[
                    Expanded(
                      child: bottomBuilder!(context),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        if (endWidget != null) endWidget,
      ],
    );
  }
}
