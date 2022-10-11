import 'dart:ui';

import 'package:flume/flume.dart';
import 'package:test/test.dart';

void main() {
  test('HSL.fromColor() returns correct values', () {
    const color = Color(0xff00ff00);
    var result = HSL.fromColor(color);
    expect(result, equals(const HSL(120, 1, 0.5)));
  });

  test('HSL.fromRGB() returns correct values', () {
    const color = Color(0xff00ff00);
    var result = HSL.fromRGB(RGB(color.red, color.green, color.blue));
    expect(result, equals(const HSL(120, 1, 0.5)));
  });
}
