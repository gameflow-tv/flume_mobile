import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/top_bar.dart';

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
          body: ScrollableList(
            padding: EdgeInsets.only(top: context.theme.spacing.xs),
            children: [
              Cell(
                title: const Text('Buttons'),
                onTap: () =>
                    Navigator.pushNamed(context, '/components/buttons'),
              ),
              Cell(
                title: const Text('Input'),
                onTap: () => Navigator.pushNamed(context, '/components/input'),
              ),
              Cell(
                title: const Text('Lists'),
                onTap: () => Navigator.pushNamed(context, '/components/lists'),
              ),
              Cell(
                title: const Text('Icons'),
                onTap: () => Navigator.pushNamed(context, '/components/icons'),
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
