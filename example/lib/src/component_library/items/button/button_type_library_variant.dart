import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/button/button_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ButtonTypeLibraryVariant
    extends ComponentLibraryVariant<ButtonTypeLibraryInputs> {
  final ImpaktfullUiButtonType type;

  ButtonTypeLibraryVariant({
    required this.type,
  });

  @override
  String get title => type.name;

  @override
  List<Widget> build(BuildContext context, ButtonTypeLibraryInputs inputs) {
    final title = inputs.title.value ?? '{fallback_label}';
    final isFullWidth = [
      false,
      true,
    ];
    final leadingIcons = [
      null,
      inputs.leadingIcon.value ?? Icons.add,
    ];
    final trailingIcons = [
      null,
      inputs.trailingIcon.value ?? Icons.add,
    ];
    return [
      for (final fullWidth in isFullWidth) ...[
        for (final size in ImpaktfullUiButtonSize.values) ...[
          for (final leadingIcon in leadingIcons) ...[
            for (final trailingIcon in trailingIcons) ...[
              ImpaktfullUiButton(
                type: type,
                size: size,
                title: title,
                fullWidth: fullWidth,
                leadingAsset: leadingIcon == null
                    ? null
                    : ImpaktfullUiAsset.icon(leadingIcon),
                trailingAsset: trailingIcon == null
                    ? null
                    : ImpaktfullUiAsset.icon(trailingIcon),
                onTap: () {},
              ),
              ImpaktfullUiButton(
                type: type,
                size: size,
                title: title,
                fullWidth: fullWidth,
                leadingAsset: leadingIcon == null
                    ? null
                    : ImpaktfullUiAsset.icon(leadingIcon),
                trailingAsset: trailingIcon == null
                    ? null
                    : ImpaktfullUiAsset.icon(trailingIcon),
                onAsyncTap: () async =>
                    Future.delayed(const Duration(seconds: 3)),
              ),
            ],
          ],
          ImpaktfullUiButton(
            type: type,
            size: size,
            fullWidth: fullWidth,
            leadingAsset:
                ImpaktfullUiAsset.icon(inputs.leadingIcon.value ?? Icons.add),
            onAsyncTap: () async => Future.delayed(const Duration(seconds: 3)),
          ),
        ],
      ],
    ];
  }

  @override
  ButtonTypeLibraryInputs inputs() => ButtonTypeLibraryInputs();
}

class ButtonTypeLibraryInputs extends ButtonLibraryInputs {}
