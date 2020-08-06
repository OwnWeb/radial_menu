import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:radial_menu/radial_menu.dart';

void main() {
  const MethodChannel channel = MethodChannel('radial_menu');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await RadialMenu.platformVersion, '42');
  });
}
