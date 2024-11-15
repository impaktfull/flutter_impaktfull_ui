import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui_2/src/components/modal/modal.dart';
import 'package:impaktfull_ui_2/src/components/option_selector/option_selector.dart';
import 'package:impaktfull_ui_2/src/components/page_route/adaptive/adaptive_page_route.dart';
import 'package:impaktfull_ui_2/src/components/screen/screen.dart';
import 'package:impaktfull_ui_2/src/components/selectable_list_item/selectable_list_item.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui_2/src/util/responsive/responsive_extension.dart';

export 'option_selector_style.dart';

part 'option_selector.describe.dart';

class ImpaktfullUiOptionSelector<T> extends StatefulWidget
    with ComponentDescriptorMixin {
  final String Function(T)? titleBuilder;
  final List<T> options;
  final T? selectedValue;
  final EdgeInsetsGeometry padding;
  final ImpaktfullUiOptionSelectorTheme? theme;

  const ImpaktfullUiOptionSelector({
    required this.options,
    this.titleBuilder,
    this.selectedValue,
    this.padding = EdgeInsets.zero,
    this.theme,
    super.key,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required List<T> options,
    String Function(T)? titleBuilder,
    T? selectedValue,
    String? subtitle,
  }) async {
    if (context.isLargeScreen) {
      return ImpaktfullUiModal.showSimple(
        context: context,
        title: title,
        subtitle: subtitle,
        showDividers: true,
        childPadding: EdgeInsets.zero,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 600,
          ),
          child: ImpaktfullUiOptionSelector<T>(
            titleBuilder: titleBuilder,
            options: options,
            selectedValue: selectedValue,
          ),
        ),
      );
    }
    return Navigator.of(context).push<T>(
      ImpaktfullUIAdaptivePageRoute.create(
        builder: (context) => ImpaktfullUiScreen(
          title: title,
          subtitle: subtitle,
          onBackTapped: () => Navigator.of(context).pop(),
          child: ImpaktfullUiOptionSelector<T>(
            titleBuilder: titleBuilder,
            options: options,
            selectedValue: selectedValue,
            padding: const EdgeInsets.symmetric(vertical: 8),
          ),
        ),
      ),
    );
  }

  @override
  State<ImpaktfullUiOptionSelector<T>> createState() =>
      _ImpaktfullUiOptionSelectorState<T>();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiOptionSelectorState<T>
    extends State<ImpaktfullUiOptionSelector<T>> {
  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiOptionSelectorTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiListView.builder(
        padding: widget.padding,
        shrinkWrap: true,
        items: widget.options,
        itemBuilder: (context, item, index) {
          final title = item is String ? item : widget.titleBuilder!.call(item);
          return ImpaktfullUiSelectableListItem(
            title: title,
            isSelected: item == widget.selectedValue,
            onChanged: (isSelected) {
              Navigator.of(context).pop(isSelected ? item : null);
            },
          );
        },
        noDataLabel: 'No options',
      ),
    );
  }
}
