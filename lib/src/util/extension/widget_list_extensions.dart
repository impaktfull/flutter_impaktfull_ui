import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/icon_button/icon_button.dart';

extension WidgetListExtension on List<Widget> {
  List<Widget> overrideColorOnWidgets(Color color) => map((widget) {
        if (widget is ImpaktfullUiAssetWidget) {
          return widget.overrideColor(color);
        }
        if (widget is ImpaktfullUiIconButton) {
          return widget.overrideColor(color);
        }
        return widget;
      }).toList();
}
