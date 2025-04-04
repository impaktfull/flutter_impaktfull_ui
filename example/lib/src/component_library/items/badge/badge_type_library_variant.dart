import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/badge/badge_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class BadgeTypeLibraryVariant
    extends ComponentLibraryVariant<BadgeLibraryVariantInputs> {
  final ImpaktfullUiBadgeType type;
  BadgeTypeLibraryVariant(this.type);

  @override
  String get title => type.name;

  @override
  List<Widget> build(BuildContext context, BadgeLibraryVariantInputs inputs) {
    final label = inputs.label.value ?? '{badge_label}';
    final leadingIcons = [
      null,
      inputs.leadingIcon.value,
    ];
    final trailingIcons = [
      null,
      inputs.trailingIcon.value,
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
          leading: const ClipOval(
            child: ImpaktfullUiNetworkImage.random(),
          ),
        ),
        ImpaktfullUiBadge(
          type: type,
          size: size,
          label: label,
          trailing: const ClipOval(
            child: ImpaktfullUiNetworkImage.random(),
          ),
        ),
        ImpaktfullUiBadge(
          type: type,
          size: size,
          label: label,
          onCloseTap: () {},
          trailing: const ClipOval(
            child: ImpaktfullUiNetworkImage.random(),
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
                color: ImpaktfullUiTheme.of(context).colors.accent,
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
