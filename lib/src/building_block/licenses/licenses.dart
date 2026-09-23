import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/building_block/licenses/licenses.localizations.dart';
import 'package:impaktfull_ui/src/building_block/licenses/licenses.theme.dart';
import 'package:impaktfull_ui/src/components/accordion/accordion.dart';
import 'package:impaktfull_ui/src/components/adaptive_nav_bar/adaptive_nav_bar.dart';
import 'package:impaktfull_ui/src/components/adaptive_screen/adaptive_screen.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/card/card.dart';
import 'package:impaktfull_ui/src/components/clamped_fractionally_sized_box/clamped_fractionally_sized_box.dart';
import 'package:impaktfull_ui/src/components/divider/divider.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui/src/components/localization/localization_provider.dart';
import 'package:impaktfull_ui/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui/src/components/responsive_layout/responsive_layout.dart';
import 'package:impaktfull_ui/src/models/license.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

export 'licenses.localizations.dart';
export 'licenses.theme.dart';

/// Shows the licenses of every package of the app, and the [customLicenses]
/// of the app itself.
class ImpaktfullUiBBLicenses extends StatefulWidget {
  final VoidCallback? onBackTapped;

  /// The licenses of the app itself, e.g. the credit for the author of a
  /// photo. A license with an `image` shows that image when it is expanded.
  ///
  /// They are shown first, in this order, above the licenses of the packages
  /// (which are sorted by package name). They are searched the same way as the
  /// packages: on their [ImpaktfullUiLicense.name].
  ///
  /// An alternative is Flutter's `LicenseRegistry.addLicense`, which also adds
  /// a license to this screen (and to Flutter's own `LicensePage`). Use that
  /// one for a license that belongs to code, and [customLicenses] for a
  /// license that is only about this screen, or that shows an image.
  final List<ImpaktfullUiLicense> customLicenses;

  final ImpaktfullUiBBLicensesLocalizations? localizations;

  const ImpaktfullUiBBLicenses({
    this.onBackTapped,
    this.customLicenses = const [],
    this.localizations,
    super.key,
  });

  @override
  State<ImpaktfullUiBBLicenses> createState() => _ImpaktfullUiBBLicensesState();
}

class _ImpaktfullUiBBLicensesState extends State<ImpaktfullUiBBLicenses> {
  var _isLoading = false;

  final _packageLicenses = <ImpaktfullUiLicense>[];
  final _expandedSet = <ImpaktfullUiLicense>{};

  var _search = false;
  var _searchText = '';

  final _queryListForLicenses = [
    'impaktfull',
    'koen van looveren',
  ];

  /// The custom licenses of the app first, then the licenses of the packages
  /// sorted by name, so the position of a custom license never depends on
  /// which packages the app uses.
  List<ImpaktfullUiLicense> get _licenses => [
        ...widget.customLicenses,
        ..._packageLicenses,
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
    final theme = ImpaktfullUiTheme.of(context);
    final showSearch =
        _search || !ImpaktfullUiResponsiveLayout.isSmallOrSmaller(context);
    return ImpaktfullUiLocalizationProvider(
      localizations: widget.localizations,
      builder: (context, localizations) => ImpaktfullUiAdaptiveScreen(
        title: localizations.title,
        onBackTapped: widget.onBackTapped,
        actions: [
          if (ImpaktfullUiResponsiveLayout.isSmallOrSmaller(context)) ...[
            ImpaktfullUiAdaptiveNavBarActionItem(
              title: localizations.searchTooltip,
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
                  bottom: ImpaktfullUiResponsiveLayout.isSmallOrSmaller(context)
                      ? 16
                      : 0,
                ),
                child: ImpaktfullUiClampedFractionallySizedBox(
                  widthFactor: 0.5,
                  minWidth: 600,
                  maxWidth: 800,
                  child: ImpaktfullUiInputField(
                    value: _searchText,
                    placeholder: localizations.searchPlaceholder,
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
          itemBuilder: (context, item, index) => ImpaktfullUiCard(
            padding: EdgeInsets.zero,
            child: ImpaktfullUiAccordion(
              title: item.name,
              expanded: _expandedSet.contains(item),
              onExpansionChanged: (value) => _onExpandedChanged(item),
              animated: item.licenses.length < 2,
              expandedBuilder: (context) => ImpaktfullUiAutoLayout.vertical(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ImpaktfullUiDivider(),
                  Container(
                    color: theme.colors.canvas,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: _ImpaktfullUiBBLicenseContent(license: item),
                  ),
                ],
              ),
            ),
          ),
          placeholderData: ImpaktfullUiListViewPlaceholderData(
            title: localizations.noLicensesFound,
          ),
        ),
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
      _packageLicenses.addAll(licenses);
      _packageLicenses.sort((a, b) => a.name.compareTo(b.name));
    } catch (error, trace) {
      debugPrint(error.toString());
      debugPrint(trace.toString());
    }
    // The licenses are loaded asynchronously: the screen can be closed before
    if (!mounted) return;
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

/// The expanded content of one license: its image (when it credits one) and
/// its license texts.
class _ImpaktfullUiBBLicenseContent extends StatelessWidget {
  final ImpaktfullUiLicense license;

  const _ImpaktfullUiBBLicenseContent({
    required this.license,
  });

  @override
  Widget build(BuildContext context) {
    final markdown = ImpaktfullUiMarkdown(data: license.licenseString);
    final image = license.image;
    // Licenses without an image keep exactly the layout they had.
    if (image == null) return markdown;
    final theme = ImpaktfullUiBBLicensesTheme.of(context);
    return ImpaktfullUiAutoLayout.vertical(
      mainAxisSize: MainAxisSize.min,
      spacing: theme.dimens.imageSpacing,
      children: [
        ClipRRect(
          borderRadius: theme.dimens.imageBorderRadius,
          child: ImpaktfullUiAssetWidget(
            asset: image,
            height: theme.dimens.imageHeight,
            // Keeps the aspect ratio of the image: its width follows its
            // height, so it is never distorted.
            fit: BoxFit.contain,
            semanticLabel: license.imageSemanticLabel ?? license.name,
          ),
        ),
        markdown,
      ],
    );
  }
}
