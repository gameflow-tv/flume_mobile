import 'package:flume/flume.dart';
import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);

    return Ambiance(
      builder: (_, ambiance) {
        return Scaffold(
          appBar: TopBar(
            title: const Text('Buttons'),
          ),
          backgroundColor: ambiance.color,
          body: DefaultTextStyle(
            style: theme.typography.header2.toTextStyle(),
            child: ListView(
              children: [
                // Primary medium
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: theme.spacing.xs),
                  child: Text(
                    'Button',
                    style: theme.typography.header1.toTextStyle(),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                      ),
                      child: const Text('Primary medium'),
                    ),
                    Wrap(
                      children: const [
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.primary,
                          icon: Icon(FlumeIcons.arrow_right),
                          child: Text('Medium'),
                        ),
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.primary,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.hover,
                          child: Text('Medium'),
                        ),
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.primary,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.pressed,
                          child: Text('Medium'),
                        ),
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.primary,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.focus,
                          child: Text('Medium'),
                        ),
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.primary,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.disabled,
                          child: Text('Medium'),
                        ),
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.primary,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.loading,
                          child: Text('Medium'),
                        ),
                      ]
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.all(theme.spacing.xs),
                              child: e,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                // Primary large

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                      ),
                      child: const Text('Primary large'),
                    ),
                    Wrap(
                      children: const [
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.primary,
                          icon: Icon(FlumeIcons.arrow_right),
                          child: Text('Large'),
                        ),
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.primary,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.hover,
                          child: Text('Large'),
                        ),
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.primary,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.pressed,
                          child: Text('Large'),
                        ),
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.primary,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.focus,
                          child: Text('Large'),
                        ),
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.primary,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.disabled,
                          child: Text('Large'),
                        ),
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.primary,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.loading,
                          child: Text('Large'),
                        ),
                      ]
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.all(theme.spacing.xs),
                              child: e,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                      ),
                      child: const Text('Tonal medium'),
                    ),
                    Wrap(
                      children: const [
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.tonal,
                          icon: Icon(FlumeIcons.arrow_right),
                          child: Text('Medium'),
                        ),
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.tonal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.hover,
                          child: Text('Medium'),
                        ),
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.tonal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.pressed,
                          child: Text('Medium'),
                        ),
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.tonal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.focus,
                          child: Text('Medium'),
                        ),
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.tonal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.disabled,
                          child: Text('Medium'),
                        ),
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.tonal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.loading,
                          child: Text('Medium'),
                        ),
                      ]
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.all(theme.spacing.xs),
                              child: e,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                // Tonal large

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                      ),
                      child: const Text('Tonal large'),
                    ),
                    Wrap(
                      children: const [
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.tonal,
                          icon: Icon(FlumeIcons.arrow_right),
                          child: Text('Large'),
                        ),
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.tonal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.hover,
                          child: Text('Large'),
                        ),
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.tonal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.pressed,
                          child: Text('Large'),
                        ),
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.tonal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.focus,
                          child: Text('Large'),
                        ),
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.tonal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.disabled,
                          child: Text('Large'),
                        ),
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.tonal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.loading,
                          child: Text('Large'),
                        ),
                      ]
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.all(theme.spacing.xs),
                              child: e,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                // Signal medium

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                      ),
                      child: const Text('Signal medium'),
                    ),
                    Wrap(
                      children: const [
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.signal,
                          icon: Icon(FlumeIcons.arrow_right),
                          child: Text('Medium'),
                        ),
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.signal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.hover,
                          child: Text('Medium'),
                        ),
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.signal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.pressed,
                          child: Text('Medium'),
                        ),
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.signal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.focus,
                          child: Text('Medium'),
                        ),
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.signal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.disabled,
                          child: Text('Medium'),
                        ),
                        Button(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.signal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.loading,
                          child: Text('Medium'),
                        ),
                      ]
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.all(theme.spacing.xs),
                              child: e,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                // Signal large

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                      ),
                      child: const Text('Signal large'),
                    ),
                    Wrap(
                      children: const [
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.signal,
                          icon: Icon(FlumeIcons.arrow_right),
                          child: Text('Large'),
                        ),
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.signal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.hover,
                          child: Text('Large'),
                        ),
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.signal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.pressed,
                          child: Text('Large'),
                        ),
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.signal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.focus,
                          child: Text('Large'),
                        ),
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.signal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.disabled,
                          child: Text('Large'),
                        ),
                        Button(
                          size: ButtonSize.large,
                          variant: ButtonVariant.signal,
                          icon: Icon(FlumeIcons.arrow_right),
                          state: ButtonState.loading,
                          child: Text('Large'),
                        ),
                      ]
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.all(theme.spacing.xs),
                              child: e,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: theme.spacing.xs,
                  ),
                  child: Text(
                    'IconButton',
                    style: theme.typography.header1.toTextStyle(),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                      ),
                      child: const Text('Primary medium'),
                    ),
                    Wrap(
                      children: [
                        const SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.primary,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        const SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.primary,
                          state: ButtonState.hover,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        const SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.primary,
                          state: ButtonState.pressed,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        const SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.primary,
                          state: ButtonState.focus,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        const SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.primary,
                          state: ButtonState.disabled,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        const SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.primary,
                          state: ButtonState.loading,
                          child: Icon(
                            FlumeIcons.info,
                          ),
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
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                      ),
                      child: const Text('Primary large'),
                    ),
                    Wrap(
                      children: [
                        const SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.primary,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        const SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.primary,
                          state: ButtonState.hover,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        const SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.primary,
                          state: ButtonState.pressed,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        const SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.primary,
                          state: ButtonState.focus,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        const SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.primary,
                          state: ButtonState.disabled,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        const SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.primary,
                          state: ButtonState.loading,
                          child: Icon(
                            FlumeIcons.info,
                          ),
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
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                      ),
                      child: const Text('Tonal medium'),
                    ),
                    Wrap(
                      children: const [
                        SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.tonal,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.tonal,
                          state: ButtonState.hover,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.tonal,
                          state: ButtonState.pressed,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.tonal,
                          state: ButtonState.focus,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.tonal,
                          state: ButtonState.disabled,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.tonal,
                          state: ButtonState.loading,
                          child: Icon(
                            FlumeIcons.info,
                          ),
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
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                      ),
                      child: const Text('Tonal large'),
                    ),
                    Wrap(
                      children: const [
                        SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.tonal,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.tonal,
                          state: ButtonState.hover,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.tonal,
                          state: ButtonState.pressed,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.tonal,
                          state: ButtonState.focus,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.tonal,
                          state: ButtonState.disabled,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.tonal,
                          state: ButtonState.loading,
                          child: Icon(
                            FlumeIcons.info,
                          ),
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
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                      ),
                      child: const Text('Signal medium'),
                    ),
                    Wrap(
                      children: const [
                        SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.signal,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.signal,
                          state: ButtonState.hover,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.signal,
                          state: ButtonState.pressed,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.signal,
                          state: ButtonState.focus,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.signal,
                          state: ButtonState.disabled,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.signal,
                          state: ButtonState.loading,
                          child: Icon(
                            FlumeIcons.info,
                          ),
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
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                      ),
                      child: const Text('Signal large'),
                    ),
                    Wrap(
                      children: const [
                        SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.signal,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.signal,
                          state: ButtonState.hover,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.signal,
                          state: ButtonState.pressed,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.signal,
                          state: ButtonState.focus,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.signal,
                          state: ButtonState.disabled,
                          child: Icon(
                            FlumeIcons.info,
                          ),
                        ),
                        SymbolButton(
                          size: ButtonSize.large,
                          variant: ButtonVariant.signal,
                          state: ButtonState.loading,
                          child: Icon(
                            FlumeIcons.info,
                          ),
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
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: theme.spacing.xs,
                  ),
                  child: Text(
                    'ToggleButton',
                    style: theme.typography.header1.toTextStyle(),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                      ),
                      child: const Text('Standard unselected'),
                    ),
                    Wrap(
                      children: const [
                        ToggleButton(
                          variant: ToggleButtonVariant.standard,
                          selected: false,
                          state: ButtonState.normal,
                          child: Icon(FlumeIcons.heart),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.standard,
                          selected: false,
                          state: ButtonState.hover,
                          child: Icon(FlumeIcons.heart),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.standard,
                          selected: false,
                          state: ButtonState.pressed,
                          child: Icon(FlumeIcons.heart),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.standard,
                          selected: false,
                          state: ButtonState.focus,
                          child: Icon(FlumeIcons.heart),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.standard,
                          selected: false,
                          state: ButtonState.disabled,
                          child: Icon(FlumeIcons.heart),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.standard,
                          selected: false,
                          state: ButtonState.loading,
                          child: Icon(FlumeIcons.heart),
                        ),
                      ]
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.all(
                                theme.spacing.xxs,
                              ),
                              child: e,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                      ),
                      child: const Text('Standard selected'),
                    ),
                    Wrap(
                      children: const [
                        ToggleButton(
                          variant: ToggleButtonVariant.standard,
                          selected: true,
                          state: ButtonState.normal,
                          child: Icon(FlumeIcons.heart_filled),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.standard,
                          selected: true,
                          state: ButtonState.hover,
                          child: Icon(FlumeIcons.heart_filled),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.standard,
                          selected: true,
                          state: ButtonState.pressed,
                          child: Icon(FlumeIcons.heart_filled),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.standard,
                          selected: true,
                          state: ButtonState.focus,
                          child: Icon(FlumeIcons.heart_filled),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.standard,
                          selected: true,
                          state: ButtonState.disabled,
                          child: Icon(FlumeIcons.heart_filled),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.standard,
                          selected: true,
                          state: ButtonState.loading,
                          child: Icon(FlumeIcons.heart_filled),
                        ),
                      ]
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.all(
                                theme.spacing.xxs,
                              ),
                              child: e,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                      ),
                      child: const Text('Tonal unselected'),
                    ),
                    Wrap(
                      children: const [
                        ToggleButton(
                          variant: ToggleButtonVariant.tonal,
                          selected: false,
                          state: ButtonState.normal,
                          child: Icon(FlumeIcons.heart),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.tonal,
                          selected: false,
                          state: ButtonState.hover,
                          child: Icon(FlumeIcons.heart),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.tonal,
                          selected: false,
                          state: ButtonState.pressed,
                          child: Icon(FlumeIcons.heart),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.tonal,
                          selected: false,
                          state: ButtonState.focus,
                          child: Icon(FlumeIcons.heart),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.tonal,
                          selected: false,
                          state: ButtonState.disabled,
                          child: Icon(FlumeIcons.heart),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.tonal,
                          selected: false,
                          state: ButtonState.loading,
                          child: Icon(FlumeIcons.heart),
                        ),
                      ]
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.all(
                                theme.spacing.xxs,
                              ),
                              child: e,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                      ),
                      child: const Text('Tonal selected'),
                    ),
                    Wrap(
                      children: const [
                        ToggleButton(
                          variant: ToggleButtonVariant.tonal,
                          selected: true,
                          state: ButtonState.normal,
                          child: Icon(FlumeIcons.heart_filled),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.tonal,
                          selected: true,
                          state: ButtonState.hover,
                          child: Icon(FlumeIcons.heart_filled),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.tonal,
                          selected: true,
                          state: ButtonState.pressed,
                          child: Icon(FlumeIcons.heart_filled),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.tonal,
                          selected: true,
                          state: ButtonState.focus,
                          child: Icon(FlumeIcons.heart_filled),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.tonal,
                          selected: true,
                          state: ButtonState.disabled,
                          child: Icon(FlumeIcons.heart_filled),
                        ),
                        ToggleButton(
                          variant: ToggleButtonVariant.tonal,
                          selected: true,
                          state: ButtonState.loading,
                          child: Icon(FlumeIcons.heart_filled),
                        ),
                      ]
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.all(
                                theme.spacing.xxs,
                              ),
                              child: e,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: theme.spacing.xs,
                  ),
                  child: Text(
                    'GhostButton',
                    style: theme.typography.header1.toTextStyle(),
                  ),
                ),
                // Ghost buttons
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: const [
                        GhostButton(
                          state: ButtonState.normal,
                          child: Icon(FlumeIcons.times),
                        ),
                        GhostButton(
                          state: ButtonState.hover,
                          child: Icon(FlumeIcons.times),
                        ),
                        GhostButton(
                          state: ButtonState.pressed,
                          child: Icon(FlumeIcons.times),
                        ),
                        GhostButton(
                          state: ButtonState.focus,
                          child: Icon(FlumeIcons.times),
                        ),
                        GhostButton(
                          state: ButtonState.disabled,
                          child: Icon(FlumeIcons.times),
                        ),
                        GhostButton(
                          state: ButtonState.loading,
                          child: Icon(FlumeIcons.times),
                        ),
                      ]
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.all(
                                theme.spacing.xxs,
                              ),
                              child: e,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                )
              ]
                  .map(
                    (e) => Padding(
                      padding: EdgeInsets.only(
                        bottom: theme.spacing.xxs,
                      ),
                      child: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
