import 'dart:ui';

import 'package:test/test.dart';
import 'package:flume/flume.dart';

void main() {
  test('Color.saturate() should return a saturated version of the color', () {
    const color = Color(0xffccaabb);
    final saturated = color.saturate(1);
    expect(saturated, const Color(0xffe69dc3));
  });
}
