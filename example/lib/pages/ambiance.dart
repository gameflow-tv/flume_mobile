import 'dart:math';

import 'package:flume/flume.dart';
import 'package:flume/material.dart';

class AmbianceBox extends StatelessWidget {
  final Color? color;
  final Widget child;

  const AmbianceBox({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);

    return Ambiance(
      color: color,
      builder: (context, ambiance) {
        final color = ambiance.color;
        final elevation = ambiance.elevation;

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(theme.shapes.md),
            color: ambiance.color,
          ),
          padding: theme.spacing.insets.md,
          child: Column(
            children: [
              Padding(
                padding: theme.spacing.insets.sm,
                child: Text(
                  'elevation: $elevation\ncolor: #${color.toString().substring(10, 16)}',
                  style: elevation == 4
                      ? TextStyle(color: theme.colors.secondary)
                      : TextStyle(color: theme.colors.body),
                ),
              ),
              Expanded(child: child),
            ],
          ),
        );
      },
    );
  }
}

class AmbiancePage extends StatefulWidget {
  const AmbiancePage({super.key});

  @override
  State<AmbiancePage> createState() => _AmbiancePageState();
}

class _AmbiancePageState extends State<AmbiancePage> {
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: const Text('Ambiance'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              // Set a random color
              color =
                  Colors.primaries[Random().nextInt(Colors.primaries.length)];
            });
          },
          child: AmbianceBox(
            color: color,
            child: AmbianceBox(
              child: AmbianceBox(
                child: AmbianceBox(
                  child: AmbianceBox(
                    child: Container(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
