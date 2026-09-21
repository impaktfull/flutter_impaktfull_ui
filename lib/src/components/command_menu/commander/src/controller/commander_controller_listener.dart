import 'package:flutter/widgets.dart';

abstract class ImpaktfullUiCommandMenuListener {
  void notifyListeners();

  OverlayState? getOverlayState();

  Widget buildCommander(BuildContext context);
}
