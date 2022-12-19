import 'package:flume/flume.dart';
import 'package:flutter/material.dart';

class ComponentsPage extends StatelessWidget {
  const ComponentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);

    return Ambiance(
      builder: (context, ambiance) {
        return Scaffold(
          backgroundColor: ambiance.color,
          appBar: TopBar(
            title: const Text('Components'),
          ),
          body: ListView(
            children: [
              Cell(
                title: const Text('Buttons'),
                onTap: () =>
                    Navigator.pushNamed(context, '/components/buttons'),
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
