import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/component_card.dart';
import 'package:flume_example/widgets/layout.dart';

class MotionPage extends StatelessWidget {
  const MotionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final motion = context.theme.motion;

    return Layout(
      builder: (context, ambiance) {
        return Ambiance(
          child: CardGrid(
            children: [
              ComponentCard(
                title: 'short',
                banner: AnimatedBox(
                  duration: motion.short,
                ),
                subtitle: '${motion.short.inMilliseconds}ms',
              ),
              ComponentCard(
                title: 'medium',
                banner: AnimatedBox(
                  duration: motion.medium,
                ),
                subtitle: '${motion.medium.inMilliseconds}ms',
              ),
              ComponentCard(
                title: 'long',
                banner: AnimatedBox(
                  duration: motion.long,
                ),
                subtitle: '${motion.long.inMilliseconds}ms',
              ),
            ],
          ),
        );
      },
    );
  }
}

class AnimatedBox extends StatefulWidget {
  const AnimatedBox({
    super.key,
    required this.duration,
  });

  final Duration duration;

  @override
  State<AnimatedBox> createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox> {
  late bool expand = false;

  void toggleExpand() {
    setState(() {
      expand = !expand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      builder: (context, ambiance) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return GestureDetector(
              onTap: toggleExpand,
              child: Row(
                children: [
                  Flexible(
                    child: AnimatedContainer(
                      curve: Curves.easeInOut,
                      height: 100,
                      width: expand ? constraints.maxWidth : 100,
                      padding: EdgeInsets.all(
                        context.theme.spacing.md,
                      ),
                      decoration: BoxDecoration(
                        color: expand ? ambiance.palette.light : ambiance.color,
                        borderRadius: BorderRadius.circular(
                          context.theme.shapes.sm,
                        ),
                      ),
                      duration: widget.duration,
                      child: Center(
                        child: Text(
                          'Tap me',
                          style: context.theme.typography.label3.copyWith(
                            color: ambiance.palette.dark.withOpacity(0.25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ].spaced(context.theme.spacing.md),
              ),
            );
          },
        );
      },
    );
  }
}
