import 'dart:ui';

import 'package:flume/flume.dart';
import 'package:test/test.dart';

void main() {
  test('CIEXYZ.fromRGB() returns correct values', () {
    const color = Color(0xff00ff00);
    var result = CIEXYZ.fromRGB(RGB(color.red, color.green, color.blue));

    expect(
      result,
      equals(const CIEXYZ(
        0.7218994150278784,
        0.8942648478689476,
        0.47836824535545847,
      )),
    );
  });
}
