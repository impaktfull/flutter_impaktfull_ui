import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';
import 'package:impaktfull_ui_example/src/util/network_images.dart';

class LicensesBuildingBlock extends BuildingBlockLibraryItem {
  const LicensesBuildingBlock();

  @override
  String get title => 'ImpaktfullUiBBLicenses';

  @override
  Widget build(BuildContext context) {
    return const ImpaktfullUiBBLicenses(
      // The licenses of the app itself, next to the ones of its packages.
      // They are shown first, and a license can credit the author of an image
      // by showing that image.
      customLicenses: [
        ImpaktfullUiLicense(
          name: 'Photo by stein egil liland',
          licenses: [
            'Time lapse photo of northern lights, free to use under the '
                '[Pexels license](https://www.pexels.com/license/).\n\n'
                'https://www.pexels.com/photo/time-lapse-photo-of-northern-lights-1933316/',
          ],
          image: ImpaktfullUiAsset.network(NetworkImages.image16x9),
          imageSemanticLabel: 'Time lapse photo of northern lights',
        ),
        ImpaktfullUiLicense(
          name: 'Pexels',
          licenses: [
            'All photos of this app are from [Pexels](https://www.pexels.com/).',
          ],
        ),
      ],
    );
  }
}
