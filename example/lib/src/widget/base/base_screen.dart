import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final WidgetBuilder builder;
  final Widget? headerBottom;
  final List<Widget> actions;
  final bool canGoBack;

  const BaseScreen({
    required this.title,
    required this.builder,
    this.actions = const [],
    this.headerBottom,
    this.canGoBack = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colors.canvas,
      body: ImpaktfullUiThemeBuidler(
        builder: (context, theme) => ImpaktfullUiAutoLayout.vertical(
          children: [
            ImpaktfullUiCmsHeader(
              title: title,
              onBackTapped:
                  canGoBack ? () => Navigator.of(context).pop() : null,
              actions: actions,
              bottom: headerBottom,
            ),
            Expanded(
              child: builder(context),
            ),
          ],
        ),
      ),
    );
  }
}
