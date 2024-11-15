import 'package:flutter/services.dart';
import 'package:impaktfull_ui_2/src/components/virtual_keyboard/model/config/virtual_keyboard_config.dart';
import 'package:impaktfull_ui_2/src/components/virtual_keyboard/model/virtual_keyboard_key.dart';

class ImpaktfullUiVirtualQwertyKeyboardConfig extends VirtualKeyboardConfig {
  @override
  List<List<ImpaktfullUiVirtualKeyboardKeyItem>> get keys => const [
        [
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.backquote,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.tilde,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.digit1,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.exclamation,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.digit2,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.at,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.digit3,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.numberSign,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.digit4,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.dollar,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.digit5,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.percent,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.digit6,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.caret,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.digit7,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.ampersand,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.digit8,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.asterisk,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.digit9,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.parenthesisLeft,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.digit0,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.parenthesisRight,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.minus,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.underscore,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.equal,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.add,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              label: 'Backspace',
              key: LogicalKeyboardKey.backspace,
            ),
            flex: 2,
          ),
        ],
        [
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              label: 'Tab',
              key: LogicalKeyboardKey.tab,
              value: '\t',
            ),
            flex: 2,
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyQ,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyW,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyE,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyR,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyT,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyY,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyU,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyI,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyO,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyP,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.bracketLeft,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.braceLeft,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.bracketRight,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.braceRight,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.backslash,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.bar,
            ),
            flex: 2,
          ),
        ],
        [
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              label: 'Caps Lock',
              key: LogicalKeyboardKey.capsLock,
            ),
            flex: 2,
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyA,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyS,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyD,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyF,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyG,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyH,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyJ,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyK,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyL,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.semicolon,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.colon,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.quoteSingle,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.quote,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              label: 'Enter',
              key: LogicalKeyboardKey.enter,
              value: '\n',
            ),
            flex: 2,
          ),
        ],
        [
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              label: 'Shift',
              key: LogicalKeyboardKey.shiftLeft,
            ),
            flex: 2,
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyZ,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyX,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyC,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyV,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyB,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyN,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.keyM,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.comma,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.less,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.period,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.greater,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.slash,
            ),
            shiftKey: ImpaktfullUiVirtualKeyboardKey(
              key: LogicalKeyboardKey.question,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              label: 'Shift',
              key: LogicalKeyboardKey.shiftRight,
            ),
            flex: 2,
          ),
        ],
        [
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              label: 'Ctrl',
              key: LogicalKeyboardKey.controlLeft,
            ),
            flex: 2,
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              label: '',
              key: LogicalKeyboardKey.space,
              value: ' ',
            ),
            flex: 6,
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              label: '←',
              key: LogicalKeyboardKey.arrowLeft,
            ),
          ),
          ImpaktfullUiVirtualKeyboardKeyItem(
            defaultKey: ImpaktfullUiVirtualKeyboardKey(
              label: '→',
              key: LogicalKeyboardKey.arrowRight,
            ),
          ),
        ],
      ];
}
