import 'package:flutter/cupertino.dart';

class ImpaktfullUiDesktopPageRoute<T> extends PageRouteBuilder<T> {
  final Widget Function(BuildContext context) builder;

  ImpaktfullUiDesktopPageRoute({
    required this.builder,
    super.settings,
    super.fullscreenDialog,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              child,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
}
