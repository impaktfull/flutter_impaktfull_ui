import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/color_input_field/color_input_field.localizations.dart';
import 'package:impaktfull_ui/src/components/color_input_field/color_input_field_style.dart';
import 'package:impaktfull_ui/src/components/color_picker/color_picker.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/components/modal/modal.dart';
import 'package:impaktfull_ui/src/components/section_title/section_title.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'color_input_field.localizations.dart';
export 'color_input_field_style.dart';

class ImpaktfullUiColorInputField extends StatefulWidget {
  final String? label;
  final Color? initialColor;
  final ValueChanged<Color>? onChanged;
  final List<Color>? colorPickerColors;
  final ImpaktfullUiColorPickerType? colorPickerType;
  final bool alphaEnabled;
  final ImpaktfullUiColorInputFieldTheme? theme;

  /// The texts of the color input field. Defaults to the localizations of
  /// the app.
  final ImpaktfullUiColorInputFieldLocalizations? localizations;

  const ImpaktfullUiColorInputField({
    this.label,
    this.initialColor,
    this.onChanged,
    this.alphaEnabled = false,
    this.colorPickerColors,
    this.colorPickerType,
    this.theme,
    this.localizations,
    super.key,
  });

  @override
  State<ImpaktfullUiColorInputField> createState() =>
      _ImpaktfullUiColorInputFieldState();
}

class _ImpaktfullUiColorInputFieldState
    extends State<ImpaktfullUiColorInputField> {
  late TextEditingController _colorController;
  String _hexColor = '';
  Color? _color;

  @override
  void initState() {
    super.initState();
    _color = widget.initialColor;
    _hexColor = _colorToHex(_color);
    _colorController = TextEditingController(text: _hexColor);
  }

  @override
  void dispose() {
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        return ImpaktfullUiAutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            if (widget.label != null) ...[
              ImpaktfullUiSectionTitle(
                title: widget.label!,
                margin: EdgeInsets.zero,
              ),
            ],
            ImpaktfullUiAutoLayout.horizontal(
              spacing: componentTheme.dimens.spacing,
              children: [
                ImpaktfullUiTouchFeedback(
                  onTap: widget.colorPickerType == null ? null : _onTap,
                  borderRadius: componentTheme.dimens.borderRadius,
                  border: Border.all(
                    color: componentTheme.colors.border,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    width: componentTheme.dimens.borderWidth,
                  ),
                  color: _color ?? Colors.transparent,
                  child: SizedBox(
                    width: componentTheme.dimens.swatchSize,
                    height: componentTheme.dimens.swatchSize,
                  ),
                ),
                Expanded(
                  child: ImpaktfullUiInputField(
                    controller: _colorController,
                    value: _hexColor,
                    placeholder: '#000000',
                    onChanged: widget.onChanged != null ? _onChanged : null,
                    textInputType: TextInputType.text,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _onChanged(String value) {
    var hexValue = value.replaceAll('#', '');
    var shouldSetText = false;
    final maxLength = widget.alphaEnabled
        ? 8
        : 6; // 8 for RRGGBBAA, 6 for RRGGBB (without hashtags)
    if (hexValue.length > maxLength) {
      hexValue = hexValue.substring(0, maxLength);
      _colorController.text = hexValue;
      shouldSetText = true;
    }

    final color = _hexToColor(hexValue);
    if (widget.onChanged != null && color != null) {
      widget.onChanged!(color);
    }
    if (!hexValue.startsWith('#')) {
      hexValue = '#$hexValue';
      _colorController.text = hexValue;
      shouldSetText = true;
    }
    if (shouldSetText) {
      _colorController.selection =
          TextSelection.collapsed(offset: hexValue.length);
    }
    setState(() {
      _hexColor = hexValue;
      _color = color;
    });
  }

  /// Parses `RGB`, `RRGGBB` and, when [ImpaktfullUiColorInputField.alphaEnabled]
  /// is true, `RGBA` and `RRGGBBAA` (with or without a leading `#`).
  Color? _hexToColor(String hex) {
    var cleanHex = hex.replaceAll('#', '').trim();
    final validLengths =
        widget.alphaEnabled ? const [3, 4, 6, 8] : const [3, 6];
    if (!validLengths.contains(cleanHex.length)) return null;
    if (!RegExp(r'^[0-9a-fA-F]+$').hasMatch(cleanHex)) return null;
    if (cleanHex.length == 3 || cleanHex.length == 4) {
      // Convert the short notation to the long notation
      cleanHex = cleanHex.split('').map((char) => '$char$char').join();
    }
    int? component(int index) =>
        int.tryParse(cleanHex.substring(index * 2, index * 2 + 2), radix: 16);
    final r = component(0);
    final g = component(1);
    final b = component(2);
    final a = cleanHex.length == 8 ? component(3) : 255;
    if (r == null || g == null || b == null || a == null) return null;
    return Color.fromARGB(a, r, g, b);
  }

  String _colorToHex(Color? color) {
    if (color == null) return '';
    return color
        .toHexString(includeAlpha: widget.alphaEnabled && color.a < 1)
        .toLowerCase();
  }

  Future<void> _onTap() async {
    final localizations = widget.localizations ??
        ImpaktfullUiLocalizations.of<ImpaktfullUiColorInputFieldLocalizations>(
            context);
    final color = await showDialog<Color>(
      context: context,
      builder: (context) => ImpaktfullUiModal(
        title: localizations.colorPickerTitle,
        child: ImpaktfullUiColorPicker(
          allowedColors: widget.colorPickerColors ?? [],
          type: widget.colorPickerType ?? ImpaktfullUiColorPickerType.simple,
          onChanged: (_) {},
          // Only close when the user finished picking (tap or slider release)
          onChangeEnd: (color) => Navigator.of(context).pop(color),
          selectedColor: _color,
        ),
      ),
    );
    if (color == null) return;
    final hexColor = _colorToHex(color);
    _onChanged(hexColor);
  }
}
