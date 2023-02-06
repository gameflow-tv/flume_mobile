import 'package:flume/src/components/spacing/flex.dart';
import 'package:flutter/material.dart';
import 'package:flume/flume.dart';

// TODO (@arnemolland): Refactor to a more simplistic API
/// {@category Components}
/// {@subCategory List}
/// A wrapper around [ListView] with Flume-specific customizations.
class ScrollableList extends StatelessWidget {
  /// A label to display above the list.
  final Widget? title;

  /// {@macro flutter.widgets.children}
  final List<Widget> children;

  /// If the [ListView] should be shrink-wrapped and not expand.
  final bool shrinkWrap;

  /// If the [children] should have borders between them.
  final bool showBorders;

  /// If a bottom border should be added to the end of the list.
  final bool addBottomBorder;

  /// If the list should become a grid on wider devices.
  final bool adaptive;

  /// Which [ScrollPhysics] to use for the [ListView].
  final ScrollPhysics? physics;

  /// The optional [ScrollController] to control the [ListView] with.
  final ScrollController? controller;

  /// If adaptive is true, this controls the max amount of children on
  /// the cross axis.
  final int crossAxisCount;

  /// If adaptive is true, this controls the aspect ratio of the grid's children.
  final double gridChildAspectRatio;

  /// [double] to insert between each child.
  final double? spaceBetween;

  /// {@macro flutter.rendering.EdgeInsets}
  final EdgeInsets? padding;

  /// {@macro flutter.rendering.Axis}
  final Axis scrollDirection;

  final bool divided;

  const ScrollableList({
    super.key,
    required this.children,
    this.shrinkWrap = false,
    this.showBorders = false,
    this.physics,
    this.addBottomBorder = true,
    this.title,
    this.controller,
    this.adaptive = false,
    this.crossAxisCount = 2,
    this.gridChildAspectRatio = 1.0,
    this.spaceBetween,
    this.padding,
    this.scrollDirection = Axis.vertical,
    this.divided = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: adaptive && context.mediaQuery.size.aspectRatio > 1
          ? buildGridView(context)
          : buildListView(context),
    );
  }

  Widget buildGridView(BuildContext context) {
    return GridView(
      padding: padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: gridChildAspectRatio,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 8.0,
      ),
      scrollDirection: scrollDirection,
      children: children,
    );
  }

  Widget buildListView(BuildContext context) {
    return ListView(
      controller: controller,
      physics: physics,
      shrinkWrap: shrinkWrap,
      scrollDirection: scrollDirection,
      padding: padding,
      children: [
        if (title != null) ...{
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: context.theme.spacing.xs,
              ),
              child: DefaultTextStyle(
                style: context.theme.typography.label2
                    .copyWith(color: context.theme.colors.subtitle),
                child: title!,
              ),
            ),
          ),
        },
        Builder(
          builder: (context) {
            if (showBorders) {
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color: context.theme.colors.highlight30,
                    ),
                  ),
                ),
                child: FlumeColumn(
                  spaceBetween: spaceBetween,
                  children: children.divided(
                    1,
                    context.theme.colors.highlight10,
                  ),
                ),
              );
            } else if (divided) {
              return FlumeColumn(
                spaceBetween: spaceBetween,
                children: [
                  ...children.divided(
                    1,
                    context.theme.colors.highlight10,
                  ),
                  if (children.isNotEmpty) ...{
                    Divider(
                      thickness: 1,
                      color: context.theme.colors.highlight10,
                    )
                  }
                ],
              );
            } else {
              return FlumeColumn(
                spaceBetween: spaceBetween,
                children: children,
              );
            }
          },
        ),
      ],
    );
  }
}
