class ImpaktfullUiTableColumnConfig {
  final int? flex;
  final double? minWidth;
  final double? maxWidth;

  const ImpaktfullUiTableColumnConfig({
    required int this.flex,
  })  : minWidth = null,
        maxWidth = null;

  const ImpaktfullUiTableColumnConfig.size({
    required double this.minWidth,
    required double this.maxWidth,
  }) : flex = null;

  const ImpaktfullUiTableColumnConfig.fixedSize({
    required double size,
  })  : flex = null,
        minWidth = size,
        maxWidth = size;
}
