import 'dart:ui';

import 'package:flume/flume.dart';
import 'package:test/test.dart';

void main() {
  test('LCH.fromRGB() returns correct values', () {
    const color = Color(0xff00ff00);
    var result = LCH.fromRGB(RGB(color.red, color.green, color.blue));
    expect(
        result,
        equals(const LCH(
          87.73472235279792,
          119.77587390168694,
          67.30671881654393,
        )));
  });
}
