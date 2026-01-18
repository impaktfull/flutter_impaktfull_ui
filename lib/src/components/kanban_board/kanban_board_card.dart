import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/kanban_board/kanban_board_style.dart';
import 'package:impaktfull_ui/src/components/kanban_board/model/kanban_board_item.dart';
import 'package:impaktfull_ui/src/components/network_image/network_image.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

part 'kanban_board_card.describe.dart';

class ImpaktfullUiKanbanBoardCard<T> extends StatelessWidget
    with ComponentDescriptorMixin {
  final ImpaktfullUiKanbanBoardItem<T> item;
  final ImpaktfullUiKanbanBoardTheme? theme;

  const ImpaktfullUiKanbanBoardCard({
    required this.item,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        return Container(
          decoration: BoxDecoration(
            color: componentTheme.colors.cardBackground,
            borderRadius: componentTheme.dimens.cardBorderRadius,
            border: componentTheme.colors.cardBorder != null
                ? Border.all(
                    color: componentTheme.colors.cardBorder!,
                    width: componentTheme.dimens.cardBorderWidth,
                  )
                : null,
            boxShadow: componentTheme.shadows.card,
          ),
          child: ClipRRect(
            borderRadius: componentTheme.dimens.cardBorderRadius,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (item.imageUrl != null) ...[
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return SizedBox(
                        height: componentTheme.dimens.cardImageHeight,
                        width: double.infinity,
                        child: ImpaktfullUiNetworkImage(
                          url: item.imageUrl!,
                          fit: BoxFit.cover,
                          width: constraints.maxWidth,
                          height: componentTheme.dimens.cardImageHeight,
                        ),
                      );
                    },
                  ),
                ],
                Padding(
                  padding: componentTheme.dimens.cardPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item.title,
                        style: componentTheme.textStyles.cardTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (item.description != null) ...[
                        SizedBox(height: componentTheme.dimens.cardSpacing),
                        Text(
                          item.description!,
                          style: componentTheme.textStyles.cardDescription,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeCardInstance(context, this);
}
