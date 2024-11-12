import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/skeleton/skeleton_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class SkeletonLibraryVariant
    extends ComponentLibraryVariant<SkeletonLibraryPrimaryInputs> {
  const SkeletonLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, SkeletonLibraryPrimaryInputs inputs) {
    return [
      const ComponentsLibraryVariantDescriptor(
        wrapWithCard: true,
        width: double.infinity,
        child: ImpaktfullUiSkeleton.box(
          width: 100,
          height: 16,
        ),
      ),
      const ComponentsLibraryVariantDescriptor(
        wrapWithCard: true,
        width: double.infinity,
        child: ImpaktfullUiSkeleton.factor(
          widthFactor: 0.2,
          height: 16,
        ),
      ),
      const ComponentsLibraryVariantDescriptor(
        wrapWithCard: true,
        child: ImpaktfullUiSkeleton.circle(
          width: 100,
          height: 100,
        ),
      ),
      const ComponentsLibraryVariantDescriptor(
        title: 'Full layout',
        wrapWithCard: true,
        width: 500,
        child: ImpaktfullUiAutoLayout.horizontal(
          spacing: 8,
          children: [
            ImpaktfullUiSkeleton.circle(
              width: 32,
              height: 32,
            ),
            Expanded(
              child: ImpaktfullUiAutoLayout.vertical(
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                children: [
                  ImpaktfullUiSkeleton.factor(
                    widthFactor: 1,
                    height: 16,
                  ),
                  ImpaktfullUiSkeleton.factor(
                    widthFactor: 0.8,
                    height: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  SkeletonLibraryPrimaryInputs inputs() => SkeletonLibraryPrimaryInputs();
}

class SkeletonLibraryPrimaryInputs extends SkeletonLibraryInputs {}
