import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/color_input_field/color_input_field_style.dart';
import 'package:impaktfull_ui/src/components/color_picker/color_picker.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/components/modal/modal.dart';
import 'package:impaktfull_ui/src/components/section_title/section_title.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'color_input_field_style.dart';

part 'color_input_field.describe.dart';

class ImpaktfullUiColorInputField extends StatefulWidget
    with ComponentDescriptorMixin {
  final String? label;
  final Color? initialColor;
  final ValueChanged<Color>? onChanged;
  final List<Color>? colorPickerColors;
  final ImpaktfullUiColorPickerType? colorPickerType;
  final bool alphaEnabled;
  final ImpaktfullUiColorInputFieldTheme? theme;

  const ImpaktfullUiColorInputField({
    this.label,
    this.initialColor,
    this.onChanged,
    this.alphaEnabled = false,
    this.colorPickerColors,
    this.colorPickerType,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiColorInputField> createState() =>
      _ImpaktfullUiColorInputFieldState();
  @override
  String describe(BuildContext context) => _describeInstance(context, this);
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
              spacing: 8,
              children: [
                ImpaktfullUiTouchFeedback(
                  onTap: widget.colorPickerType == null ? null : _onTap,
                  borderRadius: componentTheme.dimens.borderRadius,
                  border: Border.all(
                    color: componentTheme.colors.border,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    width: 1,
                  ),
                  color: _color ?? Colors.transparent,
                  child: const SizedBox(
                    width: 40,
                    height: 40,
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

  Color? _hexToColor(String hex) {
    // Remove any leading # symbol
    final cleanHex = hex.replaceAll('#', '').trim();

    // Check if valid hex length (3 or 6 characters)
    if (cleanHex.length != 6 && cleanHex.length != 3) {
      return null;
    }

    try {
      if (cleanHex.length == 6) {
        final r = int.parse(cleanHex.substring(0, 2), radix: 16);
        final g = int.parse(cleanHex.substring(2, 4), radix: 16);
        final b = int.parse(cleanHex.substring(4, 6), radix: 16);
        return Color.fromRGBO(r, g, b, 1);
      } else {
        // Convert 3 digit hex to 6 digit
        final r = int.parse('${cleanHex[0]}${cleanHex[0]}', radix: 16);
        final g = int.parse('${cleanHex[1]}${cleanHex[1]}', radix: 16);
        final b = int.parse('${cleanHex[2]}${cleanHex[2]}', radix: 16);
        return Color.fromRGBO(r, g, b, 1);
      }
    } catch (e) {
      return null;
    }
  }

  String _colorToHex(Color? color) {
    if (color == null) return '';
    final red = (color.r * 255).round().toRadixString(16).padLeft(2, '0');
    final green = (color.g * 255).round().toRadixString(16).padLeft(2, '0');
    final blue = (color.b * 255).round().toRadixString(16).padLeft(2, '0');
    return '#$red$green$blue';
  }

  Future<void> _onTap() async {
    final color = await showDialog<Color>(
      context: context,
      builder: (context) => ImpaktfullUiModal(
        title: 'Select a color',
        child: ImpaktfullUiColorPicker(
          allowedColors: widget.colorPickerColors ?? [],
          type: widget.colorPickerType ?? ImpaktfullUiColorPickerType.simple,
          onColorChanged: (color) => Navigator.of(context).pop(color),
          selectedColor: _color,
        ),
      ),
    );
    if (color == null) return;
    final hexColor = _colorToHex(color);
    _onChanged(hexColor);
  }
}
