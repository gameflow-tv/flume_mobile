import 'package:flume/flume.dart';
import 'package:flume_example/widgets/blueprint.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/component_card.dart';
import 'package:flume_example/widgets/layout.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      builder: (context, ambiance) {
        return Blueprint(
          child: CardGrid(
            children: context.theme.spacing.toMap().entries.map(
              (entry) {
                return ComponentCard(
                  title: entry.key,
                  banner: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) {
                        return const Box();
                      },
                    ).spaced(entry.value),
                  ),
                  subtitle: '${entry.value}px',
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}

class Box extends StatelessWidget {
  const Box({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      color: context.ambiance.lighter(),
    );
  }
}
