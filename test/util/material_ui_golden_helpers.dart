// alchemist still builds its golden app with `package:flutter/material.dart`:
// the obscured font of a CI golden is in that `Theme`, so this file reads it.
// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart' as legacy;
import 'package:material_ui/material_ui.dart';

/// `GoldenTestThemeDataExtensions.obscuredTextFontFamily` of alchemist.
const _obscuredFontFamily = 'Ahem';

/// Gives [child] the `package:material_ui` theme that matches the
/// `package:flutter/material.dart` theme alchemist puts above a golden.
///
/// alchemist 0.14 wraps a golden in a `Theme` of `package:flutter/material
/// .dart`. For a CI golden that theme renders every text in the obscured
/// "Ahem" font, so a golden does not depend on the fonts of the machine.
/// impaktfull_ui reads the theme of `package:material_ui`, which is another
/// `Theme` widget, so without this the `MaterialApp` of `ImpaktfullUiApp`
/// would fall back to the default font and the CI goldens would change.
///
/// Remove it once alchemist builds its golden app with `package:material_ui`.
Widget withAlchemistMaterialUiTheme(Widget child) => Builder(
      builder: (context) {
        final fontFamily =
            legacy.Theme.of(context).textTheme.bodyMedium?.fontFamily;
        final fallback = ThemeData.fallback();
        final obscured = fontFamily == _obscuredFontFamily;
        return Theme(
          data: obscured
              ? fallback.copyWith(
                  textTheme: fallback.textTheme.apply(fontFamily: fontFamily),
                )
              : fallback,
          child: child,
        );
      },
    );
