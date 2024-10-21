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
  final bool expanded;
  final bool animated;
  final String? subtitle;
  final ImpaktfullUiAccordionRevealType revealType;
  final ImpaktfullUiAccordionTheme? theme;
  final ValueChanged<bool>? onExpandedChanged;

  const ImpaktfullUiAccordion({
    required this.title,
    required this.expandedBuilder,
    required this.expanded,
    this.animated = true,
    this.subtitle,
    this.revealType = ImpaktfullUiAccordionRevealType.topDown,
    this.theme,
    this.onExpandedChanged,
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
    if (widget.expanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(ImpaktfullUiAccordion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.expanded != oldWidget.expanded) {
      _setExpanded(widget.expanded);
    }
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
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.vertical(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImpaktfullUiSimpleListItem(
            title: widget.title,
            subtitle: widget.subtitle,
            onTap: _toggleExpanded,
            trailingWidgetBuilder: (context) => AnimatedRotation(
              turns: widget.expanded ? -0.5 : 0,
              duration: const Duration(milliseconds: 200),
              child: ImpaktfullUiAssetWidget(
                asset: componentTheme.assets.chevronDown,
              ),
            ),
          ),
          if (widget.animated) ...[
            SizeTransition(
              sizeFactor: _expandAnimation,
              axisAlignment: widget.revealType.axisAlignment,
              child: widget.expandedBuilder(context),
            ),
          ] else ...[
            if (widget.expanded) ...[
              widget.expandedBuilder(context),
            ],
          ],
        ],
      ),
    );
  }

  void _toggleExpanded() {
    final newValue = !widget.expanded;
    widget.onExpandedChanged?.call(newValue);
  }

  void _setExpanded(bool expanded) {
    if (expanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
}
