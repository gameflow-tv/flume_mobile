import 'package:flume/flume.dart';
import 'package:flume_example/widgets/blueprint.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/top_bar.dart';

class MotionPage extends StatelessWidget {
  const MotionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);
    final motion = theme.motion;

    return Ambiance(
      builder: (context, ambiance) {
        return Scaffold(
          appBar: TopBar(
            title: const Text('Motion'),
          ),
          backgroundColor: ambiance.color,
          body: Blueprint(
            child: Ambiance(
              child: SizedBox.expand(
                child: Padding(
                  padding: EdgeInsets.all(context.theme.spacing.md),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedBox(
                          duration: motion.short,
                          child: const Text('short'),
                        ),
                        AnimatedBox(
                          duration: motion.medium,
                          child: const Text('medium'),
                        ),
                        AnimatedBox(
                          duration: motion.long,
                          child: const Text('long'),
                        ),
                      ].spaced(context.theme.spacing.md),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AnimatedBox extends StatefulWidget {
  const AnimatedBox({super.key, required this.duration, required this.child});

  final Duration duration;
  final Widget child;

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
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: toggleExpand,
          child: Row(
            children: [
              Flexible(
                child: AnimatedContainer(
                  height: 100,
                  width: expand ? constraints.maxWidth : 100,
                  padding: EdgeInsets.all(
                    context.theme.spacing.md,
                  ),
                  decoration: BoxDecoration(
                    color: expand
                        ? context.ambiance.palette.light
                        : context.ambiance.color,
                    borderRadius: BorderRadius.circular(
                      context.theme.shapes.sm,
                    ),
                  ),
                  duration: widget.duration,
                  child: AnimatedDefaultTextStyle(
                    duration: widget.duration,
                    style: TextStyle(
                      color: expand
                          ? context.ambiance.palette.dark
                          : context.ambiance.palette.light,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: widget.child,
                          ),
                        ),
                        Text(
                          '${widget.duration.inMilliseconds}ms',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                'Tap me!',
                overflow: TextOverflow.fade,
                style: context.theme.typography.label3.copyWith(
                  color: context.theme.colors.subtitle.withOpacity(0.4),
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                ),
              ),
            ].spaced(context.theme.spacing.md),
          ),
        );
      },
    );
  }
}
