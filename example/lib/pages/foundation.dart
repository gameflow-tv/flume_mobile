import 'package:flume/material.dart';
import 'package:flume_example/widgets/category_card.dart';
import 'package:flume_example/widgets/category_grid.dart';
import 'package:flume_example/widgets/layout.dart';

class FoundationPage extends StatelessWidget {
  const FoundationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      builder: (context, ambiance) {
        return CategoryGrid(
          children: [
            CategoryCard(
              title: 'Breakpoints',
              path: '/foundation/breakpoints',
              banner: Container(),
              subtitle: 'Breakpoints for responsive design',
            ),
            CategoryCard(
              title: 'Colors',
              path: '/foundation/colors',
              banner: Container(),
              subtitle: 'Base colors used in Flume',
            ),
            CategoryCard(
              title: 'Motion',
              path: '/foundation/motion',
              banner: Container(),
              subtitle: 'Animation timings and curves',
            ),
            CategoryCard(
              title: 'Shadows',
              path: '/foundation/shadows',
              banner: Container(),
              subtitle: 'Shadow styles for enhanced depth',
            ),
            CategoryCard(
              title: 'Shapes',
              path: '/foundation/shapes',
              banner: Container(),
              subtitle: 'Components come in all shapes and sizes',
            ),
            CategoryCard(
              title: 'Spacing',
              path: '/foundation/spacing',
              banner: Container(),
              subtitle: 'Spacing scale for consistent margins',
            ),
            CategoryCard(
              title: 'Typography',
              path: '/foundation/typography',
              banner: Container(),
              subtitle: 'Typography styles for text',
            ),
          ],
        );
      },
    );
  }
}
