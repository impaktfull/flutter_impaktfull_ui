import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/command_menu/command_menu_style.dart';
import 'package:impaktfull_ui/src/components/command_menu/commander/commander.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export 'command_menu_style.dart';

part 'command_menu.describe.dart';

class ImpaktfullUiCommandMenu extends StatefulWidget
    with ComponentDescriptorMixin {
  final ShortcutActivator? shortcutActivator;
  final Widget child;
  final Widget Function(
      BuildContext context,
      ImpaktfullUiCommandMenuTheme theme,
      CommanderController controller) builder;
  final bool autofocus;
  final ImpaktfullUiCommandMenuTheme? theme;

  const ImpaktfullUiCommandMenu({
    required this.child,
    required this.builder,
    this.shortcutActivator,
    this.autofocus = false,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiCommandMenu> createState() =>
      _ImpaktfullUiCommandMenuState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiCommandMenuState extends State<ImpaktfullUiCommandMenu> {
  final _commanderController = CommanderController();

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiCommandMenuTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        final shortcutActivator = widget.shortcutActivator;
        if (widget.shortcutActivator == null) return widget.child;
        return CommanderConfiguratorWidget(
          commanderController: _commanderController,
          shortcutActivator: shortcutActivator!,
          builder: (context) => CallbackShortcuts(
            bindings: <ShortcutActivator, VoidCallback>{
              shortcutActivator: () => _commanderController.hide(),
            },
            child:
                widget.builder(context, componentTheme, _commanderController),
          ),
          child: Focus(
            autofocus: widget.autofocus,
            child: widget.child,
          ),
        );
      },
    );
  }
}
