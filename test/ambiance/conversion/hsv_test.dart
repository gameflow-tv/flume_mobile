import 'dart:ui';

import 'package:flume/flume.dart';
import 'package:test/test.dart';

void main() {
  test('HSV.fromRGB() returns correct values', () {
    const color = Color(0xff00ff00);
    var result = HSV.fromRGB(RGB(color.red, color.green, color.blue));
    expect(result, equals(const HSV(0, 1, 1)));
  });

  test('HSV.toColor() returns correct color', () {
    const color = Color(0xff00ff00);
    var result = HSV.fromRGB(RGB(color.red, color.green, color.blue)).toColor();
    expect(result, equals(color));
  });
}
