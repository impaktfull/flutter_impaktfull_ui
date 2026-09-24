import 'package:flutter/widgets.dart';

/// Passes the index of a row to the `ImpaktfullUiTableRow` of an
/// `ImpaktfullUiTable`, so the row can show the alternating background of
/// `ImpaktfullUiTableRowColorTheme.backgroundAlternate`.
///
/// A row outside of a table has no index.
class ImpaktfullUiTableRowIndexScope extends InheritedWidget {
  final int index;

  const ImpaktfullUiTableRowIndexScope({
    required this.index,
    required super.child,
    super.key,
  });

  /// The index of the row in the closest table, or null outside of a table.
  static int? maybeOf(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<ImpaktfullUiTableRowIndexScope>()
      ?.index;

  @override
  bool updateShouldNotify(ImpaktfullUiTableRowIndexScope oldWidget) =>
      index != oldWidget.index;
}
