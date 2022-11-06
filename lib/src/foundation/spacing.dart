import 'package:flutter/rendering.dart';

/// {@category Foundation}
/// {@subCategory Spacing}
/// Spacing defined by Flume.
class FlumeSpacing {
  const FlumeSpacing({
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
  /// Extra extra extra small spacing.
  final double xxxs;

  /// {@category Foundation}
  /// {@subCategory Spacing}
  /// Extra extra small spacing.
  final double xxs;

  /// {@category Foundation}
  /// {@subCategory Spacing}
  /// Extra small spacing.
  final double xs;

  /// {@category Foundation}
  /// {@subCategory Spacing}
  /// Small spacing.
  final double sm;

  /// {@category Foundation}
  /// {@subCategory Spacing}
  /// Medium spacing.
  final double md;

  /// {@category Foundation}
  /// {@subCategory Spacing}
  /// Large spacing.
  final double lg;

  /// {@category Foundation}
  /// {@subCategory Spacing}
  /// Extra large spacing.
  final double xl;

  /// {@category Foundation}
  /// {@subCategory Spacing}
  /// Extra extra large spacing.
  final double xxl;

  /// {@category Foundation}
  /// {@subCategory Spacing}
  /// Default spacing defined by Flume.
  factory FlumeSpacing.fallback() => const FlumeSpacing(
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
  EdgeInsetsData get insets => EdgeInsetsData(this);
}

/// Utility class for using Flume spacing with Flutter's [EdgeInsets].
class EdgeInsetsData {
  final FlumeSpacing _spacing;

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
