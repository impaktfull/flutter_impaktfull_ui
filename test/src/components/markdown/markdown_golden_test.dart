import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_markdown_headings',
    goldenTests: () => [
      GoldenTest(
        description: 'headings',
        child: goldenBox(
          width: 400,
          child: const ImpaktfullUiMarkdown(
            data: '# Heading 1\n'
                '## Heading 2\n'
                '### Heading 3\n'
                '#### Heading 4\n'
                '##### Heading 5\n'
                '###### Heading 6\n',
          ),
        ),
      ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_markdown',
    goldenTests: () => [
      GoldenTest(
        description: 'paragraphs, lists, links and code',
        child: goldenBox(
          width: 400,
          child: ImpaktfullUiMarkdown(
            onOpenLink: (_) {},
            data: 'A paragraph with **bold**, *italic* and '
                '[a link](https://impaktfull.com).\n'
                '\n'
                '- First item\n'
                '- Second item\n'
                '\n'
                '1. Ordered\n'
                '2. List\n'
                '\n'
                'Inline `code` in a sentence.\n'
                '\n'
                '```\n'
                'void main() {\n'
                '  print("Hello");\n'
                '}\n'
                '```\n'
                '\n'
                '$longText\n',
          ),
        ),
      ),
    ],
  );
}
