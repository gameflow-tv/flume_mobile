import 'dart:ui';

import 'package:test/test.dart';
import 'package:flume/flume.dart';

void main() {
  test('Color.brighten() should return a brighter version of the color', () {
    const color = Color(0xff000000);
    final brighter = color.brighten(0.5);
    expect(brighter, const Color(0xff191919));
  });
}
