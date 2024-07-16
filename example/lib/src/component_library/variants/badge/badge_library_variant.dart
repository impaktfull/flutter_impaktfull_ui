import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/component_library.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/badge/badge_library_item.dart';

class BadgeVariant extends ComponentLibraryVariant<BadgeLibraryVariantInputs> {
  final ImpaktfullUiBadgeType type;
  BadgeVariant(this.type);

  @override
  String get title => type.name;

  @override
  List<Widget> build(BuildContext context, BadgeLibraryVariantInputs inputs) {
    final label = inputs.label.value ?? '{badge_label}';
    final leadingIcons = [
      null,
      inputs.leadingIcon.value ?? Icons.add,
    ];
    final trailingIcons = [
      null,
      inputs.trailingIcon.value ?? Icons.add,
    ];
    return [
      for (final size in ImpaktfullUiBadgeSize.values) ...[
        for (final leadingIcon in leadingIcons) ...[
          for (final trailingIcon in trailingIcons) ...[
            ImpaktfullUiBadge(
              type: type,
              size: size,
              label: label,
              leading: leadingIcon == null ? null : Icon(leadingIcon),
              trailing: trailingIcon == null ? null : Icon(trailingIcon),
            ),
          ],
        ],
        ImpaktfullUiBadge(
          type: type,
          size: size,
          label: label,
          leading: ClipOval(
            child: Image.network('https://picsum.photos/300/300'),
          ),
        ),
        ImpaktfullUiBadge(
          type: type,
          size: size,
          label: label,
          trailing: ClipOval(
            child: Image.network('https://picsum.photos/300/300'),
          ),
        ),
        ImpaktfullUiBadge(
          type: type,
          size: size,
          label: label,
          onCloseTap: () {},
          trailing: ClipOval(
            child: Image.network('https://picsum.photos/300/300'),
          ),
        ),
        ImpaktfullUiBadge(
          type: type,
          size: size,
          label: label,
          leading: CustomBadgeWidget(
            child: Container(
              margin: EdgeInsets.only(left: size.spacing),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: ImpaktfullUiTheme.of(context).colors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    ];
  }

  @override
  BadgeLibraryVariantInputs inputs() => BadgeLibraryVariantInputs();
}

class BadgeLibraryVariantInputs extends BadgeLibraryInputs {}
