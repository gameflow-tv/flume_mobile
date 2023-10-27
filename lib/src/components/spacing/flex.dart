import 'package:flume/flume.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

/// {@category Components}
/// {@subCategory Spacing}
/// A supercharged [Flex] widget with Flume-specific properties like padding
/// and children spacing.
class FlumeFlex extends StatelessWidget {
  /// {@macro flutter.rendering.Axis}
  final Axis direction;

  /// {@macro flume.spacing.insets}
  final EdgeInsets? padding;

  /// {@template flume.spacing.spaceBetween}
  /// The [FlumeSpace] to inset between each child of this widget.
  /// {@endtemplate}
  final double? spaceBetween;

  /// {@macro flutter.widgets.children}
  final List<Widget> children;

  /// {@macro flutter.rendering.MainAxisAlignment}
  final MainAxisAlignment mainAxisAlignment;

  /// {@template flutter.rendering.MainAxisSize}
  /// How much space this widget should request along its main axis.
  /// {@endtemplate}
  final MainAxisSize mainAxisSize;

  /// {@template flutter.rendering.CrossAxisAlignment}
  /// How this widget's childrene should be distributed along the cross axis.
  /// {@endtemplate}
  final CrossAxisAlignment crossAxisAlignment;

  /// {@template flutter.rendering.VerticalDirection}
  /// Which direction along the vertical this widget's children should be laid
  /// out in.
  /// {@endtemplate}
  final VerticalDirection verticalDirection;

  /// {@template flutter.rendering.TextDirection}
  /// Which direction this widget's subtree of [Text] widgets should be laid out
  /// in.
  /// {@endtemplate}
  final TextDirection? textDirection;

  /// {@template flutter.rendering.TextBaseLine}
  /// A horizontal line used for aligning text.
  /// {@endtemplate}
  final TextBaseline? textBaseline;

  const FlumeFlex({
    super.key,
    required this.direction,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.padding,
    this.spaceBetween,
    this.children = const <Widget>[],
  }) : assert(crossAxisAlignment != CrossAxisAlignment.baseline ||
            textBaseline != null);

  @override
  Widget build(BuildContext context) {
    Widget result = Flex(
      direction: direction,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      mainAxisAlignment: mainAxisAlignment,
      textBaseline: textBaseline,
      children: spaceBetween != null && spaceBetween != 0
          ? children.spaced(spaceBetween)
          : children,
    );

    if (padding != null) {
      result = Padding(
        padding: padding!,
        child: result,
      );
    }

    return Provider.value(
      value: direction,
      child: result,
    );
  }
}

/// {@category Components}
/// {@subCategory Spacing}
/// A subclass of [FlumeFlex] that lays its children out on the vertical axis.
class FlumeColumn extends FlumeFlex {
  const FlumeColumn({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.padding,
    super.spaceBetween,
    super.children,
  }) : super(
          direction: Axis.vertical,
        );
}

/// {@category Components}
/// {@subCategory Spacing}
/// A subclass of [FlumeFlex] that lays its children out on the horizontal axis.
class FlumeRow extends FlumeFlex {
  const FlumeRow({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.padding,
    super.spaceBetween,
    super.children,
  }) : super(
          direction: Axis.horizontal,
        );
}
