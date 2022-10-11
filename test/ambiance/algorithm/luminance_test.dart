import 'dart:ui';

import 'package:flume/flume.dart';
import 'package:test/test.dart';

void main() {
  test('Color.luminance() returns black if lum is 0', () {
    const color = Color(0xffff00ff);
    var result = color.luminance(0);
    expect(result, equals(const Color(0xff000000)));
  });

  test('Color.luminance() returns white if lum is 1', () {
    const color = Color(0xffff00ff);
    var result = color.luminance(1);
    expect(result, equals(const Color(0xffffffff)));
  });

  test('Color.luminance() returns correct values', () {
    const color = Color(0xff242729);
    var result = color.luminance(0.02);
    expect(result, equals(const Color(0xff242729)));
  });
}
