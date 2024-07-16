import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/screen/components_library_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiThemeBuidler(
      builder: (context, theme) => Scaffold(
        body: Column(
          children: [
            const ImpaktfullUiCmsHeader(
              title: 'impaktfull ui',
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  ImpaktfullUiButton(
                    type: ImpaktfullUiButtonType.primary,
                    title: 'Components',
                    onTap: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => const ComponentsLibraryScreen())),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
