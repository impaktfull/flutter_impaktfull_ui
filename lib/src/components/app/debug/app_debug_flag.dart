import 'package:flutter/material.dart';

class AppDebugFlag extends StatelessWidget {
  final bool showDebugFlag;
  final String? flavorBannerText;
  final Color flavorBannerColor;
  final Widget child;

  const AppDebugFlag({
    required this.showDebugFlag,
    required this.flavorBannerText,
    required this.child,
    required this.flavorBannerColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final showFlavorBannerFlag = flavorBannerText != null;
    if (!showDebugFlag && !showFlavorBannerFlag) return child;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Builder(
        builder: (context) {
          Widget child = this.child;
          if (showDebugFlag) {
            child = Banner(
              message: 'Debug',
              location: BannerLocation.topEnd,
              child: child,
            );
          }
          if (showFlavorBannerFlag) {
            child = Banner(
              message: flavorBannerText!,
              location: BannerLocation.topStart,
              color: flavorBannerColor,
              child: child,
            );
          }

          return child;
        },
      ),
    );
  }
}
