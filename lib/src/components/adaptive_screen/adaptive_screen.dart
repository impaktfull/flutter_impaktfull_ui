import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/adaptive_nav_bar/adaptive_nav_bar.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/responsive_layout/responsive_layout.dart';
import 'package:impaktfull_ui/src/components/screen/screen.dart';

class ImpaktfullUiAdaptiveScreen extends StatelessWidget {
  final String? title;
  final String? badge;
  final String? subtitle;
  final VoidCallback? onBackTapped;
  final List<ImpaktfullUiAdaptiveNavBarActionItem> actions;
  final bool isDrawerEnabled;
  final Widget? drawer;
  final Widget? floatingActionButton;

  /// Where the [floatingActionButton] is placed.
  ///
  /// Defaults to [AlignmentDirectional.bottomEnd]: the bottom right corner in
  /// a left-to-right layout and the bottom left corner in a right-to-left
  /// layout.
  final AlignmentGeometry floatingActionButtonAlignment;
  final Widget? headerBottomChild;
  final WidgetBuilder builder;
  final WidgetBuilder? mediumBuilder;
  final WidgetBuilder? largeBuilder;
  final WidgetBuilder? extraLargeBuilder;

  const ImpaktfullUiAdaptiveScreen({
    required this.builder,
    this.title,
    this.subtitle,
    this.onBackTapped,
    this.badge,
    this.isDrawerEnabled = false,
    this.drawer,
    Widget? floatingActionButton,
    @Deprecated('Use floatingActionButton instead. Will be removed in 1.0.0.')
    Widget? fab,
    AlignmentGeometry? floatingActionButtonAlignment,
    @Deprecated(
        'Use floatingActionButtonAlignment instead. Will be removed in 1.0.0.')
    Alignment? fabAlignment,
    this.headerBottomChild,
    this.mediumBuilder,
    this.largeBuilder,
    this.extraLargeBuilder,
    this.actions = const [],
    super.key,
  })  : floatingActionButtonAlignment = floatingActionButtonAlignment ??
            fabAlignment ??
            AlignmentDirectional.bottomEnd,
        floatingActionButton = floatingActionButton ?? fab;

  @Deprecated('Use floatingActionButton instead. Will be removed in 1.0.0.')
  Widget? get fab => floatingActionButton;

  @Deprecated(
      'Use floatingActionButtonAlignment instead. Will be removed in 1.0.0.')
  Alignment get fabAlignment =>
      // rtl-ignore: the deprecated getter returns the left-to-right alignment.
      floatingActionButtonAlignment.resolve(TextDirection.ltr);

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiScreen(
      drawer: drawer,
      child: Builder(
        builder: (context) {
          final hasNavbar = onBackTapped != null ||
              title != null ||
              subtitle != null ||
              actions.isNotEmpty;
          return ClipRect(
            child: ImpaktfullUiAutoLayout.vertical(
              children: [
                ImpaktfullUiAdaptiveNavBar(
                  title: title,
                  subtitle: subtitle,
                  badge: badge,
                  bottomChild: headerBottomChild,
                  onBackTapped: onBackTapped,
                  isDrawerOpen: isDrawerEnabled
                      ? ImpaktfullUiScreen.of(context).isDrawerOpen
                      : false,
                  onDrawerTapped: isDrawerEnabled
                      ? ImpaktfullUiScreen.of(context).openDrawer
                      : null,
                  actions: actions,
                ),
                Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: hasNavbar,
                    child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        alignment: floatingActionButtonAlignment,
                        children: [
                          Positioned.fill(
                            child: SizedBox(
                              child: ImpaktfullUiResponsiveLayout(
                                small: builder,
                                medium: mediumBuilder,
                                large: largeBuilder,
                                extraLarge: extraLargeBuilder,
                              ),
                            ),
                          ),
                          if (floatingActionButton != null) ...[
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: floatingActionButton!,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
