import 'dart:ui';

import 'package:flume/flume.dart';
import 'package:test/test.dart';

void main() {
  test('LCH.fromRGB() returns correct values', () {
    const color = Color(0xff00ff00);
    var result = LCH.fromCIELAB(
      CIELAB.fromColor(
        RGB(color.red, color.green, color.blue).toColor(),
      ),
    );
    expect(
      result,
      equals(
        const LCH(
          87.73703347354422,
          119.77853621173065,
          136.01595610184012,
        ),
      ),
    );
  });
}
