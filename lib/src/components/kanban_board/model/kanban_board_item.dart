class ImpaktfullUiKanbanBoardItem<T> {
  final String id;
  final String columnId;
  final String? title;
  final String? description;
  final String? imageUrl;
  final T? data;

  const ImpaktfullUiKanbanBoardItem({
    required this.id,
    required this.columnId,
    this.title,
    this.description,
    this.imageUrl,
    this.data,
  });

  ImpaktfullUiKanbanBoardItem<T> copyWith({
    String? id,
    String? columnId,
    String? title,
    String? description,
    String? imageUrl,
    T? data,
  }) {
    return ImpaktfullUiKanbanBoardItem<T>(
      id: id ?? this.id,
      columnId: columnId ?? this.columnId,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiKanbanBoardItem &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
