import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/responsive_layout/responsive_layout.dart';

// Deprecated: an unprefixed extension on BuildContext of every app that
// imports this package. Use the static helpers of ImpaktfullUiResponsiveLayout
// instead. The library itself does not use it. See doc/migrations/1.0.0.md.
@Deprecated(
    'Use the static helpers of ImpaktfullUiResponsiveLayout instead. This extension will no longer be exported in 1.0.0.')
extension ResponsiveExtension on BuildContext {
  @Deprecated(
      'Use ImpaktfullUiResponsiveLayout.isSmallOrBigger(context) instead. Will be removed in 1.0.0.')
  bool get isSmallScreenOrBigger =>
      ImpaktfullUiResponsiveLayout.isSmallOrBigger(this);

  @Deprecated(
      'Use ImpaktfullUiResponsiveLayout.isMediumOrBigger(context) instead. Will be removed in 1.0.0.')
  bool get isMediumScreenOrBigger =>
      ImpaktfullUiResponsiveLayout.isMediumOrBigger(this);

  @Deprecated(
      'Use ImpaktfullUiResponsiveLayout.isLargeOrBigger(context) instead. Will be removed in 1.0.0.')
  bool get isLargeScreenOrBigger =>
      ImpaktfullUiResponsiveLayout.isLargeOrBigger(this);

  @Deprecated(
      'Use ImpaktfullUiResponsiveLayout.isExtraLargeOrBigger(context) instead. Will be removed in 1.0.0.')
  bool get isExtraLargeScreenOrBigger =>
      ImpaktfullUiResponsiveLayout.isExtraLargeOrBigger(this);

  @Deprecated(
      'Use ImpaktfullUiResponsiveLayout.isSmallOrSmaller(context) instead. Will be removed in 1.0.0.')
  bool get isSmallScreenOrSmaller =>
      ImpaktfullUiResponsiveLayout.isSmallOrSmaller(this);

  @Deprecated(
      'Use ImpaktfullUiResponsiveLayout.isMediumOrSmaller(context) instead. Will be removed in 1.0.0.')
  bool get isMediumScreenOrSmaller =>
      ImpaktfullUiResponsiveLayout.isMediumOrSmaller(this);

  @Deprecated(
      'Use ImpaktfullUiResponsiveLayout.isLargeOrSmaller(context) instead. Will be removed in 1.0.0.')
  bool get isLargeScreenOrSmaller =>
      ImpaktfullUiResponsiveLayout.isLargeOrSmaller(this);
}
