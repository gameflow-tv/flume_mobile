import 'package:flume/flume.dart';
import 'package:flutter/material.dart';

extension PrettyShadow on BoxShadow {
  String get pretty =>
      'color: ${color.toRGB().toHex()}, offset: (x: ${offset.dx}, y: ${offset.dy}), blurRadius: $blurRadius';
}

class ShadowsPage extends StatelessWidget {
  const ShadowsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);
    final shadows = theme.shadows;

    return Ambiance(
      builder: (context, ambiance) {
        return Scaffold(
          appBar: TopBar(
            title: const Text('Shadows'),
          ),
          backgroundColor: ambiance.color,
          body: ListView(
            children: [
              Cell(
                title: Text('xs: ${shadows.xs.pretty}'),
              ),
              Cell(
                title: Text('sm: ${shadows.sm.pretty}'),
              ),
              Cell(
                title: Text('md: ${shadows.md.pretty}'),
              ),
              Cell(
                title: Text('lg: ${shadows.lg.pretty}'),
              ),
              Cell(
                title: Text('text: ${shadows.text.pretty}'),
              ),
              Cell(
                title: Text('focus: ${shadows.focus.pretty}'),
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
