import 'package:flume/flume.dart';
import 'package:flutter/material.dart';

class FoundationPage extends StatelessWidget {
  const FoundationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);

    return Ambiance(
      builder: (context, ambiance) {
        return Scaffold(
          backgroundColor: ambiance.color,
          appBar: TopBar(
            title: const Text('Foundation'),
          ),
          body: ScrollableList(
            children: [
              Cell(
                title: const Text('Breakpoints'),
                onTap: () =>
                    Navigator.pushNamed(context, '/foundation/breakpoints'),
              ),
              Cell(
                title: const Text('Colors'),
                onTap: () => Navigator.pushNamed(context, '/foundation/colors'),
              ),
              Cell(
                title: const Text('Motion'),
                onTap: () => Navigator.pushNamed(context, '/foundation/motion'),
              ),
              Cell(
                title: const Text('Shadows'),
                onTap: () =>
                    Navigator.pushNamed(context, '/foundation/shadows'),
              ),
              Cell(
                title: const Text('Shapes'),
                onTap: () => Navigator.pushNamed(context, '/foundation/shapes'),
              ),
              Cell(
                title: const Text('Spacing'),
                onTap: () =>
                    Navigator.pushNamed(context, '/foundation/spacing'),
              ),
              Cell(
                title: const Text('Typography'),
                onTap: () =>
                    Navigator.pushNamed(context, '/foundation/typography'),
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
