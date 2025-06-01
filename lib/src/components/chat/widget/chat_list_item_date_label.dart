import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/chat/chat.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiChatListItemDateLabel extends StatelessWidget {
  final ImpaktfullUiChatItem item;
  final ImpaktfullUiChatItem? previousItem;
  final ImpaktfullUiChatTheme theme;
  const ImpaktfullUiChatListItemDateLabel({
    required this.item,
    required this.theme,
    this.previousItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final date = item.timestamp;
        final previousDate = previousItem?.timestamp;
        if (previousDate == null || !date.isSameDay(date)) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                color: componentTheme.colors.dateLabelBackground,
                borderRadius: componentTheme.dimens.dateLabelBorderRadius,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              child: Text(
                _getDateLabel(),
                style: componentTheme.textStyles.dateLabel,
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  String _getDateLabel() => item.timestamp.format('dd/MM/yyyy');
}
