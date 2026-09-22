import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/introduction/introduction_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class IntroductionLibraryVariant
    extends ComponentLibraryVariant<IntroductionLibraryPrimaryInputs> {
  const IntroductionLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, IntroductionLibraryPrimaryInputs inputs) {
    final icons = ImpaktfullUiTheme.of(context).assets.icons;
    return [
      SizedBox(
        height: 500,
        child: ImpaktfullUiIntroduction(
          pages: [
            ImpaktfullUiIntroductionPage(
              title: 'Welcome',
              subtitle:
                  'Everything you need to build your app, in one library.',
              asset: icons.home,
            ),
            ImpaktfullUiIntroductionPage(
              title: 'Stay in control',
              subtitle: 'Change every component with a theme.',
              asset: icons.edit,
            ),
            ImpaktfullUiIntroductionPage(
              title: 'Ready?',
              subtitle: 'Let us get started.',
              asset: icons.check,
            ),
          ],
          onSkip: () => ImpaktfullUiNotification.show(
            context: context,
            title: 'Skipped',
          ),
          onDone: () => ImpaktfullUiNotification.show(
            context: context,
            title: 'Done',
          ),
        ),
      ),
    ];
  }

  @override
  IntroductionLibraryPrimaryInputs inputs() =>
      IntroductionLibraryPrimaryInputs();
}

class IntroductionLibraryPrimaryInputs extends IntroductionLibraryInputs {}
