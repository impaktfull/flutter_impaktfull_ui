import 'package:flutter/material.dart';

class ImpaktfullUiHoverFeedback extends StatefulWidget {
  final Widget Function(BuildContext, bool isHovered) builder;
  final MouseCursor cursor;
  final bool canRequestFocus;

  const ImpaktfullUiHoverFeedback({
    required this.builder,
    this.cursor = SystemMouseCursors.click,
    this.canRequestFocus = true,
    super.key,
  });

  @override
  State<ImpaktfullUiHoverFeedback> createState() =>
      _ImpaktfullUiHoverFeedbackState();
}

class _ImpaktfullUiHoverFeedbackState extends State<ImpaktfullUiHoverFeedback> {
  var isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (event) => setState(() => isHovered = true),
      onExit: (event) => setState(() => isHovered = false),
      child: widget.builder(context, isHovered),
    );
  }
}
