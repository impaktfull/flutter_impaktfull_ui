import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/command_menu/commander/src/controller/commander_controller.dart';
import 'package:impaktfull_ui/src/components/command_menu/commander/src/controller/commander_controller_listener.dart';

class CommanderConfiguratorWidget extends StatefulWidget {
  final Widget child;
  final CommanderController? commanderController;
  final WidgetBuilder builder;
  final TextDirection textDirection;
  final ShortcutActivator shortcutActivator;

  const CommanderConfiguratorWidget({
    required this.child,
    required this.builder,
    required this.shortcutActivator,
    this.commanderController,
    this.textDirection = TextDirection.ltr,
    super.key,
  });

  @override
  State<CommanderConfiguratorWidget> createState() => _CommanderConfiguratorWidgetState();
}

class _CommanderConfiguratorWidgetState extends State<CommanderConfiguratorWidget> implements CommanderListener {
  CommanderController get commanderController => widget.commanderController ?? CommanderController.instance;

  @override
  void initState() {
    commanderController.attach(this);
    super.initState();
  }

  @override
  void dispose() {
    commanderController.detach(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        widget.shortcutActivator: _onShortcutActivated,
      },
      child: widget.child,
    );
  }

  @override
  OverlayState? getOverlayState() {
    var navigator = Navigator.maybeOf(context);
    void visitor(Element element) {
      if (navigator != null) return;
      if (element.widget is Navigator) {
        navigator = (element as StatefulElement).state as NavigatorState?;
      } else {
        element.visitChildElements(visitor);
      }
    }

    context.visitChildElements(visitor);

    assert(navigator != null, '''It looks like you are not using Navigator in your app.
         Did you wrapped you app widget like this?
         CommanderConfiguratorWidget(
           app: MaterialApp(
             title: 'Commander Example',
             home: HomeScren(),
           ),
         )
      ''');
    return navigator?.overlay;
  }

  @override
  void notifyListeners() {
    if (!mounted) return;
    setState(() {});
  }

  void _onShortcutActivated() {
    commanderController.isShowingCommandMenu ? commanderController.hide() : commanderController.show();
  }

  @override
  Widget buildCommander(BuildContext context) => widget.builder(context);
}
