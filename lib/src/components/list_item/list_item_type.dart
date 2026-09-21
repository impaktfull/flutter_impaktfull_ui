import 'package:impaktfull_ui/src/components/simple_list_item/simple_list_item_type.dart';

enum ImpaktfullUiListItemType {
  neutral,
  danger;

  @Deprecated('Use simpleListItemType instead. Will be removed in 1.0.0.')
  ImpaktfullUiSimpleListItemType get simpleLisItemType => simpleListItemType;

  ImpaktfullUiSimpleListItemType get simpleListItemType {
    switch (this) {
      case ImpaktfullUiListItemType.neutral:
        return ImpaktfullUiSimpleListItemType.neutral;
      case ImpaktfullUiListItemType.danger:
        return ImpaktfullUiSimpleListItemType.danger;
    }
  }
}
