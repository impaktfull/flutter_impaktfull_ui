import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/responsive_layout/responsive_layout.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

part 'responsive_row.describe.dart';

class ImpaktfullUiResponsiveRow extends StatelessWidget
    with ComponentDescriptorMixin {
  final List<Widget> children;
  final double verticalSpacing;
  final double horizontalSpacing;
  final int maxColumns;
  final int? mediumMaxColumns;
  final int? largeMaxColumns;
  final int? extraLargeMaxColumns;

  const ImpaktfullUiResponsiveRow({
    super.key,
    required this.children,
    this.verticalSpacing = 0,
    this.horizontalSpacing = 0,
    this.maxColumns = 1,
    this.mediumMaxColumns,
    this.largeMaxColumns,
    this.extraLargeMaxColumns,
  });

  @override
  Widget build(BuildContext context) {
    final children = this
        .children
        .map(
          (child) => Expanded(
            child: child,
          ),
        )
        .toList();
    return ImpaktfullUiResponsiveLayout(
      small: (context) => _buildRow(
        context,
        children,
        maxColumns,
      ),
      medium: (context) => _buildRow(
        context,
        children,
        mediumMaxColumns ?? maxColumns,
      ),
      large: (context) => _buildRow(
        context,
        children,
        largeMaxColumns ?? mediumMaxColumns ?? maxColumns,
      ),
      extraLarge: (context) => _buildRow(
        context,
        children,
        extraLargeMaxColumns ??
            largeMaxColumns ??
            mediumMaxColumns ??
            maxColumns,
      ),
    );
  }

  Widget _buildRow(
    BuildContext context,
    List<Widget> children,
    int maxColumns,
  ) {
    final List<List<Widget>> rows = [];
    var column = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      column.add(child);
      if (column.length == maxColumns) {
        rows.add(column);
        column = [];
      }
    }
    rows.add(column);
    return ImpaktfullUiAutoLayout.vertical(
      spacing: verticalSpacing,
      children: [
        for (final rows in rows) ...[
          ImpaktfullUiAutoLayout.horizontal(
            spacing: horizontalSpacing,
            children: rows,
          ),
        ],
      ],
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
