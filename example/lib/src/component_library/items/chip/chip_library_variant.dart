import 'package:material_ui/material_ui.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/items/chip/chip_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class ChipLibraryVariant
    extends ComponentLibraryVariant<ChipLibraryPrimaryInputs> {
  const ChipLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, ChipLibraryPrimaryInputs inputs) {
    final title = inputs.title.value ?? '{chip_title}';
    final value = inputs.value.value ?? false;
    final leadingIcon = inputs.leadingIcon.value;
    return [
      ComponentsLibraryVariantDescriptor(
        title: 'Default',
        child: ImpaktfullUiChip(
          title: title,
          value: value,
          onTap: inputs.value.toggle,
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        title: 'With a leading icon',
        child: ImpaktfullUiChip(
          title: title,
          value: value,
          leading:
              leadingIcon == null ? null : ImpaktfullUiAsset.icon(leadingIcon),
          onTap: inputs.value.toggle,
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        title: 'Disabled (onTap: null)',
        child: ImpaktfullUiChip(
          title: title,
          value: value,
          onTap: null,
        ),
      ),
      const ComponentsLibraryVariantDescriptor(
        title: 'Filters in a Wrap (more than one can be selected)',
        child: _ChipFilters(),
      ),
    ];
  }

  @override
  ChipLibraryPrimaryInputs inputs() => ChipLibraryPrimaryInputs();
}

class ChipLibraryPrimaryInputs extends ChipLibraryInputs {}

class _ChipFilters extends StatefulWidget {
  const _ChipFilters();

  @override
  State<_ChipFilters> createState() => _ChipFiltersState();
}

class _ChipFiltersState extends State<_ChipFilters> {
  static const _filters = ['Unread', 'Starred', 'With attachments', 'Today'];
  final _selected = <String>{'Unread'};

  void _onFilterTapped(String filter) {
    setState(() {
      if (!_selected.remove(filter)) _selected.add(filter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final filter in _filters)
          ImpaktfullUiChip(
            title: filter,
            value: _selected.contains(filter),
            onTap: () => _onFilterTapped(filter),
          ),
      ],
    );
  }
}
