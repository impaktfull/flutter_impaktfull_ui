import 'package:impaktfull_ui/src/components/simple_list_item/simple_list_item_type.dart';

enum ImpaktfullUiListItemType {
  neutral,
  danger;

  ImpaktfullUiSimpleListItemType get simpleLisItemType {
    switch (this) {
      case ImpaktfullUiListItemType.neutral:
        return ImpaktfullUiSimpleListItemType.neutral;
      case ImpaktfullUiListItemType.danger:
        return ImpaktfullUiSimpleListItemType.danger;
    }
  }
}
