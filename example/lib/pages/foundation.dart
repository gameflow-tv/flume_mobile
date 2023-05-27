import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/bezier.dart';
import 'package:flume_example/widgets/blueprint.dart';
import 'package:flume_example/widgets/category_card.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/layout.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'foundation/breakpoints.dart';

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
              banner: ShadowsBanner(
                end: context.theme.shadows.xs.color,
                begin: context.theme.shadows.md.color,
              ),
              subtitle: 'Shadow styles for enhanced depth',
            ),
            const CategoryCard(
              title: 'Shapes',
              path: '/foundation/shapes',
              banner: ShapesBanner(),
              subtitle: 'Components come in all shapes and sizes',
            ),
            const CategoryCard(
              title: 'Spacing',
              path: '/foundation/spacing',
              banner: SpacingBanner(),
              subtitle: 'Spacing scale for consistent margins',
            ),
            const CategoryCard(
              title: 'Typography',
              path: '/foundation/typography',
              banner: FoundationBanner(),
              subtitle: 'Typography styles for text',
            ),
          ],
        );
      },
    );
  }
}

class SpacingBanner extends StatelessWidget {
  const SpacingBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: context.theme.spacing.md),
      child: Blueprint(
        child: Ambiance(
          builder: (context, ambiance) {
            return LayoutBuilder(builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  childAnimationBuilder: (widget) {
                    return SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    );
                  },
                  children: context.theme.spacing.toMap().entries.map((entry) {
                    final normalizedWidth =
                        constraints.maxWidth / context.theme.spacing.xxl;

                    return Container(
                      height: context.theme.spacing.sm,
                      width: entry.value * normalizedWidth,
                      decoration: BoxDecoration(
                        color: ambiance.palette.light,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                            context.theme.shapes.xs,
                          ),
                          bottomRight: Radius.circular(
                            context.theme.shapes.xs,
                          ),
                        ),
                      ),
                    );
                  }).spaced(context.theme.spacing.xs),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}

class ShapesBanner extends StatefulWidget {
  const ShapesBanner({
    super.key,
  });

  @override
  State<ShapesBanner> createState() => _ShapesBannerState();
}

class _ShapesBannerState extends State<ShapesBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shape;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _shape = Tween<double>(
      begin: 2,
      end: 50,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCirc,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      builder: (context, ambiance) {
        return Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: ambiance.lighter(),
                  borderRadius: BorderRadius.circular(_shape.value),
                  border: Border.all(
                    color: ambiance.palette.light,
                    width: .5,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class ShadowsBanner extends StatefulWidget {
  const ShadowsBanner({
    super.key,
    required this.begin,
    required this.end,
  });

  final Color begin;
  final Color end;

  @override
  State<ShadowsBanner> createState() => _ShadowsBannerState();
}

class _ShadowsBannerState extends State<ShadowsBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Offset> _shadowPosition;
  late Animation<Color?> _shadowColor;
  late Animation<double> _radius;
  late Animation<Alignment> _gradientAlignment;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _shadowPosition = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(5, 3.5),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _shadowColor = ColorTween(
      begin: widget.begin,
      end: widget.end,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.5,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _radius = Tween<double>(
      begin: 0.0,
      end: 10.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _gradientAlignment = AlignmentTween(
      begin: Alignment.center,
      end: Alignment.topLeft,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      builder: (context, ambiance) {
        return Padding(
          padding: EdgeInsets.all(context.theme.spacing.md),
          child: Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      context.theme.shapes.sm,
                    ),
                    border: Border.all(
                      color: context.theme.colors.highlight10,
                      width: 0.5,
                    ),
                    color: ambiance.lighter(),
                    gradient: LinearGradient(
                      transform: GradientRotation(
                        _controller.value * -0.2,
                      ),
                      colors: [
                        Colors.white.withOpacity(0.6),
                        Colors.white.withOpacity(0.4),
                        Colors.white.withOpacity(0.1),
                      ],
                      begin: _gradientAlignment.value,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: _shadowColor.value ?? Colors.transparent,
                        offset: _shadowPosition.value,
                        blurRadius: _radius.value,
                        spreadRadius: _radius.value,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
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
          children:
              context.theme.colors.toMap().keys.toList().reversed.map((name) {
            final color = context.theme.colors.toMap()[name];

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

class FoundationBanner extends StatelessWidget {
  const FoundationBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.theme.spacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 500),
          childAnimationBuilder: (widget) {
            return SlideAnimation(
              horizontalOffset: 48,
              child: FadeInAnimation(
                child: widget,
              ),
            );
          },
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Divider(
                      color: context.ambiance.palette.light,
                      thickness: 0.5,
                    ),
                  ),
                ),
                const Expanded(
                  child: Text('Montserrat'),
                ),
                const Expanded(
                  child: Text('Mulish'),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        text: 'Typography',
                        style: const TextStyle(
                          fontSize: 8,
                        ),
                        children: [
                          TextSpan(
                            text: ' / Hierarchy',
                            style: TextStyle(
                              color: context.theme.colors.header,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aa',
                        style: context.theme.typography.header1.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
                        style: context.theme.typography.header5.copyWith(
                          fontSize: 8,
                        ),
                      ),
                      Text(
                        'abcdefghijklmnopqrstuvwxyz',
                        style: context.theme.typography.header5.copyWith(
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aa',
                        style: context.theme.typography.body1.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
                        style: context.theme.typography.body1.copyWith(
                          fontSize: 8,
                        ),
                      ),
                      Text(
                        'abcdefghijklmnopqrstuvwxyz',
                        style: context.theme.typography.body1.copyWith(
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 4,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Weights',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Title',
                    style: context.theme.typography.header1.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Lead',
                    style: context.theme.typography.header2.copyWith(
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Paragraph',
                    style: context.theme.typography.body1.copyWith(
                      fontSize: 8,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Button',
                    style: context.theme.typography.button.copyWith(
                      fontSize: 8,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Link',
                    style: context.theme.typography.link.copyWith(
                      fontSize: 6,
                      color: context.ambiance.palette.light,
                    ),
                  ),
                ),
              ].spaced(context.theme.spacing.xs),
            ),
          ].spaced(context.theme.spacing.lg),
        ),
      ),
    );
  }
}
