import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui/src/components/modal/modal.dart';
import 'package:impaktfull_ui/src/components/option_selector/option_selector.dart';
import 'package:impaktfull_ui/src/components/page_route/adaptive/adaptive_page_route.dart';
import 'package:impaktfull_ui/src/components/screen/screen.dart';
import 'package:impaktfull_ui/src/components/selectable_list_item/selectable_list_item.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';
import 'package:impaktfull_ui/src/components/responsive_layout/responsive_layout.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'option_selector.localizations.dart';
export 'option_selector_style.dart';

class ImpaktfullUiOptionSelector<T> extends StatefulWidget {
  final String Function(T)? titleBuilder;
  final List<T> options;
  final T? value;
  final EdgeInsetsGeometry padding;
  final ImpaktfullUiOptionSelectorTheme? theme;

  /// The texts of the option selector. Defaults to the localizations of the
  /// app.
  final ImpaktfullUiOptionSelectorLocalizations? localizations;

  const ImpaktfullUiOptionSelector({
    required this.options,
    this.titleBuilder,
    T? value,
    @Deprecated('Use value instead. Will be removed in 1.0.0.')
    T? selectedValue,
    this.padding = EdgeInsets.zero,
    this.theme,
    this.localizations,
    super.key,
  }) : value = value ?? selectedValue;

  @Deprecated('Use value instead. Will be removed in 1.0.0.')
  T? get selectedValue => value;

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required List<T> options,
    String Function(T)? titleBuilder,
    T? value,
    @Deprecated('Use value instead. Will be removed in 1.0.0.')
    T? selectedValue,
    String? subtitle,
    ImpaktfullUiOptionSelectorLocalizations? localizations,
  }) async {
    if (ImpaktfullUiResponsiveLayout.isMediumOrBigger(context)) {
      return ImpaktfullUiModal.showSimple(
        context: context,
        title: title,
        subtitle: subtitle,
        showDividers: true,
        childPadding: EdgeInsets.zero,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight:
                ImpaktfullUiOptionSelectorTheme.of(context).dimens.maxHeight,
          ),
          child: ImpaktfullUiOptionSelector<T>(
            titleBuilder: titleBuilder,
            options: options,
            value: value ?? selectedValue,
            localizations: localizations,
          ),
        ),
      );
    }
    return Navigator.of(context).push<T>(
      ImpaktfullUiAdaptivePageRoute.create(
        builder: (context) => ImpaktfullUiScreen(
          title: title,
          subtitle: subtitle,
          onBackTapped: () => Navigator.of(context).pop(),
          child: ImpaktfullUiOptionSelector<T>(
            titleBuilder: titleBuilder,
            options: options,
            value: value ?? selectedValue,
            padding: const EdgeInsets.symmetric(vertical: 8),
            localizations: localizations,
          ),
        ),
      ),
    );
  }

  @override
  State<ImpaktfullUiOptionSelector<T>> createState() =>
      _ImpaktfullUiOptionSelectorState<T>();
}

class _ImpaktfullUiOptionSelectorState<T>
    extends State<ImpaktfullUiOptionSelector<T>> {
  @override
  Widget build(BuildContext context) {
    final localizations = widget.localizations ??
        ImpaktfullUiLocalizations.of<ImpaktfullUiOptionSelectorLocalizations>(
            context);
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiListView.builder(
        padding: widget.padding,
        shrinkWrap: true,
        items: widget.options,
        itemBuilder: (context, item, index) {
          final title = item is String
              ? item
              : widget.titleBuilder?.call(item) ?? item.toString();
          return ImpaktfullUiSelectableListItem(
            title: title,
            isSelected: item == widget.value,
            onChanged: (isSelected) {
              Navigator.of(context).pop(isSelected ? item : null);
            },
          );
        },
        placeholderData: ImpaktfullUiListViewPlaceholderData(
          title: localizations.noOptions,
        ),
      ),
    );
  }
}
