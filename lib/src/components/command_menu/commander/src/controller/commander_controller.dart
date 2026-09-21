import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/command_menu/commander/src/controller/commander_controller_listener.dart';

class ImpaktfullUiCommandMenuController {
  static final instance = ImpaktfullUiCommandMenuController();

  OverlayEntry? _entry;

  ImpaktfullUiCommandMenuListener? _listener;

  OverlayState? get _overlayState => _listener?.getOverlayState();

  bool get isShowingCommandMenu => _entry != null;

  void show() {
    final entry = OverlayEntry(
      builder: (context) =>
          _listener?.buildCommander(context) ?? const SizedBox(),
    );
    _overlayState?.insert(entry);
    _entry = entry;
  }

  void hide() {
    _entry?.remove();
    _entry = null;
    notifyListeners();
  }

  void attach(ImpaktfullUiCommandMenuListener listener) {
    _listener = listener;
  }

  void detach(ImpaktfullUiCommandMenuListener listener) {
    _listener = null;
  }

  void notifyListeners() => _listener?.notifyListeners();
}
