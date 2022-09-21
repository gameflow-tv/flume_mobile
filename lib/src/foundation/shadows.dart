import 'package:flutter/painting.dart';

/// {@category Foundation}
/// {@subCategory Shadows}
/// Shadows defined by Flume.
class Shadows {
  const Shadows({
    required BoxShadow xs,
    required BoxShadow sm,
    required BoxShadow md,
    required BoxShadow lg,
    required BoxShadow focus,
    required BoxShadow text,
  });

  /// {@category Foundation}
  /// {@subCategory Shadows}
  /// Default shadows defined by Flume.
  factory Shadows.fallback() => const Shadows(
        xs: BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          offset: Offset(0, 2),
          blurRadius: 4,
        ),
        sm: BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          offset: Offset(0, 4),
          blurRadius: 8,
        ),
        md: BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.2),
          offset: Offset(0, 4),
          blurRadius: 16,
        ),
        lg: BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.3),
          offset: Offset(0, 8),
          blurRadius: 20,
        ),
        focus: BoxShadow(
          color: Color.fromRGBO(255, 255, 255, 1.0),
          offset: Offset(0, 0),
          blurRadius: 4,
          spreadRadius: 2,
        ),
        text: BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.6),
          offset: Offset(0, 2),
          blurRadius: 4,
        ),
      );
}
