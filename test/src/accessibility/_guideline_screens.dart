import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '_accessibility_test_helpers.dart';

/// Representative screens for the accessibility guideline tests: a settings
/// screen with list items, a form with standalone controls (with the opt-in
/// tap target size) and a navigation screen.
Widget settingsScreen() => ListView(
      children: [
        ImpaktfullUiCheckboxListItem(
          title: 'Newsletter',
          subtitle: 'Once a week',
          value: true,
          onChanged: (_) {},
        ),
        ImpaktfullUiRadioButtonListItem<int>(
          title: 'Monthly',
          value: 1,
          groupValue: 1,
          onChanged: (_) {},
        ),
        ImpaktfullUiRadioButtonListItem<int>(
          title: 'Yearly',
          value: 2,
          groupValue: 1,
          onChanged: (_) {},
        ),
        ImpaktfullUiSwitchListItem(
          title: 'Dark mode',
          value: false,
          onChanged: (_) {},
        ),
        ImpaktfullUiSelectableListItem(
          title: 'Belgium',
          isSelected: true,
          onChanged: (_) {},
        ),
        ImpaktfullUiAccordion(
          title: 'Advanced',
          expanded: false,
          onExpandedChanged: (_) {},
          expandedBuilder: (context) => const SizedBox(),
        ),
      ],
    );

Widget formScreen() => Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImpaktfullUiCheckbox(
                value: true,
                semanticLabel: 'Accept the terms',
                onChanged: (_) {},
              ),
              ImpaktfullUiRadioButton<int>(
                value: 1,
                groupValue: 1,
                semanticLabel: 'Monthly',
                onChanged: (_) {},
              ),
              ImpaktfullUiSwitch(
                value: true,
                semanticLabel: 'Notifications',
                onChanged: (_) {},
              ),
            ],
          ),
          ImpaktfullUiSlider(
            value: 5,
            min: 0,
            max: 10,
            semanticLabel: 'Volume',
            onChanged: (_) {},
          ),
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            size: ImpaktfullUiButtonSize.large,
            title: 'Save',
            onTap: () {},
          ),
        ],
      ),
    );

Widget navigationScreen() => Column(
      children: [
        ImpaktfullUiSegmentedControl<String>(
          value: 'Day',
          items: const ['Day', 'Week'],
          onChanged: (_) {},
        ),
        ImpaktfullUiSidebarNavigationItem(
          title: 'Settings',
          isSelected: true,
          onTap: () {},
        ),
        const Spacer(),
        Row(
          children: [
            ImpaktfullUiBottomNavigationItem(
              asset: ImpaktfullUiAsset.icon(Icons.home),
              label: 'Home',
              isSelected: true,
              onTap: () {},
            ),
            ImpaktfullUiBottomNavigationItem(
              asset: ImpaktfullUiAsset.icon(Icons.mail),
              label: 'Inbox',
              isSelected: false,
              badgeText: '3',
              onTap: () {},
            ),
          ],
        ),
      ],
    );

/// The screens with the theme to pump them with.
final guidelineScreens = <String, (Widget Function(), ImpaktfullUiTheme?)>{
  'settings screen': (settingsScreen, null),
  'form with the opt-in tap target size': (
    formScreen,
    themeWithMinTapTargets(),
  ),
  'navigation screen': (navigationScreen, null),
};
