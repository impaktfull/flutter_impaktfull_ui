import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tab/horizontal_tab.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tabs/horizontal_tabs.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'horizontal_tabs_style.dart';

part 'horizontal_tabs.describe.dart';

class ImpaktfullUiHorizontalTabs<T> extends StatelessWidget
    with ComponentDescriptorMixin {
  final T selectedValue;
  final ValueChanged<T> onTabSelected;
  final List<ImpaktfullUiHorizontalTabConfig> tabs;
  final ImpaktfullUiHorizontalTabsTheme? theme;

  const ImpaktfullUiHorizontalTabs({
    required this.selectedValue,
    required this.onTabSelected,
    required this.tabs,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiHorizontalTabsTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => SizedBox(
        height: 48,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: componentTheme.dimens.padding,
          itemCount: tabs.length,
          itemBuilder: (BuildContext context, int index) {
            final tab = tabs[index];
            return ImpaktfullUiHorizontalTab(
              label: tab.label,
              badge: tab.badge,
              badgeType: tab.badgeType,
              isSelected: selectedValue == tab.value,
              theme: ImpaktfullUiTheme.of(context).components.horizontalTab,
              onTap: () => _onTap(tab.value),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 8),
        ),
      ),
    );
  }

  void _onTap(T value) {
    if (selectedValue == value) return;
    onTabSelected(value);
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
