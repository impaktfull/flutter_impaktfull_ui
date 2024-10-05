import 'package:flutter/widgets.dart';

abstract class CommanderListener {
  void notifyListeners();

  OverlayState? getOverlayState();

  Widget buildCommander(BuildContext context);
}
