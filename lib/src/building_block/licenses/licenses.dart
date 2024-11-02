import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/accordion/accordion.dart';
import 'package:impaktfull_ui/src/components/adaptive_nav_bar/adaptive_nav_bar.dart';
import 'package:impaktfull_ui/src/components/adaptive_screen/adaptive_screen.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/card/card.dart';
import 'package:impaktfull_ui/src/components/clamped_fractionally_sized_box/clamped_fractionally_sized_box.dart';
import 'package:impaktfull_ui/src/components/divider/divider.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui/src/components/responsive_layout/responsive_layout.dart';
import 'package:impaktfull_ui/src/models/license.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiBBLicenses extends StatefulWidget {
  final VoidCallback? onBackTapped;
  const ImpaktfullUiBBLicenses({
    this.onBackTapped,
    super.key,
  });

  @override
  State<ImpaktfullUiBBLicenses> createState() => _ImpaktfullUiBBLicensesState();
}

class _ImpaktfullUiBBLicensesState extends State<ImpaktfullUiBBLicenses> {
  var _isLoading = false;

  final _licenses = <ImpaktfullUiLicense>[];
  final _expandedSet = <ImpaktfullUiLicense>{};

  var _search = false;
  var _searchText = '';

  final _queryListForLicenses = [
    'impaktfull',
    'koen van looveren',
  ];

  List<ImpaktfullUiLicense> get _filteredLicenses => _licenses.where((e) {
        final searchText = _searchText.toLowerCase();
        if (searchText.isEmpty) {
          return true;
        } else if (e.name.toLowerCase().contains(searchText)) {
          return true;
        } else if (_queryListForLicenses.any((e) => e.contains(searchText))) {
          return e.licenses.any((e) {
            final license = e.toLowerCase();
            if (!license.contains('impaktfull')) return false;
            return license.contains(searchText);
          });
        } else {
          return false;
        }
      }).toList();

  @override
  void initState() {
    super.initState();
    _getLicenses();
  }

  @override
  Widget build(BuildContext context) {
    final showSearch = _search || !ImpaktfullUiResponsiveLayout.isSmall(context);
    return ImpaktfullUiAdaptiveScreen(
      title: 'Licenses',
      onBackTapped: widget.onBackTapped,
      actions: [
        if (ImpaktfullUiResponsiveLayout.isSmall(context)) ...[
          ImpaktfullUiAdaptiveNavBarActionItem(
            title: 'Search',
            asset: theme.assets.icons.search,
            onTap: _onSearchTapped,
          ),
        ],
      ],
      headerBottomChild: showSearch
          ? Padding(
              padding: EdgeInsetsDirectional.only(
                start: 16,
                end: 16,
                bottom: ImpaktfullUiResponsiveLayout.isSmall(context) ? 16 : 0,
              ),
              child: ImpaktfullUiClampedFractionallySizedBox(
                widthFactor: 0.5,
                minWidth: 600,
                maxWidth: 800,
                child: ImpaktfullUiInputField(
                  value: _searchText,
                  placeholder: 'Search for any license',
                  onChanged: _onSearchChanged,
                ),
              ),
            )
          : null,
      builder: (context) => ImpaktfullUiListView.builder(
        items: _filteredLicenses,
        spacing: 8,
        isLoading: _isLoading,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, item, index) {
          return ImpaktfullUiCard(
            padding: EdgeInsets.zero,
            child: ImpaktfullUiAccordion(
              title: item.name,
              expanded: _expandedSet.contains(item),
              onExpandedChanged: (value) => _onExpandedChanged(item),
              animated: item.licenses.length < 2,
              expandedBuilder: (context) => ImpaktfullUiAutoLayout.vertical(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ImpaktfullUiDivider(),
                  Container(
                    color: theme.colors.canvas,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: ImpaktfullUiMarkdown(
                      data: item.licenseString,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        noDataLabel: 'No licenses found',
      ),
    );
  }

  Future<void> _getLicenses() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final licenses = <ImpaktfullUiLicense>[];
      final rawLicenses = <String, List<String>>{};
      await for (final LicenseEntry entry in LicenseRegistry.licenses) {
        for (final package in entry.packages) {
          final list = rawLicenses[package] ?? <String>[];
          final value = entry.paragraphs.map((p) {
            if (p.indent == LicenseParagraph.centeredIndent) {
              return '${' ' * 4}${p.text}';
            } else {
              return '${' ' * (p.indent * 2)}${p.text}';
            }
          }).join('\n\n');
          list.add(value);
          rawLicenses[package] = list;
        }
      }

      for (final rawLicense in rawLicenses.entries) {
        licenses.add(ImpaktfullUiLicense(
          name: rawLicense.key,
          licenses: rawLicense.value,
        ));
      }
      _licenses.addAll(licenses);
      _licenses.sort((a, b) => a.name.compareTo(b.name));
    } catch (error, trace) {
      debugPrint(error.toString());
      debugPrint(trace.toString());
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _onExpandedChanged(ImpaktfullUiLicense value) {
    if (_expandedSet.contains(value)) {
      _expandedSet.remove(value);
    } else {
      _expandedSet.add(value);
    }
    setState(() {});
  }

  void _onSearchTapped() {
    setState(() => _search = !_search);
  }

  void _onSearchChanged(String value) {
    setState(() {
      _expandedSet.clear();
      _searchText = value;
    });
  }
}
