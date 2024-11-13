import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/page_route/desktop_page_route.dart';
import 'package:impaktfull_ui_2/src/util/device_util/device_util.dart';

class ImpaktfullUIAdaptivePageRoute {
  ImpaktfullUIAdaptivePageRoute._();
  static PageRoute<T> create<T>({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool fullscreenDialog = false,
  }) {
    if (!DeviceUtil.isDesktop()) {
      return ImpaktfullUiDesktopPageRoute<T>(
        builder: builder,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
    } else {
      return MaterialPageRoute<T>(
        builder: builder,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
    }
  }
}
