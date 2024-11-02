import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/unified_screen_layout/unified_screen_layout.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiBBNotFound extends StatelessWidget {
  final WidgetBuilder? startBuilder;
  final WidgetBuilder? endBuilder;
  final WidgetBuilder? topBuilder;
  final WidgetBuilder? bottomBuilder;
  final Alignment alignment;
  final List<Widget> actions;

  const ImpaktfullUiBBNotFound({
    this.startBuilder,
    this.endBuilder,
    this.topBuilder,
    this.bottomBuilder,
    this.alignment = Alignment.center,
    this.actions = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiUnifiedScreenLayout(
      startBuilder: startBuilder,
      endBuilder: endBuilder,
      topBuilder: topBuilder,
      bottomBuilder: bottomBuilder,
      alignment: alignment,
      centerChild: ImpaktfullUiAutoLayout.vertical(
        mainAxisSize: MainAxisSize.min,
        spacing: 64,
        children: [
          ImpaktfullUiAutoLayout.vertical(
            children: [
              Text(
                'Page not found',
                style: theme.textStyles.onCanvas.display.large,
              ),
              Text(
                'We were not able to find this page',
                style: theme.textStyles.onCardTertiary.text.small,
              ),
            ],
          ),
          if (actions.isNotEmpty) ...[
            ImpaktfullUiAutoLayout.horizontal(
              spacing: 8,
              children: actions,
            ),
          ],
        ],
      ),
    );
  }
}
