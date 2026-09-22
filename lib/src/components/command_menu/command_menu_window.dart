import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/card/card.dart';
import 'package:impaktfull_ui/src/components/command_menu/command_menu.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/util/accessibility/accessibility.localizations.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiCommandMenuWindow extends StatefulWidget {
  final String? value;
  final ValueChanged<String> onInputChanged;
  final VoidCallback onCloseWindow;
  final bool hasBlurredBackground;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry marginInputField;
  final ImpaktfullUiCommandMenuTheme? theme;
  final Widget? Function(BuildContext context)? bottomBuilder;

  const ImpaktfullUiCommandMenuWindow({
    required this.onInputChanged,
    required this.onCloseWindow,
    this.value,
    this.bottomBuilder,
    this.padding = const EdgeInsets.all(16),
    this.marginInputField = EdgeInsets.zero,
    this.theme,
    this.hasBlurredBackground = false,
    super.key,
  });

  @override
  State<ImpaktfullUiCommandMenuWindow> createState() =>
      _CommandMenuWindowState();
}

class _CommandMenuWindowState extends State<ImpaktfullUiCommandMenuWindow> {
  late final TextEditingController _textEditingController;
  final _foucsNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.value ?? '');
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _foucsNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      // A modal window for screen readers: the content behind it is hidden
      // and the dismiss action closes it.
      builder: (context, componentTheme) => Semantics(
        scopesRoute: true,
        namesRoute: true,
        explicitChildNodes: true,
        label: ImpaktfullUiAccessibilityLocalizations.of(context).commandMenu,
        onDismiss: widget.onCloseWindow,
        child: BlockSemantics(
          child: Actions(
            actions: {
              DismissIntent: CallbackAction<DismissIntent>(
                onInvoke: (intent) => widget.onCloseWindow(),
              ),
            },
            child: LayoutBuilder(
              builder: (context, constraints) => Stack(
                children: [
                  if (widget.hasBlurredBackground) ...[
                    Positioned.fill(
                      child: Opacity(
                        opacity: 1,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 8,
                            sigmaY: 8,
                          ),
                          child: Container(),
                        ),
                      ),
                    ),
                  ],
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: widget.onCloseWindow,
                      // Screen readers use the dismiss action of the window.
                      excludeFromSemantics: true,
                      child: const ColoredBox(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  Positioned.directional(
                    start: 0,
                    end: 0,
                    top: constraints.maxHeight / 3,
                    bottom: 0,
                    textDirection: Directionality.of(context),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final bottomChild = widget.bottomBuilder != null
                                ? widget.bottomBuilder!(context)
                                : null;
                            return ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: min(constraints.maxWidth, 800),
                                maxHeight: min(constraints.maxHeight, 800),
                              ),
                              child: GestureDetector(
                                excludeFromSemantics: true,
                                onTap: () {
                                  // cancel the close window
                                },
                                child: _buildKeyboardNavigation(
                                  ImpaktfullUiCard(
                                    padding: widget.padding,
                                    borderRadius: componentTheme
                                        .dimens.windowBorderRadius,
                                    child: ImpaktfullUiAutoLayout.vertical(
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: 8,
                                      children: [
                                        Padding(
                                          padding: widget.marginInputField,
                                          child: ImpaktfullUiInputField(
                                            value: '',
                                            autofocus: true,
                                            focusNode: _foucsNode,
                                            controller: _textEditingController,
                                            onChanged: _onInputChanged,
                                          ),
                                        ),
                                        if (bottomChild != null) ...[
                                          // At most 200 high, less when there
                                          // is not enough space (small screens).
                                          Flexible(
                                            child: SizedBox(
                                              height: 200,
                                              child: bottomChild,
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Keeps the keyboard focus in the window (tab and shift+tab cycle
  /// between the input and the results) and moves it with the arrow keys:
  /// down from the input goes to the first result, enter or space selects
  /// the focused result.
  Widget _buildKeyboardNavigation(Widget child) {
    return FocusScope(
      child: Shortcuts(
        shortcuts: const <ShortcutActivator, Intent>{
          SingleActivator(LogicalKeyboardKey.arrowDown): NextFocusIntent(),
          SingleActivator(LogicalKeyboardKey.arrowUp): PreviousFocusIntent(),
        },
        child: FocusTraversalGroup(child: child),
      ),
    );
  }

  void _onInputChanged(String value) {
    widget.onInputChanged(value);
    setState(() {});
  }
}
