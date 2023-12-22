

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:ibaapp/Question2.dart';

void main() {
  setUpAll(() => {loadAppFonts()});
  testGoldens('DeviceBuilder - multiple scenarios - with onCreate',
      (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
      ])
      ..addScenario(
        widget: const MyApp(),
        name: 'default',
      );

    await tester.pumpDeviceBuilder(
      builder,
      // wrapper: materialAppWrapper(
      //   theme: ThemeData.light(),
      //   platform: TargetPlatform.android,
      // ),
    );
    await screenMatchesGolden(
        tester, 'a');
  });
}
