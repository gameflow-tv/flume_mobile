import 'package:flutter/rendering.dart';

/// {@category Foundation}
/// {@subCategory Spacing}
/// Spacing defined by Flume.
class Spacing {
  final double xxxs;
  final double xxs;
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;

  const Spacing({
    required this.xxxs,
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });

  /// {@category Foundation}
  /// {@subCategory Spacing}
  /// Default spacing defined by Flume.
  factory Spacing.fallback() => const Spacing(
        xxxs: 2,
        xxs: 4,
        xs: 8,
        sm: 12,
        md: 16,
        lg: 24,
        xl: 32,
        xxl: 48,
      );

  /// {@category Foundation}
  /// {@subCategory Spacing}
  /// EdgeInsets with the same spacing on all sides.
  EdgeInsetsData insets() => EdgeInsetsData(this);
}

/// Utility class for using Flume spacing with Flutter's [EdgeInsets].
class EdgeInsetsData {
  final Spacing _spacing;

  const EdgeInsetsData(this._spacing);

  EdgeInsets get xxxs => EdgeInsets.all(_spacing.xxxs);
  EdgeInsets get xxs => EdgeInsets.all(_spacing.xxs);
  EdgeInsets get xs => EdgeInsets.all(_spacing.xs);
  EdgeInsets get sm => EdgeInsets.all(_spacing.sm);
  EdgeInsets get md => EdgeInsets.all(_spacing.md);
  EdgeInsets get lg => EdgeInsets.all(_spacing.lg);
  EdgeInsets get xl => EdgeInsets.all(_spacing.xl);
  EdgeInsets get xxl => EdgeInsets.all(_spacing.xxl);
}
