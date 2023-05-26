import 'package:flume/flume.dart';
import 'package:flume/material.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.symmetric(
        horizontal: context.theme.spacing.md,
        vertical: context.theme.spacing.md,
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        crossAxisSpacing: context.theme.spacing.md,
        mainAxisSpacing: context.theme.spacing.md,
        childAspectRatio: 16 / 10,
      ),
      children: children,
    );
  }
}
