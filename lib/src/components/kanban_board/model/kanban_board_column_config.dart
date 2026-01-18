import 'package:flutter/widgets.dart';

class ImpaktfullUiKanbanBoardColumnConfig {
  final String id;
  final String name;
  final Color color;
  final int index;

  const ImpaktfullUiKanbanBoardColumnConfig({
    required this.id,
    required this.name,
    required this.color,
    required this.index,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiKanbanBoardColumnConfig &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
