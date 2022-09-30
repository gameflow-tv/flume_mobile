import 'package:flutter/painting.dart';

/// {@category Foundation}
/// {@subCategory Shadows}
/// Shadows defined by Flume.
class Shadows {
  const Shadows({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.focus,
    required this.text,
  });

  /// {@category Foundation}
  /// {@subCategory Shadows}
  /// Extra small shadow.
  final BoxShadow xs;

  /// {@category Foundation}
  /// {@subCategory Shadows}
  /// Small shadow.
  final BoxShadow sm;

  /// {@category Foundation}
  /// {@subCategory Shadows}
  /// Medium shadow.
  final BoxShadow md;

  /// {@category Foundation}
  /// {@subCategory Shadows}
  /// Large shadow.
  final BoxShadow lg;

  /// {@category Foundation}
  /// {@subCategory Shadows}
  /// Focus shadow.
  final BoxShadow focus;

  /// {@category Foundation}
  /// {@subCategory Shadows}
  /// Text shadow.
  final BoxShadow text;

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
