import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/component_card.dart';
import 'package:flume_example/widgets/layout.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      builder: (context, ambiance) {
        return CardGrid(
          children: [
            ComponentCard(
              title: 'ScrollableList',
              subtitle: 'Divided',
              banner: ScrollableList.static(
                children: List.generate(
                  3,
                  (index) => Cell(
                    title: Text('Cell $index'),
                  ),
                ),
              ),
            ),
            ComponentCard(
              title: 'ScrollableList',
              subtitle: 'Undivided',
              banner: ScrollableList.static(
                divided: false,
                children: List.generate(
                  3,
                  (index) => Cell(
                    title: Text('Cell $index'),
                  ),
                ),
              ),
            ),
            ComponentCard(
              title: 'Cell',
              banner: PageView(
                controller: PageController(
                  viewportFraction: 1.1,
                ),
                children: const [
                  CellContainer(
                    title: Text('Cell title'),
                  ),
                  CellContainer(
                    title: Text('Cell title'),
                    subtitle: Text('Cell subtitle'),
                  ),
                  CellContainer(
                    leading: AmbianceBox(),
                    title: Text('Cell title'),
                  ),
                  CellContainer(
                    leading: AmbianceBox(),
                    title: Text('Cell title'),
                    trailing: AmbianceBox(),
                  ),
                  CellContainer(
                    leading: AmbianceBox(),
                    title: Text('Cell title'),
                    subtitle: Text('Cell subtitle'),
                  ),
                  CellContainer(
                    leading: AmbianceBox(),
                    title: Text('Cell title'),
                    subtitle: Text('Cell subtitle'),
                    trailing: AmbianceBox(),
                  ),
                  CellContainer(
                    leading: AmbianceBox(size: 48),
                    title: Text('Cell title'),
                    subtitle: Text('Cell subtitle'),
                  ),
                ],
              ),
              subtitle: 'Swipe to see variants',
            ),
          ],
        );
      },
    );
  }
}

class CellContainer extends StatelessWidget {
  const CellContainer({
    super.key,
    this.leading,
    this.subtitle,
    this.trailing,
    required this.title,
  });

  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      builder: (context, ambiance) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(context.theme.spacing.lg),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.theme.spacing.xs,
              ),
              decoration: BoxDecoration(
                color: ambiance.color,
                borderRadius: BorderRadius.circular(
                  context.theme.shapes.md,
                ),
                border: Border.all(
                  color: context.theme.colors.highlight10,
                  width: 0.5,
                ),
              ),
              child: ScrollableList.static(
                divided: false,
                children: [
                  Cell(
                    title: title,
                    subtitle: subtitle,
                    leading: leading,
                    trailing: trailing,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AmbianceBox extends StatelessWidget {
  const AmbianceBox({
    super.key,
    this.size = 24,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      builder: (context, ambiance) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: ambiance.color,
            borderRadius: BorderRadius.circular(
              context.theme.shapes.sm,
            ),
          ),
        );
      },
    );
  }
}
