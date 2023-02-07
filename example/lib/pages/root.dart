import 'package:flume/flume.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      builder: (context, ambiance) {
        final theme = Flume.of(context);
        return Scaffold(
          backgroundColor: ambiance.color,
          appBar: TopBar(
            title: const Text('Flume'),
            automaticallyImplyLeading: false,
          ),
          body: ScrollableList(
            children: [
              Cell(
                title: const Text('Ambiance'),
                onTap: () => Navigator.pushNamed(context, '/ambiance'),
              ),
              Cell(
                title: const Text('Foundation'),
                onTap: () => Navigator.pushNamed(context, '/foundation'),
              ),
              Cell(
                title: const Text('Components'),
                onTap: () => Navigator.pushNamed(context, '/components'),
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
