import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/blueprint.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/component_card.dart';
import 'package:flume_example/widgets/layout.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class BreakpointsPage extends StatelessWidget {
  const BreakpointsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      builder: (context, ambiance) {
        return CardGrid(
          children: [
            BreakpointBanner(
              breakpoint: context.theme.breakpoints.xs,
              name: 'xs',
            ),
            BreakpointBanner(
              breakpoint: context.theme.breakpoints.sm,
              name: 'sm',
            ),
            BreakpointBanner(
              breakpoint: context.theme.breakpoints.md,
              name: 'md',
            ),
            BreakpointBanner(
              breakpoint: context.theme.breakpoints.lg,
              name: 'lg',
            ),
            BreakpointBanner(
              breakpoint: context.theme.breakpoints.xl,
              name: 'xl',
            ),
            BreakpointBanner(
              breakpoint: context.theme.breakpoints.xxl,
              name: 'xxl',
            ),
          ],
        );
      },
    );
  }
}

class BreakpointBanner extends StatelessWidget {
  const BreakpointBanner({
    super.key,
    required this.breakpoint,
    required this.name,
  });

  final double breakpoint;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ComponentCard(
      padding: EdgeInsets.zero,
      title: name,
      subtitle: '${breakpoint}px',
      banner: Blueprint(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Max breakpoint normalized to the width to 1
            final normalizedWidth =
                constraints.maxWidth / context.theme.breakpoints.xxl;

            // Calculate the width of each breakpoint
            final width = normalizedWidth * breakpoint;

            // Map the breakpoint from (context.theme.breakpoints.xs, context.theme.breakpoints.xxl) to (0.25, 1.0)
            final normalizedBreakpoint =
                (breakpoint) / (context.theme.breakpoints.xxl);

            // Calculate the height
            final height = normalizedBreakpoint * constraints.maxHeight;

            return DefaultTextStyle(
              style: context.theme.typography.label1.copyWith(
                color: context.ambiance.palette.light,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Ambiance(
                  child: AnimationConfiguration.synchronized(
                    duration: const Duration(milliseconds: 500),
                    child: BreakpointContainer(
                      width: width,
                      height: height,
                      child: Text(name),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
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
