import 'package:flutter/material.dart';

class TabBarControllerConfigurator extends StatefulWidget {
  final Widget Function(BuildContext, TabController, Function() setState)
      builder;
  const TabBarControllerConfigurator({
    required this.builder,
    super.key,
  });

  @override
  State<TabBarControllerConfigurator> createState() =>
      _TabBarControllerConfiguratorState();
}

class _TabBarControllerConfiguratorState
    extends State<TabBarControllerConfigurator> with TickerProviderStateMixin {
  late final TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      controller,
      () => setState(() {}),
    );
  }
}
