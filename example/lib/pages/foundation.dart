import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/bezier.dart';
import 'package:flume_example/widgets/blueprint.dart';
import 'package:flume_example/widgets/category_card.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/layout.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class FoundationPage extends StatelessWidget {
  const FoundationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      builder: (context, ambiance) {
        return CardGrid(
          children: [
            const CategoryCard(
              title: 'Breakpoints',
              path: '/foundation/breakpoints',
              banner: BreakpointsBanner(),
              subtitle: 'Breakpoints for responsive design',
            ),
            const CategoryCard(
              title: 'Colors',
              path: '/foundation/colors',
              banner: ColorsBanner(),
              subtitle: 'Base colors used in Flume',
            ),
            const CategoryCard(
              title: 'Motion',
              path: '/foundation/motion',
              banner: MotionBanner(),
              subtitle: 'Animation timings and curves',
            ),
            CategoryCard(
              title: 'Shadows',
              path: '/foundation/shadows',
              banner: Container(),
              subtitle: 'Shadow styles for enhanced depth',
            ),
            CategoryCard(
              title: 'Shapes',
              path: '/foundation/shapes',
              banner: Container(),
              subtitle: 'Components come in all shapes and sizes',
            ),
            CategoryCard(
              title: 'Spacing',
              path: '/foundation/spacing',
              banner: Container(),
              subtitle: 'Spacing scale for consistent margins',
            ),
            CategoryCard(
              title: 'Typography',
              path: '/foundation/typography',
              banner: Container(),
              subtitle: 'Typography styles for text',
            ),
          ],
        );
      },
    );
  }
}

class MotionBanner extends StatelessWidget {
  const MotionBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Blueprint(
      child: Ambiance(
        child: BezierCurveAnimation(),
      ),
    );
  }
}

class BreakpointsBanner extends StatelessWidget {
  const BreakpointsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // Max breakpoint is 1440, normalize the width to 1
        final normalizedWidth = width / 1440;

        // Calculate the width of each breakpoint
        final xsWidth = normalizedWidth * context.theme.breakpoints.xs;
        final smWidth = normalizedWidth * context.theme.breakpoints.sm;
        final mdWidth = normalizedWidth * context.theme.breakpoints.md;
        final lgWidth = normalizedWidth * context.theme.breakpoints.lg;
        final xlWidth = normalizedWidth * context.theme.breakpoints.xl;
        final xxlWidth = normalizedWidth * context.theme.breakpoints.xxl;

        final xsHeight = 0.25 * constraints.maxHeight;
        final smHeight = 0.4 * constraints.maxHeight;
        final mdHeight = 0.55 * constraints.maxHeight;
        final lgHeight = 0.7 * constraints.maxHeight;
        final xlHeight = 0.85 * constraints.maxHeight;
        final xxlHeight = 1.0 * constraints.maxHeight;

        return DefaultTextStyle(
          style: context.theme.typography.label1.copyWith(
            color: context.ambiance.palette.light.withOpacity(
              0.5,
            ),
          ),
          child: Ambiance(
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 500),
                childAnimationBuilder: (widget) {
                  return SlideAnimation(
                    verticalOffset: 60,
                    horizontalOffset: -50,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  );
                },
                children: [
                  BreakpointContainer(
                    width: xxlWidth,
                    height: xxlHeight,
                    child: const Text('xxl'),
                  ),
                  BreakpointContainer(
                    width: xlWidth,
                    height: xlHeight,
                    child: const Text('xl'),
                  ),
                  BreakpointContainer(
                    width: lgWidth,
                    height: lgHeight,
                    child: const Text('lg'),
                  ),
                  BreakpointContainer(
                    width: mdWidth,
                    height: mdHeight,
                    child: const Text('md'),
                  ),
                  BreakpointContainer(
                    width: smWidth,
                    height: smHeight,
                    child: const Text('sm'),
                  ),
                  BreakpointContainer(
                    width: xsWidth,
                    height: xsHeight,
                    child: const Text('xs'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class BreakpointContainer extends StatelessWidget {
  const BreakpointContainer({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(
        context.theme.spacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.ambiance.lighter().withOpacity(0.5),
        boxShadow: [context.theme.shadows.md],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            context.theme.shapes.md,
          ),
          topRight: Radius.circular(
            context.theme.shapes.md,
          ),
        ),
        border: Border.all(
          color: context.theme.colors.highlight10,
          width: 0.5,
        ),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: child,
      ),
    );
  }
}

class ColorsBanner extends StatelessWidget {
  const ColorsBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 2,
      child: Transform.rotate(
        angle: 0.45,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 64,
            mainAxisExtent: 64,
          ),
          children: context.theme.colors.all.keys.toList().reversed.map((name) {
            final color = context.theme.colors.all[name];

            if (color == null) {
              return Container();
            }

            return Container(
              color: color,
            );
          }).toList(),
        ),
      ),
    );
  }
}
