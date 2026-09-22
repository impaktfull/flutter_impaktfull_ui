// Types that the public API uses must be importable from
// `package:impaktfull_ui/impaktfull_ui.dart`. This file only imports the
// barrel, so it stops compiling when one of these exports is removed.
//
// The complete check runs in CI: `tool/public_api/bin/check_public_api.dart`
// fails when any public signature uses a type of the package that is not
// exported.
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

void main() {
  test('Types used by the public API are exported', () {
    const types = <Type>[
      ImpaktfullUiAutoCompleteControllerListener,
      ImpaktfullUiChatStatus,
      ImpaktfullUiCheckboxType,
      ImpaktfullUiCommandMenuController,
      ImpaktfullUiCommandMenuListener,
      ImpaktfullUiDatePickerType,
      ImpaktfullUiFilePickerProgressType,
      ImpaktfullUiGridViewLocalizations,
      ImpaktfullUiImageCropController,
      ImpaktfullUiImageCropCropper,
      ImpaktfullUiImageCropInfo,
      ImpaktfullUiImageCropOverlay,
      ImpaktfullUiImageCropCircleOverlay,
      ImpaktfullUiImageCropSquareOverlay,
      ImpaktfullUiSnackyConfiguratorTheme,
      ImpaktfullUiSnackyConfiguratorAssetsTheme,
      ImpaktfullUiSnackyConfiguratorColorTheme,
      ImpaktfullUiSnackyConfiguratorDimensTheme,
      ImpaktfullUiSnackyConfiguratorTextStyleTheme,
      ImpaktfullUiTableHeaderItemType,
      ImpaktfullUiTableRowItemType,
    ];
    expect(types.toSet(), hasLength(types.length));
  });

  test('Widgets listed in the README are exported', () {
    const types = <Type>[
      ImpaktfullUiContainer,
      ImpaktfullUiFocusFeedback,
      ImpaktfullUiHoverFeedback,
      ImpaktfullUiSnackyConfigurator,
    ];
    expect(types.toSet(), hasLength(types.length));
  });

  test('Apps can pass values of the exported types', () {
    final imageCrop = ImpaktfullUiImageCrop(
      size: 100,
      controller: ImpaktfullUiImageCropController(),
      cropOverlay: const ImpaktfullUiImageCropCircleOverlay(),
    );
    expect(imageCrop.cropOverlay, isA<ImpaktfullUiImageCropOverlay>());

    final chatItem = ImpaktfullUiChatItem(
      senderId: 'sender',
      timestamp: DateTime(2026),
      status: ImpaktfullUiChatStatus.sent,
    );
    expect(chatItem.status, ImpaktfullUiChatStatus.sent);

    const localizations = ImpaktfullUiGridViewLocalizations(
      refreshBtnLabel: 'Reload',
    );
    expect(localizations.refreshBtnLabel, 'Reload');

    const checkbox = ImpaktfullUiCheckbox.indeterminate(
      value: null,
      onChanged: null,
    );
    expect(checkbox.type, ImpaktfullUiCheckboxType.indeterminate);
  });
}
