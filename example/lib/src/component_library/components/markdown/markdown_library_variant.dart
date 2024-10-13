import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/markdown/markdown_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/util/network_images.dart';
import 'package:impaktfull_ui_example/src/widget/components/components_library_variant_descriptor.dart';

class MarkdownLibraryVariant
    extends ComponentLibraryVariant<MarkdownLibraryPrimaryInputs> {
  const MarkdownLibraryVariant();

  @override
  String get title => 'Default';

  final markdownText = '''
## Headers
      
# Header 1
## Header 2
### Header 3
#### Header 4
##### Header 5
###### Header 6

## Paragraph

Paragraph

## Lists

### Unordered List

- List Item 1
- List Item 2
    - Ordered List Item 2.1
    - Ordered List Item 2.2
    - Ordered List Item 2.3
  - Ordered List Item 3.1
  - Ordered List Item 3.2

### Ordered List

1. Ordered List Item 1
2. Ordered List Item 2
    1. Ordered List Item 2.1
    2. Ordered List Item 2.2
    3. Ordered List Item 2.3
  1. Ordered List Item 3.1
  1. Ordered List Item 3.2


## Links

[Open impaktfull website](https://www.impaktfull.com "impaktfull website")

## Code

`ImpaktfullUiApp.doEverythingForMe()`

## Images

### Asset image

![impaktfull logo](resource:assets/images/logo.svg "impaktfull.logo")

### Network image

![Failed to load image!](${NetworkImages.profilePicture}failt "We already knew this would fail!")

![Koen Van Looveren!](${NetworkImages.profilePicture} "Profile picture of Koen Van Looveren")
''';

  @override
  List<Widget> build(
      BuildContext context, MarkdownLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        isScrollable: true,
        child: ImpaktfullUiMarkdown(
          data: markdownText,
          onOpenLink: (url) => ImpaktfullUiNotification.show(
            title: 'On url tapped',
            subtitle: url,
          ),
        ),
      ),
    ];
  }

  @override
  MarkdownLibraryPrimaryInputs inputs() => MarkdownLibraryPrimaryInputs();
}

class MarkdownLibraryPrimaryInputs extends MarkdownLibraryInputs {}
