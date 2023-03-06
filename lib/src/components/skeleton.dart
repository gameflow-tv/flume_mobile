import 'package:flume/flume.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

/// {@category Components}
/// A shimmer/skeleton placeholder component from the Flume design system.
class Skeleton extends StatelessWidget {
  /// Shimmer height.
  final double? height;

  /// Shimmer width.
  final double? width;

  /// The [BoxShape] of the Shimmer
  final BoxShape shape;

  final double? borderRadius;

  /// {@template flutter.widgets.child}
  /// The widget below this widget 3in the tree.
  /// {@endtemplate}
  final Widget? child;

  const Skeleton({
    super.key,
    this.height = 16 * 1.33,
    this.width = 128.0,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.child,
  });

  /// Creates a circular [Skeleton] with diameter [size].
  factory Skeleton.circular(double size) {
    return Skeleton(
      height: size,
      width: size,
      shape: BoxShape.circle,
    );
  }

  /// Creates a [Skeleton] fitted to a certain [FlumeTextStyle].
  factory Skeleton.fromTextStyle(
    TextStyle style, {
    double? width,
  }) {
    return Skeleton(
      height: (style.height ?? 1.33) * (style.fontSize ?? 16),
      width: width ?? 128.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;

    return Shimmer.fromColors(
      period: const Duration(milliseconds: 2500),
      baseColor: colors.highlight10,
      highlightColor: colors.highlight30,
      child: child ??
          Container(
            decoration: BoxDecoration(
              shape: shape,
              borderRadius: shape == BoxShape.circle
                  ? null
                  : BorderRadius.circular(
                      borderRadius ?? context.theme.shapes.sm,
                    ),
              color: colors.highlight30,
            ),
            height: height,
            width: width,
          ),
    );
  }
}
