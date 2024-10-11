import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/accordion/model/accordion_reveal_type.dart';
import 'package:impaktfull_ui_2/src/components/accordion/accordion_style.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/simple_list_item/simple_list_item.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'accordion_style.dart';
export 'model/accordion_reveal_type.dart';

part 'accordion.describe.dart';

class ImpaktfullUiAccordion extends StatefulWidget
    with ComponentDescriptorMixin {
  final String title;
  final WidgetBuilder expandedBuilder;
  final String? subtitle;
  final ImpaktfullUiAccordionRevealType revealType;
  final ImpaktfullUiAccordionTheme? theme;

  const ImpaktfullUiAccordion({
    required this.title,
    required this.expandedBuilder,
    this.subtitle,
    this.revealType = ImpaktfullUiAccordionRevealType.topDown,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiAccordion> createState() => _ImpaktfullUiAccordionState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiAccordionState extends State<ImpaktfullUiAccordion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiAccordionTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        return ImpaktfullUiAutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImpaktfullUiSimpleListItem(
              title: widget.title,
              subtitle: widget.subtitle,
              onTap: _toggleExpanded,
              trailingWidgetBuilder: (context) => RotationTransition(
                turns:
                    Tween<double>(begin: 0, end: 0.5).animate(_expandAnimation),
                child: ImpaktfullUiAssetWidget(
                  asset: componentTheme.assets.arrow,
                ),
              ),
            ),
            SizeTransition(
              sizeFactor: _expandAnimation,
              axisAlignment: widget.revealType.axisAlignment,
              child: widget.expandedBuilder(context),
            ),
          ],
        );
      },
    );
  }

  void _toggleExpanded() {
    setState(() {
      _expanded = !_expanded;
      if (_expanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
}
