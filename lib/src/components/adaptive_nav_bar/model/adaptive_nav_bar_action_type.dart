import 'package:impaktfull_ui/src/components/button/button.dart';

enum ImpaktfullUiAdaptiveNavBarActionItemType {
  primary(buttonType: ImpaktfullUiButtonType.primary),
  secondary(buttonType: ImpaktfullUiButtonType.secondary),
  secondaryGrey(buttonType: ImpaktfullUiButtonType.secondaryGrey),
  tertiary(buttonType: ImpaktfullUiButtonType.tertiary),
  tertiaryGrey(buttonType: ImpaktfullUiButtonType.tertiaryGrey),
  link(buttonType: ImpaktfullUiButtonType.link),
  linkGrey(buttonType: ImpaktfullUiButtonType.linkGrey),
  destructivePrimary(buttonType: ImpaktfullUiButtonType.destructivePrimary),
  destructiveSecondary(buttonType: ImpaktfullUiButtonType.destructiveSecondary),
  destructiveTertiary(buttonType: ImpaktfullUiButtonType.destructiveTertiary),
  destructiveLink(buttonType: ImpaktfullUiButtonType.destructiveLink);

  final ImpaktfullUiButtonType buttonType;

  const ImpaktfullUiAdaptiveNavBarActionItemType({
    required this.buttonType,
  });
}
