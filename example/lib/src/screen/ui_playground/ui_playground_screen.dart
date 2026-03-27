import 'package:flutter/material.dart';
import 'package:impaktfull_ui_example/src/ui_playground/impaktfull_ui_components.dart';
import 'package:ui_playground/ui_playground.dart';

class UiPlaygroundScreen extends StatelessWidget {
  const UiPlaygroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UiPlaygroundApp(title: "UI Playground", sections: [
      UiPlaygroundSection(
        title: "Components",
        items: AppComponents.items,
      ),
    ]);
  }
}
