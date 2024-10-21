import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/accordion/accordion.dart';
import 'package:impaktfull_ui_2/src/components/adaptive_screen/adaptive_screen.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/card/card.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui_2/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui_2/src/models/license.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

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

  @override
  void initState() {
    super.initState();
    _getLicenses();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiAdaptiveScreen(
      title: 'Licenses',
      onBackTapped: widget.onBackTapped,
      builder: (context) => ImpaktfullUiListView.builder(
        items: _licenses,
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
}
