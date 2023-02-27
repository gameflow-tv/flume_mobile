import 'package:flume/flume.dart';
import 'package:flume_example/widgets/blueprint.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/top_bar.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      builder: (context, ambiance) {
        return Scaffold(
          backgroundColor: ambiance.color,
          appBar: TopBar(
            title: const Text('Spacing'),
          ),
          body: Blueprint(
            child: SafeArea(
              bottom: false,
              child: GridView(
                padding: EdgeInsets.all(context.theme.spacing.md),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: context.theme.spacing.md,
                  crossAxisSpacing: context.theme.spacing.md,
                ),
                children: [
                  _SpacingContainer(
                    spacing: context.theme.spacing.xxxs,
                    child: const Text('xxxs'),
                  ),
                  _SpacingContainer(
                    spacing: context.theme.spacing.xxs,
                    child: const Text('xxs'),
                  ),
                  _SpacingContainer(
                    spacing: context.theme.spacing.xs,
                    child: const Text('xs'),
                  ),
                  _SpacingContainer(
                    spacing: context.theme.spacing.sm,
                    child: const Text('sm'),
                  ),
                  _SpacingContainer(
                    spacing: context.theme.spacing.md,
                    child: const Text('md'),
                  ),
                  _SpacingContainer(
                    spacing: context.theme.spacing.lg,
                    child: const Text('lg'),
                  ),
                  _SpacingContainer(
                    spacing: context.theme.spacing.xl,
                    child: const Text('xl'),
                  ),
                  _SpacingContainer(
                    spacing: context.theme.spacing.xxl,
                    child: const Text('xxl'),
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

class _SpacingContainer extends StatelessWidget {
  const _SpacingContainer({
    required this.child,
    required this.spacing,
  });

  final Widget child;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      builder: (context, ambiance) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(
            context.theme.shapes.sm,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: ambiance.color,
              borderRadius: BorderRadius.circular(
                context.theme.shapes.sm,
              ),
            ),
            child: Blueprint(
              spacing: spacing,
              lineColor: context.ambiance.palette.light.withOpacity(0.2),
              child: Padding(
                padding: EdgeInsets.all(
                  context.theme.spacing.md,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: child,
                      ),
                    ),
                    Text('${spacing}px'),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
