import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/component_card.dart';
import 'package:flume_example/widgets/layout.dart';
import 'package:flume_example/widgets/tier.dart';

class ControlsPage extends StatelessWidget {
  const ControlsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Layout(
      builder: (context, ambiance) {
        return const CardGrid(
          children: [
            ComponentCard(
              title: 'TabButton',
              subtitle: 'Stepper',
              banner: StepperTabs(),
            ),
          ],
        );
      },
    );
  }
}

class StepperTabs extends StatefulWidget {
  const StepperTabs({
    super.key,
  });

  @override
  State<StepperTabs> createState() => _StepperTabsState();
}

class _StepperTabsState extends State<StepperTabs> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TabButton(
          selected: _index >= 1,
          child: const Tier(stars: 1),
          onChanged: (value) => setState(() => _index = value ? 1 : 1),
        ),
        TabButton(
          selected: _index >= 2,
          child: const Tier(stars: 2),
          onChanged: (value) => setState(() => _index = value ? 2 : 1),
        ),
        TabButton(
          selected: _index >= 3,
          child: const Tier(stars: 3),
          onChanged: (value) => setState(() => _index = value ? 3 : 1),
        ),
      ].spaced(context.theme.spacing.xs),
    );
  }
}
