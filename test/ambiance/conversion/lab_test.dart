import 'dart:ui';

import 'package:flume/flume.dart';
import 'package:test/test.dart';

void main() {
  test('CIELAB.fromRGB() returns correct values', () {
    const color = Color(0xff00ff00);
    var result = CIELAB.fromRGB(RGB(color.red, color.green, color.blue));

    expect(
      result,
      equals(const CIELAB(
        87.73472235279792,
        -86.1827164205346,
        83.17932050269782,
      )),
    );
  });

  test('CIEXYZ.fromRGB() returns correct values', () {
    const color = Color(0xff00ff00);
    var result = CIEXYZ.fromRGB(RGB(color.red, color.green, color.blue));

    expect(
      result,
      equals(const CIEXYZ(0.3576, 0.7152, 0.1192)),
    );
  });
}
