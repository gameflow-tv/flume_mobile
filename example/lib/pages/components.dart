import 'package:flume/material.dart';
import 'package:flume_example/widgets/category_card.dart';
import 'package:flume_example/widgets/category_grid.dart';
import 'package:flume_example/widgets/layout.dart';

class ComponentsPage extends StatelessWidget {
  const ComponentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      builder: (context, ambiance) {
        return CategoryGrid(
          children: [
            CategoryCard(
              title: 'Buttons',
              path: '/components/buttons',
              banner: Container(),
              subtitle: 'All different variations of buttons',
            ),
            CategoryCard(
              title: 'Input',
              path: '/components/input',
              banner: Container(),
              subtitle: 'User input components for forms',
            ),
            CategoryCard(
              title: 'Controls',
              path: '/components/controls',
              banner: Container(),
              subtitle: 'Controls used to e.g. navigate or select',
            ),
            CategoryCard(
              title: 'Icons',
              path: '/components/icons',
              banner: Container(),
              subtitle: 'All Flume icons',
            ),
            CategoryCard(
              title: 'Layout',
              path: '/components/layout',
              banner: Container(),
              subtitle: 'Layout widgets for building your UI',
            ),
          ],
        );
      },
    );
  }
}
