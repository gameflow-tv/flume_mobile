import 'package:flume/flume.dart';
import 'package:flume_example/widgets/category_card.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LicensePage extends StatelessWidget {
  const LicensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: FutureBuilder(
        future: LicenseRegistry.licenses
            .fold<_LicenseData>(
              _LicenseData(),
              (_LicenseData prev, LicenseEntry license) =>
                  prev..addLicense(license),
            )
            .then(
              (_LicenseData licenseData) => licenseData..sortPackages(),
            ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final _LicenseData licenseData = snapshot.data!;

            return CardGrid(
              children: snapshot.data!.packageLicenseBindings.keys.map((entry) {
                final package = licenseData.packages[licenseData
                    .packageLicenseBindings.keys
                    .toList()
                    .indexOf(entry)];

                final bindings = licenseData.packageLicenseBindings[entry]!;

                return CategoryCard(
                  path: '/licenses/entry',
                  navigationArguments: LicenseEntryArgs(
                    package: package,
                    licenses: bindings
                        .map((index) => licenseData.licenses[index])
                        .toList(),
                  ),
                  title: '$package (${bindings.length} licenses)',
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
                  subtitle: 'View licenses for $package',
                );
              }).toList(),
            );
          } else {
            return CardGrid(
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

class LicenseEntryPage extends StatelessWidget {
  const LicenseEntryPage({
    super.key,
    required this.args,
  });

  final LicenseEntryArgs args;

  @override
  Widget build(BuildContext context) {
    return Layout(
      builder: (context, ambiance) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(context.theme.spacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    FlumeIcons.article_filled,
                    color: ambiance.palette.light,
                  ),
                  Text(
                    args.package,
                    style: context.theme.typography.header3,
                  ),
                ].spaced(context.theme.spacing.xs),
              ),
              ScrollableList.static(
                divided: true,
                spacing: context.theme.spacing.xl,
                children: args.licenses.map(
                  (entry) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.paragraphs.map((p) => p.text).join('\n\n'),
                          style: context.theme.typography.body1,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    );
                  },
                ).toList(),
              ),
            ].spaced(context.theme.spacing.md),
          ),
        );
      },
    );
  }
}

class LicenseEntryArgs {
  LicenseEntryArgs({
    required this.package,
    required this.licenses,
  });

  final String package;
  final List<LicenseEntry> licenses;
}

class _LicenseData {
  final List<LicenseEntry> licenses = <LicenseEntry>[];
  final Map<String, List<int>> packageLicenseBindings = <String, List<int>>{};
  final List<String> packages = <String>[];

  String? firstPackage;

  void addLicense(LicenseEntry entry) {
    for (final String package in entry.packages) {
      _addPackage(package);
      packageLicenseBindings[package]!.add(licenses.length);
    }
    licenses.add(entry); // Completion of the contract above.
  }

  void _addPackage(String package) {
    if (!packageLicenseBindings.containsKey(package)) {
      packageLicenseBindings[package] = <int>[];
      firstPackage ??= package;
      packages.add(package);
    }
  }

  void sortPackages([int Function(String a, String b)? compare]) {
    packages.sort(compare ??
        (String a, String b) {
          if (a == firstPackage) {
            return -1;
          }
          if (b == firstPackage) {
            return 1;
          }
          return a.toLowerCase().compareTo(b.toLowerCase());
        });
  }
}
