import 'package:flume/licenses.dart';
import 'package:flume_example/pages/ambiance.dart';
import 'package:flume_example/pages/components.dart';
import 'package:flume_example/pages/components/buttons.dart';
import 'package:flume_example/pages/components/icons.dart';
import 'package:flume_example/pages/components/input.dart';
import 'package:flume_example/pages/components/lists.dart';
import 'package:flume_example/pages/foundation.dart';
import 'package:flume_example/pages/foundation/breakpoints.dart';
import 'package:flume_example/pages/foundation/colors.dart';
import 'package:flume_example/pages/foundation/motion.dart';
import 'package:flume_example/pages/foundation/shadows.dart';
import 'package:flume_example/pages/foundation/shapes.dart';
import 'package:flume_example/pages/foundation/spacing.dart';
import 'package:flume_example/pages/foundation/typography.dart';
import 'package:flume_example/pages/license.dart';
import 'package:flume_example/pages/root.dart';

import 'package:flume/material.dart' hide LicensePage;
import 'package:flume/flume.dart';
import 'package:flutter/foundation.dart';

void main() {
  LicenseRegistry.addLicense(licenses);
  runApp(const FlumeExample());
}

class FlumeExample extends StatelessWidget {
  const FlumeExample({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Flume(
      theme: FlumeTheme.fallback(),
      builder: (context, theme) {
        return MaterialApp(
          title: 'Flume',
          theme: theme,
          routes: {
            '/': (context) => const RootPage(),
            '/ambiance': (context) => const AmbiancePage(),
            '/foundation': (context) => const FoundationPage(),
            '/foundation/breakpoints': (context) => const BreakpointsPage(),
            '/foundation/colors': (context) => const ColorsPage(),
            '/foundation/motion': (context) => const MotionPage(),
            '/foundation/shadows': (context) => const ShadowsPage(),
            '/foundation/shapes': (context) => const ShapesPage(),
            '/foundation/spacing': (context) => const SpacingPage(),
            '/foundation/typography': (context) => const TypographyPage(),
            '/components': (context) => const ComponentsPage(),
            '/components/buttons': (context) => const ButtonsPage(),
            '/components/input': (context) => const InputPage(),
            '/components/lists': (context) => const ListsPage(),
            '/components/icons': (context) => const IconsPage(),
            '/licenses': (context) => const LicensePage(),
          },
          initialRoute: '/',
        );
      },
    );
  }
}
