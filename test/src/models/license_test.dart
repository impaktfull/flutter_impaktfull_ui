import 'package:flutter_test/flutter_test.dart';
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
}
