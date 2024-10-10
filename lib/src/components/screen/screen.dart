import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/nav_bar/nav_bar.dart';
import 'package:impaktfull_ui_2/src/components/screen/screen_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'screen_style.dart';

part 'screen.describe.dart';

class ImpaktfullUiScreen extends StatelessWidget with ComponentDescriptorMixin {
  final String? title;
  final String? subtitle;
  final VoidCallback? onBackTapped;
  final bool canPop;
  final VoidCallback? onPopInvoked;
  final Widget child;
  final List<Widget> actions;
  final Alignment fabAlignment;
  final Widget? fab;
  final Widget? bottomChild;
  final ImpaktfullUiScreenTheme? theme;

  const ImpaktfullUiScreen({
    required this.child,
    this.title,
    this.subtitle,
    this.onBackTapped,
    this.canPop = true,
    this.onPopInvoked,
    this.actions = const [],
    this.fabAlignment = Alignment.bottomRight,
    this.fab,
    this.bottomChild,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiScreenTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) {
        final hasNavbar = onBackTapped != null ||
            title != null ||
            subtitle != null ||
            actions.isNotEmpty;
        final hasBottomChild = bottomChild != null;
        return PopScope(
          onPopInvokedWithResult: (didPop, result) => onPopInvoked?.call(),
          canPop: canPop,
          child: Scaffold(
            backgroundColor: componentTheme.colors.background,
            body: ImpaktfullUiAutoLayout.vertical(
              children: [
                ImpaktfullUiNavBar(
                  title: title,
                  subtitle: subtitle,
                  onBackTapped: onBackTapped,
                  actions: actions,
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: hasNavbar,
                      removeBottom: hasBottomChild,
                      child: Stack(
                        alignment: fabAlignment,
                        children: [
                          Positioned.fill(
                            child: SizedBox(
                              child: child,
                            ),
                          ),
                          if (fab != null) ...[
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: fab!,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
                if (bottomChild != null) bottomChild!,
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
