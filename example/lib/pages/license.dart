import 'package:flume/flume.dart';
import 'package:flume_example/widgets/category_card.dart';
import 'package:flume_example/widgets/category_grid.dart';
import 'package:flume_example/widgets/layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LicensePage extends StatelessWidget {
  const LicensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: FutureBuilder(
        future: LicenseRegistry.licenses.toList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CategoryGrid(
              children: snapshot.data!.map((entry) {
                return CategoryCard(
                  title: entry.packages.first,
                  banner: Container(
                    padding: EdgeInsets.all(context.theme.spacing.xs),
                    child: Center(
                      child: Icon(
                        FlumeIcons.article_filled,
                        color: context.ambiance.palette.light,
                        size: 64,
                      ),
                    ),
                  ),
                  subtitle: entry.paragraphs.first.text,
                );
              }).toList(),
            );
          } else {
            return CategoryGrid(
              children: List.generate(
                6,
                (index) => const CategoryCard(
                  title: 'Loading...',
                  banner: Skeleton(),
                  subtitle: 'Loading...',
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
