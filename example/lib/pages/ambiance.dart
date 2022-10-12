import 'dart:math';

import 'package:flume/flume.dart';
import 'package:flutter/material.dart';

class AmbianceBox extends StatelessWidget {
  final Color? color;
  final Widget child;

  const AmbianceBox({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);

    return Ambiance(
      color: color,
      builder: (context, color, elevation) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(theme.shapes.md),
            color: color,
          ),
          padding: theme.spacing.insets().xl,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'elevation: $elevation\ncolor:$color',
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
      appBar: AppBar(
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
