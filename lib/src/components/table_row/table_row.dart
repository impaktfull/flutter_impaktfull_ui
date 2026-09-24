import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/table/table_column_builder.dart';
import 'package:impaktfull_ui/src/components/table/table_column_config.dart';
import 'package:impaktfull_ui/src/components/table/table_column_config_scope.dart';
import 'package:impaktfull_ui/src/components/table/table_row_index_scope.dart';
import 'package:impaktfull_ui/src/components/table_row/table_row_style.dart';
import 'package:impaktfull_ui/src/components/table_row_item/table_row_item.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/hover_feedback/hover_feedback.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'table_row_style.dart';

class ImpaktfullUiTableRow extends StatelessWidget {
  /// The width of every column. When empty (the default), the
  /// `columnConfig` of the `ImpaktfullUiTable` it is in is used.
  final List<ImpaktfullUiTableColumnConfig> columnConfig;
  final List<ImpaktfullUiTableRowItem> columns;
  final VoidCallback? onTap;

  /// Whether the row is selected. A selected row uses the
  /// `backgroundSelected` of its theme and is announced as selected.
  final bool isSelected;
  final ImpaktfullUiTableRowTheme? theme;

  const ImpaktfullUiTableRow({
    required this.columns,
    this.columnConfig = const [],
    this.onTap,
    this.isSelected = false,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final index = ImpaktfullUiTableRowIndexScope.maybeOf(context);
        // A row only observes the pointer when the theme has a hover
        // background for it: without one, the tree is the one it always was.
        if (componentTheme.colors.backgroundHover == null) {
          return _buildRow(
            context,
            componentTheme,
            index: index,
            isHovered: false,
          );
        }
        return ImpaktfullUiHoverFeedback(
          // The touch feedback of the row (or of a cell) decides the cursor.
          cursor: MouseCursor.defer,
          builder: (context, isHovered) => _buildRow(
            context,
            componentTheme,
            index: index,
            isHovered: isHovered,
          ),
        );
      },
    );
  }

  Widget _buildRow(
    BuildContext context,
    ImpaktfullUiTableRowTheme componentTheme, {
    required int? index,
    required bool isHovered,
  }) {
    final row = ImpaktfullUiTouchFeedback(
      onTap: onTap,
      color: _getBackground(
        componentTheme.colors,
        index: index,
        isHovered: isHovered,
      ),
      border: _getBorder(componentTheme),
      child: TableColumnBuilder(
        minHeight: componentTheme.dimens.minHeight,
        config: ImpaktfullUiTableColumnConfigScope.resolve(
          context,
          columnConfig,
        ),
        children: columns,
      ),
    );
    if (!isSelected) return row;
    return Semantics(selected: true, child: row);
  }

  /// The background of the row: the selected background wins over the hovered
  /// one, which wins over the background of the row itself. A row with an odd
  /// index in a table uses `backgroundAlternate` as its background.
  Color? _getBackground(
    ImpaktfullUiTableRowColorTheme colors, {
    required int? index,
    required bool isHovered,
  }) {
    final background = index != null && index.isOdd
        ? colors.backgroundAlternate ?? colors.background
        : colors.background;
    if (isSelected) return colors.backgroundSelected ?? background;
    if (isHovered) return colors.backgroundHover ?? background;
    return background;
  }

  Border? _getBorder(ImpaktfullUiTableRowTheme componentTheme) {
    final color = componentTheme.colors.border;
    if (color == null) return null;
    return Border(
      bottom: BorderSide(
        color: color,
        width: componentTheme.dimens.borderWidth,
        strokeAlign: BorderSide.strokeAlignInside,
      ),
    );
  }
}
