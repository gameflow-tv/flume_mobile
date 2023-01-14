import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// {@category Spacing}
/// A supercharged [Wrap] with Flume-specific properties.
class FlumeWrap extends StatelessWidget {
  /// {@template flutter.widgets.children}
  /// The widgets below this widget in the tree.
  ///
  /// If this list is going to be mutated, it is usually wise to put a [Key] on
  /// each of the child widgets, so that the framework can match old
  /// configurations to new configurations and maintain the underlying render
  /// objects.
  ///
  /// Also, a [Widget] in Flutter is immutable, so directly modifying the
  /// [children] such as `someMultiChildRenderObjectWidget.children.add(...)` or
  /// as the example code below will result in incorrect behaviors. Whenever the
  /// children list is modified, a new list object should be provided.
  /// {@endtemplate}
  final List<Widget> children;

  /// {@template flutter.rendering.Axis}
  /// The two cardinal directions in two dimensions. The axis is always relative to the current coordinate space.
  /// This means, for example, that a horizontal axis might actually be diagonally from top right to bottom left,
  /// due to some local Transform applied to the scene.
  /// {@endtemplate}
  final Axis direction;

  /// {@template flutter.rendering.WrapAlignment}
  /// How Wrap should align objects. Used both to align children within a run in the main axis as well as to align
  /// the runs themselves in the cross axis.
  /// {@endtemplate}
  final WrapAlignment alignment;

  /// How much space to place between the runs themselves in the cross axis.
  /// For example, if runSpacing is 10.0, the runs will be spaced at least 10.0
  /// logical pixels apart in the cross axis.
  ///
  /// If there is additional free space in the overall Wrap (e.g., because the
  /// wrap has a minimum size that is not filled), the additional free space
  /// will be allocated according to the runAlignment.
  final double runSpacing;

  /// How much space to place between children in a run in the main axis.
  final double spacing;

  /// {@macro flume.spacing.insets}
  final EdgeInsets? padding;

  /// How the runs themselves should be placed in the cross axis.
  final WrapAlignment runAlignment;

  /// How the children within a run should be aligned relative to each other in the cross axis.
  final WrapCrossAlignment crossAxisAlignment;

  /// Determines the order to lay children out horizontally and how to interpret
  /// `start` and `end` in the horizontal direction.
  final TextDirection? textDirection;

  /// Determines the order to lay children out vertically and how to interpret
  /// `start` and `end` in the vertical direction.
  final VerticalDirection verticalDirection;

  const FlumeWrap({
    super.key,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.runSpacing = 0,
    this.spacing = 0,
    this.padding,
    this.runAlignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    Widget result = Wrap(
      direction: direction,
      alignment: alignment,
      spacing: spacing,
      crossAxisAlignment: crossAxisAlignment,
      runAlignment: runAlignment,
      runSpacing: runSpacing,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: children,
    );

    if (padding != null) {
      result = Padding(
        padding: padding!,
        child: result,
      );
    }

    return Provider.value(value: direction, child: result);
  }
}
