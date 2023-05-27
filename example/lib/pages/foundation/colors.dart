import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/component_card.dart';
import 'package:flume_example/widgets/layout.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);

    return Layout(
      builder: (context, ambiance) {
        return SafeArea(
          bottom: false,
          child: CardGrid(
            children: theme.colors.toMap().keys.map((name) {
              final color = theme.colors.toMap()[name];

              if (color == null) {
                return Container();
              }

              return ComponentCard(
                title: name,
                subtitle: '#${color.value.toRadixString(16)}',
                banner: Container(
                  color: color,
                ),
                padding: EdgeInsets.zero,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
