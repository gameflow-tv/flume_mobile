import 'package:flutter/painting.dart';

/// {@category Foundation}
/// {@subCategory Shadows}
/// Shadows defined by Flume.
class FlumeShadows {
  const FlumeShadows({
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
  factory FlumeShadows.fallback() => const FlumeShadows(
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
          blurRadius: 2,
          spreadRadius: 1,
        ),
        text: BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.6),
          offset: Offset(0, 2),
          blurRadius: 4,
        ),
      );

  /// {@category Foundation}
  /// {@subCategory Shadows}
  /// Map from shadow name to shadow value.
  Map<String, BoxShadow> toMap() => {
        'xs': xs,
        'sm': sm,
        'md': md,
        'lg': lg,
        'focus': focus,
        'text': text,
      };

  /// {@category Foundation}
  /// {@subCategory Shadows}
  /// List of all shadows, ordered from smallest to largest.
  List<BoxShadow> get values => [
        xs,
        sm,
        md,
        lg,
        text,
        focus,
      ];
}
