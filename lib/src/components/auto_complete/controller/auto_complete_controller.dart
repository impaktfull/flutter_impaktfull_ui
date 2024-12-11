import 'package:impaktfull_ui_2/src/components/auto_complete/controller/auto_complete_controller_listener.dart';

class ImpaktfullUiAutoCompleteController {
  final Set<ImpaktfullUiAutoCompleteControllerListener> _listeners = {};

  void addListener(ImpaktfullUiAutoCompleteControllerListener listener) {
    _listeners.add(listener);
  }

  void removeListener(ImpaktfullUiAutoCompleteControllerListener listener) {
    _listeners.remove(listener);
  }

  void close({bool focusOnInput = true}) {
    for (final listener in _listeners) {
      listener.close(focusOnInput: focusOnInput);
    }
  }

  void clear() {
    for (final listener in _listeners) {
      listener.clear();
    }
  }

  void dispose() => _listeners.clear();
}
