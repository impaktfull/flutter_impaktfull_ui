import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/command_menu/command_menu_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class CommandMenuLibraryVariant
    extends ComponentLibraryVariant<CommandMenuLibraryPrimaryInputs> {
  const CommandMenuLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, CommandMenuLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiCommandMenu(
        shortcutActivator: const SingleActivator(
          LogicalKeyboardKey.keyK,
          meta: true,
        ),
        builder: (context, theme, controller) => CommandMenuWindow(
          onCloseWindow: () => controller.hide(),
          onInputChanged: (value) => inputs.input.updateState(value),
          hasBlurredBackground: inputs.blurBackground.value ?? false,
          padding: EdgeInsets.zero,
          marginInputField: const EdgeInsetsDirectional.all(16),
          bottomBuilder: (context) {
            if (inputs.input.value == null || inputs.input.value!.isEmpty) {
              return null;
            }
            return ImpaktfullUiListView.builder(
              items: List.generate(100, (i) => '${inputs.input.value}: $i'),
              itemBuilder: (context, item, index) => ImpaktfullUiListItem(
                title: item,
                onTap: () {
                  ImpaktfullUiNotification.show(title: 'On $item tapped');
                  controller.hide();
                },
              ),
              noDataLabel: 'No data found',
            );
          },
        ),
        child: Focus(
          autofocus: true,
          child: Container(
            color: theme.colors.accent,
            width: double.infinity,
            height: 500,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Center(
              child: ImpaktfullUiInputField(
                value: '',
                placeholder:
                    'If you are inside this input field, you can use the keyboard shortcut to open the command menu (cmd +k or win +)',
                onChanged: (value) {},
              ),
            ),
          ),
        ),
      ),
    ];
  }

  @override
  CommandMenuLibraryPrimaryInputs inputs() => CommandMenuLibraryPrimaryInputs();
}

class CommandMenuLibraryPrimaryInputs extends CommandMenuLibraryInputs {}
