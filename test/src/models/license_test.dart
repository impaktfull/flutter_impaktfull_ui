import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/models/license.dart';

void main() {
  test('keeps the name and licenses', () {
    const license = ImpaktfullUiLicense(name: 'pkg', licenses: ['MIT']);
    expect(license.name, 'pkg');
    expect(license.licenses, ['MIT']);
  });

  test('licenseString is the only license', () {
    const license = ImpaktfullUiLicense(name: 'pkg', licenses: ['MIT']);
    expect(license.licenseString, 'MIT');
  });

  test('licenseString separates multiple licenses with a rule', () {
    const license =
        ImpaktfullUiLicense(name: 'pkg', licenses: ['MIT', 'BSD', 'Apache']);
    expect(license.licenseString, 'MIT\n\n---\n\nBSD\n\n---\n\nApache');
  });

  test('licenseString is empty without licenses', () {
    const license = ImpaktfullUiLicense(name: 'pkg', licenses: []);
    expect(license.licenseString, '');
  });

  test('has no image by default', () {
    const license = ImpaktfullUiLicense(name: 'pkg', licenses: ['MIT']);
    expect(license.image, isNull);
    expect(license.imageSemanticLabel, isNull);
  });

  test('keeps the image and its semantic label', () {
    const image = ImpaktfullUiAsset.pixel('photo.png');
    const license = ImpaktfullUiLicense(
      name: 'Photo by Jane',
      licenses: ['Free to use'],
      image: image,
      imageSemanticLabel: 'A mountain at sunrise',
    );
    expect(license.image, image);
    expect(license.imageSemanticLabel, 'A mountain at sunrise');
  });

  group('copyWith', () {
    const license = ImpaktfullUiLicense(
      name: 'pkg',
      licenses: ['MIT'],
      image: ImpaktfullUiAsset.pixel('photo.png'),
      imageSemanticLabel: 'A photo',
    );

    test('keeps every field without arguments', () {
      final copy = license.copyWith();
      expect(copy.name, 'pkg');
      expect(copy.licenses, ['MIT']);
      expect(copy.image, license.image);
      expect(copy.imageSemanticLabel, 'A photo');
    });

    test('replaces only what is passed', () {
      final copy = license.copyWith(name: 'other', licenses: ['BSD']);
      expect(copy.name, 'other');
      expect(copy.licenses, ['BSD']);
      expect(copy.image, license.image);
      expect(copy.imageSemanticLabel, 'A photo');
    });

    test('adds an image to a license without one', () {
      const withoutImage = ImpaktfullUiLicense(name: 'pkg', licenses: ['MIT']);
      const image = ImpaktfullUiAsset.network('https://example.com/a.png');
      final copy = withoutImage.copyWith(
        image: image,
        imageSemanticLabel: 'A photo',
      );
      expect(copy.image, image);
      expect(copy.imageSemanticLabel, 'A photo');
    });
  });
}
