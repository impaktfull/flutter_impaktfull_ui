import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/responsive_layout/responsive_layout.dart';

extension ResponsiveExtension on BuildContext {
  bool get isSmallScreenOrBigger =>
      ImpaktfullUiResponsiveLayout.isSmallOrBigger(this);

  bool get isMediumScreenOrBigger =>
      ImpaktfullUiResponsiveLayout.isMediumOrBigger(this);

  bool get isLargeScreenOrBigger =>
      ImpaktfullUiResponsiveLayout.isLargeOrBigger(this);

  bool get isExtraLargeScreenOrBigger =>
      ImpaktfullUiResponsiveLayout.isExtraLargeOrBigger(this);

  bool get isSmallScreenOrSmaller =>
      ImpaktfullUiResponsiveLayout.isSmallOrSmaller(this);

  bool get isMediumScreenOrSmaller =>
      ImpaktfullUiResponsiveLayout.isMediumOrSmaller(this);

  bool get isLargeScreenOrSmaller =>
      ImpaktfullUiResponsiveLayout.isLargeOrSmaller(this);
}
