import 'package:flume/src/components/spacing/flex.dart';
import 'package:flume/material.dart';
import 'package:flume/flume.dart';

/// {@category Components}
/// {@subCategory Lists}
/// A wrapper around [ListView] with Flume-specific customizations.
class ScrollableList extends StatelessWidget {
  /// A label to display above the list.
  final Widget? title;

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

  /// {@template flutter.rendering.EdgeInsets}
  /// Empty space to inscribe inside. The [child], if any, is placed
  /// inside this padding.
  /// {@endtemplate}
  final EdgeInsets padding;

  /// {@template flutter.rendering.Axis}
  /// The two cardinal directions in two dimensions. The axis is always relative to the current coordinate space.
  /// This means, for example, that a horizontal axis might actually be diagonally from top right to bottom left,
  /// due to some local Transform applied to the scene.
  /// {@endtemplate}
  final Axis scrollDirection;

  /// If true, the children will be divided by a separator.
  final bool divided;

  /// If true, every child will be wrapped in a [SafeArea].
  final bool wrapWithSafeArea;

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
    this.padding = EdgeInsets.zero,
    this.scrollDirection = Axis.vertical,
    this.divided = true,
    this.wrapWithSafeArea = true,
  });

  factory ScrollableList.static({
    required List<Widget> children,
    bool showBorders = false,
    bool addBottomBorder = true,
    Widget? title,
    ScrollController? controller,
    bool adaptive = false,
    int crossAxisCount = 2,
    double gridChildAspectRatio = 1.0,
    EdgeInsets padding = EdgeInsets.zero,
    Axis scrollDirection = Axis.vertical,
    bool divided = true,
    bool wrapWithSafeArea = true,
  }) {
    return ScrollableList(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      showBorders: showBorders,
      addBottomBorder: addBottomBorder,
      title: title,
      controller: controller,
      adaptive: adaptive,
      crossAxisCount: crossAxisCount,
      gridChildAspectRatio: gridChildAspectRatio,
      padding: padding,
      scrollDirection: scrollDirection,
      divided: divided,
      wrapWithSafeArea: wrapWithSafeArea,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: adaptive && context.mediaQuery.size.aspectRatio > 1
          ? buildGridView(context)
          : buildListView(context),
    );
  }

  Widget withWrapper(Widget child) {
    if (wrapWithSafeArea) {
      return SafeArea(
        top: false,
        bottom: false,
        child: child,
      );
    }
    return child;
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
      children: children.map(withWrapper).toList(),
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
                  children: children
                      .divided(
                        1,
                        context.theme.colors.highlight10,
                      )
                      .map(withWrapper)
                      .toList(),
                ),
              );
            } else if (divided) {
              return FlumeColumn(
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
                ].map(withWrapper).toList(),
              );
            } else {
              return FlumeColumn(
                children: children.map(withWrapper).toList(),
              );
            }
          },
        ),
      ],
    );
  }
}
