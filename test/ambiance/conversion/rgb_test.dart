import 'dart:ui';

import 'package:flume/flume.dart';
import 'package:test/test.dart';

void main() {
  test('RGB.fromHex() returns correct values', () {
    const color = Color(0xff242729);
    var result = RGB.fromHex('#242729');
    expect(result, equals(RGB(color.red, color.green, color.blue)));
  });

  test('RGB.fromHSL() returns correct values', () {
    const color = Color(0xff00ff00);
    var result = RGB.fromHSL(const HSL(120, 1, 0.5));
    expect(result, equals(RGB(color.red, color.green, color.blue)));
  });

  test('RGB.fromLCH() returns correct values', () {
    const color = Color(0xff00ff00);
    var result = RGB.fromLCH(const LCH(
      87.73703347354422,
      119.77853621173065,
      136.01595610184012,
    ));
    expect(result, equals(RGB(color.red, color.green, color.blue)));
  });

  test('RGB.fromCIELAB() returns correct values', () {
    const color = Color(0xff00ff00);
    var result = RGB.fromCIELAB(const CIELAB(
      87.73703347354422,
      -86.1830260852973,
      83.18041891891892,
    ));
    expect(result, equals(RGB(color.red, color.green, color.blue)));
  });

  test('toHex() returns correct hex string', () {
    const color = Color(0xff242729);
    var result = RGB(color.red, color.green, color.blue).toHex();
    expect(result, equals('#242729ff'));
  });

  test('toColor() returns correct color', () {
    const color = Color(0xff242729);
    var result = RGB(color.red, color.green, color.blue).toColor();
    expect(result, equals(color));
  });
}
