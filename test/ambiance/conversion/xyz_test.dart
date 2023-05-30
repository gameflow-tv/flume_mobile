import 'dart:ui';

import 'package:flume/flume.dart';
import 'package:test/test.dart';

void main() {
  test('CIEXYZ.fromColor() returns correct values', () {
    const color = Color(0xff00ff00);
    var result =
        CIEXYZ.fromColor(RGB(color.red, color.green, color.blue).toColor());

    expect(
      result,
      equals(const CIEXYZ(
        0.3576,
        0.7152,
        0.1192,
      )),
    );
  });
}
