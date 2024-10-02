import 'package:flutter/cupertino.dart';

class NativePageRoute<T> extends PageRouteBuilder<T> {
  final Function(BuildContext context) builder;

  NativePageRoute({
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
