import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/building_block/not_found/not_found.localizations.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/unified_screen_layout/unified_screen_layout.dart';
import 'package:impaktfull_ui/src/components/localization/localization_provider.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

export 'not_found.localizations.dart';

class ImpaktfullUiBBNotFound extends StatelessWidget {
  final WidgetBuilder? startBuilder;
  final WidgetBuilder? endBuilder;
  final WidgetBuilder? topBuilder;
  final WidgetBuilder? bottomBuilder;
  final Alignment alignment;
  final ImpaktfullUiBBNotFoundLocalizations? localizations;
  final List<Widget> actions;

  const ImpaktfullUiBBNotFound({
    this.startBuilder,
    this.endBuilder,
    this.topBuilder,
    this.bottomBuilder,
    this.alignment = Alignment.center,
    this.localizations,
    this.actions = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiLocalizationProvider<
        ImpaktfullUiBBNotFoundLocalizations>(
      localizations: localizations,
      builder: (context, localizations) => ImpaktfullUiUnifiedScreenLayout(
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
                  localizations.title,
                  style: theme.textStyles.onCanvas.display.large,
                ),
                Text(
                  localizations.subtitle,
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
      ),
    );
  }
}
