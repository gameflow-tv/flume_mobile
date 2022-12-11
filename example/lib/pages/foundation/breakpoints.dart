import 'package:flume/flume.dart';
import 'package:flutter/material.dart';

class BreakpointsPage extends StatelessWidget {
  const BreakpointsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);
    final breakpoints = theme.breakpoints;

    return Ambiance(
      builder: (context, ambiance) {
        return Scaffold(
          appBar: TopBar(
            title: const Text('Breakpoints'),
          ),
          backgroundColor: ambiance.color,
          body: ListView(
            children: [
              Cell(
                title: Text('xxl:  >=${breakpoints.xxl}'),
              ),
              Cell(
                title: Text('xl: >=${breakpoints.xl}'),
              ),
              Cell(
                title: Text('lg: >=${breakpoints.lg}'),
              ),
              Cell(
                title: Text('md: >=${breakpoints.md}'),
              ),
              Cell(
                title: Text('sm: >=${breakpoints.sm}'),
              ),
              Cell(
                title: Text('xs: >=${breakpoints.xs}'),
              ),
              const Cell(
                title: Text('default: >=0'),
              )
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
