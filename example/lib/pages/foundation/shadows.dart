import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/component_card.dart';
import 'package:flume_example/widgets/layout.dart';

extension PrettyShadow on BoxShadow {
  String toPrettyString() =>
      'color: ${color.toRGB().toHex()}, offset: (x: ${offset.dx}, y: ${offset.dy}), blurRadius: $blurRadius';
}

class ShadowsPage extends StatelessWidget {
  const ShadowsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shadows = context.theme.shadows;

    return Layout(
      builder: (context, ambiance) {
        return CardGrid(
          children: shadows.toMap().entries.map((entry) {
            return ComponentCard(
              title: entry.key,
              banner: Ambiance(builder: (context, ambiance) {
                return Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        context.theme.shapes.sm,
                      ),
                      border: Border.all(
                        color: context.theme.colors.highlight10,
                        width: 0.5,
                      ),
                      color: ambiance.color,
                      boxShadow: [entry.value],
                    ),
                  ),
                );
              }),
              subtitle: entry.value.toPrettyString(),
            );
          }).toList(),
        );
      },
    );
  }
}
