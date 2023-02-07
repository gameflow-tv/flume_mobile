import 'package:flume/flume.dart';
import 'package:flume_example/widgets/blueprint.dart';
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
          body: Blueprint(
            child: DefaultTextStyle(
              style: theme.typography.header2,
              child: ScrollableList(
                divided: true,
                padding: EdgeInsets.all(theme.spacing.md),
                children: [
                  ScrollableList.static(
                    title: const Text('Primary medium'),
                    divided: false,
                    children: [
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

                  ScrollableList.static(
                    title: const Text('Primary large'),
                    divided: false,
                    children: [
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
                  ScrollableList.static(
                    title: const Text('Tonal medium'),
                    divided: false,
                    children: [
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

                  ScrollableList.static(
                    title: const Text('Tonal medium'),
                    divided: false,
                    children: [
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

                  ScrollableList.static(
                    title: const Text('Signal medium'),
                    divided: false,
                    children: [
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

                  ScrollableList.static(
                    title: const Text('Primary medium'),
                    divided: false,
                    children: [
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

                  ScrollableList.static(
                    title: const Text('Primary medium'),
                    divided: false,
                    children: [
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
                  ScrollableList.static(
                    title: const Text('Primary large'),
                    divided: false,
                    children: [
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

                  ScrollableList.static(
                    title: const Text('Tonal medium'),
                    divided: false,
                    children: [
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

                  ScrollableList.static(
                    title: const Text('Primary medium'),
                    divided: false,
                    children: [
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

                  ScrollableList.static(
                    title: const Text('Signal medium'),
                    divided: false,
                    children: [
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

                  ScrollableList.static(
                    title: const Text('Signal large'),
                    divided: false,
                    children: [
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

                  ScrollableList.static(
                    title: const Text('Standard unselected'),
                    divided: false,
                    children: [
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
                  ScrollableList.static(
                    title: const Text('Standard selected'),
                    divided: false,
                    children: [
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
                  ScrollableList.static(
                    title: const Text('Tonal unselected'),
                    divided: false,
                    children: [
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
                  ScrollableList.static(
                    title: const Text('Tonal selected'),
                    divided: false,
                    children: [
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

                  // Ghost buttons
                  ScrollableList.static(
                    title: const Text('GhostButton'),
                    divided: false,
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
          ),
        );
      },
    );
  }
}
