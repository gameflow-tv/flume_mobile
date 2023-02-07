import 'package:flume/flume.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart' as shimmer;

/// {@category Components}
/// A shimmer/skeleton placeholder component from the Flume design system.
class Shimmer extends StatelessWidget {
  /// Shimmer height.
  final double height;

  /// Shimmer width.
  final double width;

  /// The [BoxShape] of the Shimmer
  final BoxShape shape;

  /// {@template flutter.widgets.child}
  /// The widget below this widget in the tree.
  /// {@endtemplate}
  final Widget? child;

  const Shimmer({
    super.key,
    this.height = 16 * 1.33,
    this.width = 128.0,
    this.shape = BoxShape.rectangle,
    this.child,
  });

  /// Creates a circular [Shimmer] with diameter [size].
  factory Shimmer.circular(double size) {
    return Shimmer(
      height: size,
      width: size,
      shape: BoxShape.circle,
    );
  }

  /// Creates a [Shimmer] fitted to a certain [FlumeTextStyle].
  factory Shimmer.fromTextStyle(
    BuildContext context,
    FlumeTypographyData style, {
    double? width,
  }) {
    return Shimmer(
      height: style.lineHeight * style.fontSize,
      width: width ?? 128.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;

    return shimmer.Shimmer.fromColors(
      period: const Duration(milliseconds: 2500),
      baseColor: colors.highlight10,
      highlightColor: colors.highlight30,
      child: child ??
          Container(
            decoration: BoxDecoration(
              shape: shape,
              borderRadius:
                  shape == BoxShape.circle ? null : BorderRadius.circular(2.0),
              color: colors.highlight30,
            ),
            height: height,
            width: width,
          ),
    );
  }
}
