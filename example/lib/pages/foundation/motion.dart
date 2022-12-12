import 'package:flume/flume.dart';
import 'package:flutter/material.dart';

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
          body: ListView(
            children: [
              Cell(
                title: Text('short: ${motion.short.inMilliseconds}ms'),
              ),
              Cell(
                title: Text('medium: ${motion.medium.inMilliseconds}ms'),
              ),
              Cell(
                title: Text('long: ${motion.long.inMilliseconds}ms'),
              ),
              Cell(
                title: Text('motion enabled: ${motion.enabled}'),
              ),
            ]
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: theme.spacing.xs,
                      vertical: theme.spacing.xxs,
                    ),
                    child: e,
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
