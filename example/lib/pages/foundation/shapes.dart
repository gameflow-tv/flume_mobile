import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/component_card.dart';
import 'package:flume_example/widgets/layout.dart';

class ShapesPage extends StatelessWidget {
  const ShapesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);
    final shapes = theme.shapes;

    return Layout(
      builder: (context, ambiance) {
        return CardGrid(
          children: shapes.toMap().entries.map(
            (entry) {
              return ComponentCard(
                title: entry.key,
                banner: Ambiance(
                  builder: (context, ambiance) {
                    return Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: ambiance.color,
                          borderRadius: BorderRadius.circular(
                            entry.value,
                          ),
                          border: Border.all(
                            color: ambiance.palette.light,
                            width: 0.5,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                subtitle: '${entry.value}',
              );
            },
          ).toList(),
        );
      },
    );
  }
}
