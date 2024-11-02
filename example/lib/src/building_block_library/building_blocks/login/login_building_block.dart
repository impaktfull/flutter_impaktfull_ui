import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';

class LoginBuildingBlock extends BuildingBlockLibraryItem {
  const LoginBuildingBlock();

  @override
  String get title => 'ImpaktfullUiBBLogin';

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiBBLogin(
      email: 'email',
      password: 'password',
      onChangedEmail: (value) {},
      onChangedPassword: (value) {},
      onLoginTapped: () => Future.delayed(const Duration(seconds: 2)),
      onRegisterTapped: () => ImpaktfullUiNavigator.instance.goBack(),
      endBuilder: (context) {
        if (ImpaktfullUiResponsiveLayout.isMedium(context)) {
          return null;
        }
        return Expanded(
          child: Container(
            height: double.infinity,
            color: theme.colors.accent,
            padding: const EdgeInsets.all(32),
            alignment: Alignment.center,
            child: ImpaktfullUiAutoLayout.vertical(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 4,
              children: [
                ImpaktfullUiAssetWidget(
                  asset: theme.assets.icons.confetti,
                  color: theme.colors.textOnAccent,
                  size: 64,
                ),
                Text(
                  'Make an impakt on your customers!',
                  style: theme.textStyles.onAccent.display.small,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Make an impakt on your customers!',
                  style: theme.textStyles.onAccent.text.medium.withOpacity(0.66),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
