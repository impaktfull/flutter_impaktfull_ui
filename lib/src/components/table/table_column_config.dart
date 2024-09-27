class TableColumnConfig {
  final int? flex;
  final double? minWidth;
  final double? maxWidth;

  const TableColumnConfig({
    required int this.flex,
  })  : minWidth = null,
        maxWidth = null;

  const TableColumnConfig.size({
    required double this.minWidth,
    required double this.maxWidth,
  }) : flex = null;

  const TableColumnConfig.fixedSize({
    required double size,
  })  : flex = null,
        minWidth = size,
        maxWidth = size;
}
