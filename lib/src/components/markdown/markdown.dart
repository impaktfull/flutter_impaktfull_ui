import 'dart:async';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui_2/src/components/markdown/markdown_style.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_parser.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_parsers.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'markdown_style.dart';

part 'markdown.describe.dart';

typedef ImpaktfullUiMarkdownLinkCallback = FutureOr<void> Function(String url);

class ImpaktfullUiMarkdown extends StatefulWidget with ComponentDescriptorMixin {
  final String data;
  final ImpaktfullUiMarkdownParsers? parsers;
  final ImpaktfullUiMarkdownLinkCallback? onOpenLink;
  final ImpaktfullUiMarkdownTheme? theme;

  const ImpaktfullUiMarkdown({
    required this.data,
    this.parsers,
    this.onOpenLink,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiMarkdown> createState() => _ImpaktfullUiMarkdownState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiMarkdownState extends State<ImpaktfullUiMarkdown> {
  final _dateLines = <Widget>[];
  late final ImpaktfullUiMarkdownParsers _parsers;

  @override
  void initState() {
    super.initState();
    _parsers = widget.parsers ??
        ImpaktfullUiMarkdownParsers.getDefault(
          onOpenLink: widget.onOpenLink,
        );
    _parseData();
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiMarkdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      _parseData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiMarkdownTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiListView.builder(
        shrinkWrap: true,
        items: _dateLines,
        itemBuilder: (context, item, index) => Align(
          alignment: AlignmentDirectional.topStart,
          child: item,
        ),
        noDataLabel: 'No markdown data',
      ),
    );
  }

  void _parseData() {
    final lines = widget.data.split('\n');
    final parsedLines = <Widget>[];
    final parsers = _parsers.parsers;
    for (final line in lines) {
      final widget = _parseLine(line, parsers);
      if (widget != null) {
        parsedLines.add(widget);
        continue;
      }
    }
    _dateLines.clear();
    _dateLines.addAll(parsedLines);
  }

  Widget? _parseLine(String line, List<ImpaktfullUiMarkdownParser> parsers) {
    for (final parser in parsers) {
      final widget = parser.parse(line);
      if (widget != null) {
        return widget;
      }
    }
    return null;
  }
}
