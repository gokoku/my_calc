import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

/*
  $ flutter driver --target=test_driver/app.dart
*/

void main() {
  FlutterDriver driver;

  setUpAll(() async => driver = await FlutterDriver.connect());

  tearDown(() => {if (driver != null) driver.close()});

  test(
    'input 33+3= then result 36',
    () async => {
      await driver.tap(find.byValueKey('3')),
      await driver.tap(find.byValueKey('3')),
      await driver.tap(find.byValueKey('+')),
      await driver.tap(find.byValueKey('3')),
      await driver.tap(find.byValueKey('=')),
      expect(await driver.getText(find.byValueKey('result')), "36")
    },
  );
}
