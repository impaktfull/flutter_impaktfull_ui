import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final WidgetBuilder builder;
  final Widget? headerBottom;
  final bool canGoBack;

  const BaseScreen({
    required this.title,
    required this.builder,
    this.canGoBack = true,
    this.headerBottom,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImpaktfullUiThemeBuidler(
        builder: (context, theme) => ImpaktfullUiAutoLayout.vertical(
          children: [
            ImpaktfullUiCmsHeader(
              title: title,
              onBackTapped: canGoBack ? () => Navigator.of(context).pop() : null,
              bottom: headerBottom,
            ),
            Expanded(
              child: Container(
                color: theme.colors.canvas,
                child: builder(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
