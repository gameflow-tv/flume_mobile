import 'package:flume/flume.dart';
import 'package:flume_example/widgets/blueprint.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/top_bar.dart';

class ListsPage extends StatelessWidget {
  const ListsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      builder: (context, ambiance) {
        return Scaffold(
          backgroundColor: ambiance.color,
          appBar: TopBar(
            title: const Text('Lists'),
          ),
          body: Blueprint(
            child: ScrollableList(
              spacing: context.theme.spacing.md,
              divided: false,
              padding: EdgeInsets.all(context.theme.spacing.md),
              children: [
                ScrollableList.static(
                  title: const Text('ScrollableList w/ dividers'),
                  children: List.generate(
                    5,
                    (index) => Cell(
                      title: Text('Cell $index'),
                    ),
                  ),
                ),
                ScrollableList.static(
                  divided: false,
                  title: const Text('ScrollableList w/o dividers'),
                  children: List.generate(
                    5,
                    (index) => Cell(
                      title: Text('Cell $index'),
                    ),
                  ),
                ),
                ScrollableList.static(
                  title: const Text('Cell'),
                  children: const [
                    Cell(
                      title: Text('Cell title'),
                    ),
                    Cell(
                      title: Text('Cell title'),
                      subtitle: Text('Cell subtitle'),
                    ),
                    Cell(
                      leading: AmbianceBox(),
                      title: Text('Cell title'),
                    ),
                    Cell(
                      leading: AmbianceBox(),
                      title: Text('Cell title'),
                      trailing: AmbianceBox(),
                    ),
                    Cell(
                      leading: AmbianceBox(),
                      title: Text('Cell title'),
                      subtitle: Text('Cell subtitle'),
                    ),
                    Cell(
                      leading: AmbianceBox(),
                      title: Text('Cell title'),
                      subtitle: Text('Cell subtitle'),
                      trailing: AmbianceBox(),
                    ),
                    Cell(
                      leading: AmbianceBox(size: 48),
                      title: Text('Cell title'),
                      subtitle: Text('Cell subtitle'),
                    ),
                  ],
                ),
              ],
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
