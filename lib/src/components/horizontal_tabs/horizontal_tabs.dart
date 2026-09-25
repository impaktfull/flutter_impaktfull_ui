import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/horizontal_tab/horizontal_tab.dart';
import 'package:impaktfull_ui/src/components/horizontal_tabs/horizontal_tabs.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'horizontal_tabs_style.dart';

class ImpaktfullUiHorizontalTabs<T> extends StatelessWidget {
  final T value;
  final ValueChanged<T> onChanged;
  final List<ImpaktfullUiHorizontalTabConfig<T>> tabs;
  final ImpaktfullUiHorizontalTabsTheme? theme;

  const ImpaktfullUiHorizontalTabs({
    // `value` and `onChanged` become `required` again in 1.0.0, when
    // `selectedValue` and `onTabSelected` are removed.
    T? value,
    @Deprecated('Use value instead. Will be removed in 1.0.0.')
    T? selectedValue,
    ValueChanged<T>? onChanged,
    @Deprecated('Use onChanged instead. Will be removed in 1.0.0.')
    ValueChanged<T>? onTabSelected,
    required this.tabs,
    this.theme,
    super.key,
  })  : value = (value ?? selectedValue) as T,
        assert(onChanged != null || onTabSelected != null,
            'onChanged is required'),
        onChanged = (onChanged ?? onTabSelected) as ValueChanged<T>;

  @Deprecated('Use value instead. Will be removed in 1.0.0.')
  T get selectedValue => value;

  @Deprecated('Use onChanged instead. Will be removed in 1.0.0.')
  ValueChanged<T> get onTabSelected => onChanged;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final dimens = componentTheme.dimens;
        final background = componentTheme.colors.background;
        final row = SizedBox(
          height: componentTheme.dimens.height,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: componentTheme.dimens.padding,
            itemCount: tabs.length,
            itemBuilder: (BuildContext context, int index) {
              final tab = tabs[index];
              return ImpaktfullUiHorizontalTab(
                title: tab.title,
                badge: tab.badge,
                badgeType: tab.badgeType,
                isSelected: value == tab.value,
                onTap: () => _onTap(tab.value),
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(width: componentTheme.dimens.spacing),
          ),
        );
        Widget content = row;
        if (background != null) {
          content = DecoratedBox(
            decoration: BoxDecoration(
              color: background,
              borderRadius: dimens.borderRadius,
            ),
            child: content,
          );
        }
        if (dimens.margin == EdgeInsets.zero) return content;
        return Padding(padding: dimens.margin, child: content);
      },
    );
  }

  void _onTap(T value) {
    if (this.value == value) return;
    onChanged(value);
  }
}
