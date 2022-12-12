import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flume/src/ambiance/conversion/lab.dart';
import 'package:flume/src/ambiance/conversion/rgb.dart';

/// {@category Ambiance}
/// Class representing the CIEXYZ colorspace.
class CIEXYZ extends Equatable {
  /// Reference white color.
  static const referenceWhite = CIEXYZ(95.047, 100, 108.883);

  /// X value.
  final num x;

  /// Y value.
  final num y;

  /// Z value.
  final num z;

  const CIEXYZ(this.x, this.y, this.z);

  RGB toRGB() {
    num x = this.x / 100;
    num y = this.y / 100;
    num z = this.z / 100;

    var rgb = <String, num>{
      'r': x * 3.2406 + y * -1.5372 + z * -0.4986,
      'g': x * -0.9689 + y * 1.8758 + z * 0.0415,
      'b': x * 0.0557 + y * -0.2040 + z * 1.0570
    };

    rgb.forEach((key, value) {
      if (value > 0.0031308) {
        rgb[key] = 1.055 * pow(value, 1 / 2.4) - 0.055;
      } else {
        rgb[key] = value * 12.92;
      }
      rgb[key] = rgb[key]! * 255;
    });

    return RGB(rgb['r']!.toInt(), rgb['g']!.toInt(), rgb['b']!.toInt());
  }

  CIELAB toCIELAB() {
    var lab = <String, num>{};
    var xyz = <String, num>{};

    toMap().forEach((String key, num value) {
      value /= referenceWhite.toMap()[key]!;

      if (value > 0.008856) {
        value = pow(value, 1 / 3);
      } else {
        value = (7.787 * value) + 16 / 116;
      }
      xyz[key] = value;
    });

    lab['l'] = (116 * xyz['y']!) - 16;
    lab['a'] = 500 * (xyz['x']! - xyz['y']!);
    lab['b'] = 200 * (xyz['y']! - xyz['z']!);

    return CIELAB(
        lab['l']!.toDouble(), lab['a']!.toDouble(), lab['b']!.toDouble());
  }

  factory CIEXYZ.fromRGB(RGB rgb) {
    return rgb.toCIEXYZ();
  }

  Map<String, num> toMap() => {'x': x, 'y': y, 'z': z};

  @override
  List<Object?> get props => [x, y, z];
}
