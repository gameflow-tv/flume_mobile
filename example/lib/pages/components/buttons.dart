import 'package:flume/flume.dart';
import 'package:flume_example/widgets/blueprint.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/component_card.dart';
import 'package:flume_example/widgets/layout.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      builder: (context, ambiance) {
        return const Blueprint(
          child: CardGrid(
            children: [
              ButtonCard(
                variant: ButtonVariant.primary,
                size: ButtonSize.medium,
              ),
              ButtonCard(
                variant: ButtonVariant.primary,
                size: ButtonSize.large,
              ),
              ButtonCard(
                variant: ButtonVariant.tonal,
                size: ButtonSize.medium,
              ),
              ButtonCard(
                variant: ButtonVariant.tonal,
                size: ButtonSize.large,
              ),
              ButtonCard(
                variant: ButtonVariant.signal,
                size: ButtonSize.medium,
              ),
              ButtonCard(
                variant: ButtonVariant.signal,
                size: ButtonSize.large,
              ),
              IconButtonCard(
                variant: ButtonVariant.primary,
                size: ButtonSize.medium,
              ),
              IconButtonCard(
                variant: ButtonVariant.primary,
                size: ButtonSize.large,
              ),
              IconButtonCard(
                variant: ButtonVariant.tonal,
                size: ButtonSize.medium,
              ),
              IconButtonCard(
                variant: ButtonVariant.tonal,
                size: ButtonSize.large,
              ),
              IconButtonCard(
                variant: ButtonVariant.signal,
                size: ButtonSize.medium,
              ),
              IconButtonCard(
                variant: ButtonVariant.signal,
                size: ButtonSize.large,
              ),
              ToggleButtonCard(
                variant: ToggleButtonVariant.standard,
                selected: false,
              ),
              ToggleButtonCard(
                variant: ToggleButtonVariant.standard,
                selected: true,
              ),
              ToggleButtonCard(
                variant: ToggleButtonVariant.tonal,
                selected: false,
              ),
              ToggleButtonCard(
                variant: ToggleButtonVariant.tonal,
                selected: true,
              ),
              GhostButtonCard(),
              TabButtonCard(
                selected: true,
              ),
              TabButtonCard(
                selected: false,
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    super.key,
    required this.variant,
    required this.size,
  });

  final ButtonVariant variant;
  final ButtonSize size;

  @override
  Widget build(BuildContext context) {
    final vsplit = variant.name.split('.').last;
    final vlabel = vsplit[0].toUpperCase() + vsplit.substring(1);
    final ssplit = size.name.split('.').last;

    return ComponentCard(
      title: 'Button',
      subtitle: '$vlabel ($ssplit)',
      banner: PageView(
        children: ButtonState.values.map((state) {
          final s = state.name.split('.').last;
          final slabel = s[0].toUpperCase() + s.substring(1);

          return Center(
            child: Button(
              size: size,
              variant: variant,
              icon: const Icon(FlumeIcons.arrow_right),
              state: state,
              child: Text('$slabel state'),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class IconButtonCard extends StatelessWidget {
  const IconButtonCard({
    super.key,
    required this.variant,
    required this.size,
  });

  final ButtonVariant variant;
  final ButtonSize size;

  @override
  Widget build(BuildContext context) {
    final vsplit = variant.name.split('.').last;
    final vlabel = vsplit[0].toUpperCase() + vsplit.substring(1);
    final ssplit = size.name.split('.').last;

    return ComponentCard(
      title: 'IconButton',
      subtitle: '$vlabel ($ssplit)',
      banner: PageView(
        children: ButtonState.values.map((state) {
          return Center(
            child: SymbolButton(
              size: size,
              variant: variant,
              state: state,
              child: const Icon(FlumeIcons.media_play),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ToggleButtonCard extends StatelessWidget {
  const ToggleButtonCard({
    super.key,
    required this.variant,
    required this.selected,
  });

  final ToggleButtonVariant variant;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final vsplit = variant.name.split('.').last;
    final vlabel = vsplit[0].toUpperCase() + vsplit.substring(1);

    return ComponentCard(
      title: 'ToggleButton',
      subtitle: '$vlabel (${selected ? 'selected' : 'unselected'})',
      banner: PageView(
        children: ButtonState.values.map((state) {
          return Center(
            child: ToggleButton(
              selected: selected,
              variant: variant,
              state: state,
              child: const Icon(FlumeIcons.heart),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class GhostButtonCard extends StatelessWidget {
  const GhostButtonCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ComponentCard(
      title: 'GhostButton',
      subtitle: 'Default',
      banner: PageView(
        children: ButtonState.values.map((state) {
          return Center(
            child: Ambiance(
              elevation: context.ambiance.elevation,
              child: GhostButton(
                state: state,
                child: const Icon(
                  FlumeIcons.times,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class TabButtonCard extends StatelessWidget {
  const TabButtonCard({
    super.key,
    required this.selected,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ComponentCard(
      title: 'TabButton',
      subtitle: selected ? 'Selected' : 'Unselected',
      banner: PageView(
        children: ButtonState.values.map((state) {
          return Center(
            child: TabButton(
              selected: selected,
              state: state,
              child: const Icon(
                FlumeIcons.eye,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
