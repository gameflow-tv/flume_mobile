import 'package:flume/flume.dart';
import 'package:flutter/material.dart';

/// {@category Components}
/// {@subCategory Lists}
/// A list cell from the Flume design system.
class Cell extends StatefulWidget {
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

  /// If this [Cell] should be dense (less padding).
  final bool dense;

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
    this.dense = false,
  });

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> {
  late bool _pressed;

  @override
  void initState() {
    super.initState();
    _pressed = false;
  }

  void handleTapDown([TapDownDetails? details]) {
    setState(() {
      _pressed = true;
    });
  }

  void handleTapUp([TapUpDetails? details]) {
    setState(() {
      _pressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);

    return AnimatedOpacity(
      duration: context.theme.motion.short,
      opacity: (widget.disabled || _pressed) ? 0.6 : 1,
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: handleTapDown,
        onTapUp: handleTapUp,
        onTapCancel: handleTapUp,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: widget.dense
                ? context.theme.spacing.xxs
                : context.theme.spacing.sm,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(theme.shapes.md),
          ),
          child: SafeArea(
            top: false,
            bottom: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (widget.leading != null) ...{
                        widget.leading!,
                      },
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultTextStyle(
                              style: context.theme.typography.header5,
                              child: widget.title,
                            ),
                            if (widget.subtitle != null) ...{
                              DefaultTextStyle(
                                style: context.theme.typography.body2.copyWith(
                                  color: context.theme.colors.subtitle,
                                ),
                                child: widget.subtitle!,
                              ),
                            }
                          ].spaced(context.theme.spacing.xxs),
                        ),
                      ),
                    ].spaced(context.theme.spacing.sm),
                  ),
                ),
                if (widget.trailing != null) ...{
                  widget.trailing!
                } else if (widget.implyNavigation) ...{
                  const Icon(
                    FlumeIcons.chevron_right,
                    size: 24,
                  ),
                }
              ],
            ),
          ),
        ),
      ),
    );
  }
}
