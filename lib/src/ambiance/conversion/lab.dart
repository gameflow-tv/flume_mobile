import 'dart:math';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flume/flume.dart';

/// {@category Ambiance}
/// Class representing the CIELAB colorspace.
class CIELAB extends Equatable {
  /// Perceptual lightness value.
  final double l;

  /// A value.
  final double a;

  /// B value.
  final double b;

  const CIELAB(this.l, this.a, this.b);

  /// Converts [Color] to [CIELAB] color.
  factory CIELAB.fromColor(Color color) {
    return CIELAB.fromRGB(RGB.fromColor(color));
  }

  /// Converts [RGB] to [CIELAB] color.
  factory CIELAB.fromRGB(RGB color) {
    final xyz = color.toCIEXYZ();
    final double x = xyz.x.toDouble();
    final double y = xyz.y.toDouble();
    final double z = xyz.z.toDouble();

    final double l = 116 * y - 16;

    return CIELAB(l < 0 ? 0 : l, 500 * (x - y), 200 * (y - z));
  }

  /// Converts [CIELAB] to [Color].
  Color toColor() {
    return toRGB().toColor();
  }

  /// Converts [CIELAB] to [RGB].
  RGB toRGB() {
    return toXYZ().toRGB();
  }

  /// Converts [CIELAB] to [CIEXYZ].
  CIEXYZ toXYZ() {
    var xyz = <String, num>{
      'x': a / 500 + (l + 16) / 116,
      'y': (l + 16) / 116,
      'z': (l + 16) / 116 - b / 200
    };

    xyz.forEach((key, value) {
      var cube = pow(value, 3);
      if (cube > 0.008856) {
        xyz[key] = cube;
      } else {
        xyz[key] = (value - 16 / 116) / 7.787;
      }
      xyz[key] = xyz[key]! * CIEXYZ.referenceWhite.toMap()[key]!;
    });

    return CIEXYZ(xyz['x']!, xyz['y']!, xyz['z']!);
  }

  @override
  List<Object> get props => [l, a, b];
}

/// {@category Ambiance}
/// Extension that adds [CIELAB] conversion methods to [Color].
extension CIELABExtension on Color {
  /// Converts [Color] to [CIELAB] color.
  CIELAB toCIELAB() {
    return CIELAB.fromColor(this);
  }

  /// Converts [CIELAB] color to [Color].
  static Color fromCIELAB(CIELAB color) {
    return color.toColor();
  }
}

// // Class representing the CIEXYZ coordinates.
// class CIEXYZ extends Equatable {
//   /// X value.
//   final double x;

//   /// Y value.
//   final double y;

//   /// Z value.
//   final double z;

//   const CIEXYZ(this.x, this.y, this.z);

//   factory CIEXYZ.fromRGB(RGB color) {
//     final double r = color.r / 255;
//     final double g = color.g / 255;
//     final double b = color.b / 255;

//     final double x = r * 0.4124 + g * 0.3576 + b * 0.1805;
//     final double y = r * 0.2126 + g * 0.7152 + b * 0.0722;
//     final double z = r * 0.0193 + g * 0.1192 + b * 0.9505;

//     return CIEXYZ(x, y, z);
//   }

//   /// Converts [Color] to [CIEXYZ] color.
//   static CIEXYZ fromColor(Color color) {
//     return CIEXYZ.fromRGB(RGB(color.red, color.green, color.blue));
//   }

//   @override
//   List<Object> get props => [x, y, z];
// }
