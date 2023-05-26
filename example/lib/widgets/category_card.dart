import 'package:flume/flume.dart';
import 'package:flume/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.banner,
    required this.subtitle,
    this.path,
  });

  final String title;
  final String subtitle;
  final String? path;
  final Widget banner;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (path != null) {
          Navigator.of(context).pushNamed(path!);
        }
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: context.ambiance.color,
          borderRadius: BorderRadius.circular(context.theme.shapes.md),
          boxShadow: [context.theme.shadows.md],
          border: Border.all(
            color: context.theme.colors.highlight10,
            width: 0.5,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(context.theme.shapes.md),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: context.ambiance.lighter(),
                      child: banner,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 0.1,
              color: context.theme.colors.highlight10,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.theme.spacing.md,
                  vertical: context.theme.spacing.md,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.theme.typography.header4.copyWith(
                        color: context.theme.colors.header,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: context.theme.typography.body2.copyWith(
                        color: context.theme.colors.subtitle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
