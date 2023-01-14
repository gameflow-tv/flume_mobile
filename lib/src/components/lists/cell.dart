import 'package:flume/flume.dart';
import 'package:flutter/material.dart';

/// {@category Components}
/// {@subCategory List}
/// A list cell from the Flume design system.
class Cell extends StatelessWidget {
  /// A widget on the left-hand side of this [Cell]'s title.
  final Widget? leading;

  /// The main widget to display in this [Cell]. Should be the relevant
  /// information this cell is supposed to convey.
  final Widget title;

  /// A subtitle for this [Cell] that is display beneath the [title].
  final Widget? subtitle;

  /// A trailing widget on the right-hand side of this [Cell]'s title.
  final Widget? trailing;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool? autofocus;

  /// {@macro flume.gestures.onTap}
  final GestureTapCallback? onTap;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// If this [Cell] should display an arrow implying navigation on tap.
  final bool implyNavigation;

  /// If this [Cell] should be disabled.
  final bool disabled;

  const Cell({
    super.key,
    required this.title,
    this.leading,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.autofocus,
    this.focusNode,
    this.implyNavigation = false,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);

    return Opacity(
      opacity: disabled ? 0.6 : 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: context.theme.spacing.sm,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(theme.shapes.md),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (leading != null) ...{
                      leading!,
                    },
                    Flexible(
                      child: Column(
                        children: [
                          title,
                          if (subtitle != null) ...{
                            subtitle!,
                          }
                        ],
                      ),
                    ),
                  ].spaced(context.theme.spacing.sm),
                ),
              ),
              if (trailing != null) ...{
                trailing!
              } else if (onTap != null && implyNavigation) ...{
                const Icon(
                  FlumeIcons.chevron_right,
                  size: 14,
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}
