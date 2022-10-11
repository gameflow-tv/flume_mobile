import 'dart:ui';

import 'package:flume/flume.dart';
import 'package:test/test.dart';

void main() {
  test('lightColor() should return a light version of the color', () {
    const color = Color(0xff11aa11);
    final light = lightColor(color);
    expect(light, const Color(0xff53e82b));
  });
}
