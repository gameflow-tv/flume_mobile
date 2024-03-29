import 'package:flume/flume.dart';
import 'package:flutter/gestures.dart';
import 'package:flume/material.dart';

/// {@category Components}
/// {@subCategory Buttons}
/// A regular button, with a variety of sizes and variants.
class Button extends StatefulWidget {
  /// The size of the button.
  final ButtonSize size;

  /// The variant of the button.
  final ButtonVariant variant;

  /// The main content of the button.
  final Widget child;

  /// Optional icon to display on the right side of the button.
  final Widget? icon;

  /// Optional position of the icon.
  final IconPosition iconPosition;

  /// Optional state to override the default initial state.
  final ButtonState? state;

  /// Optional callback to be called when the button is pressed.
  final VoidCallback? onPressed;

  const Button({
    super.key,
    required this.size,
    required this.variant,
    required this.child,
    this.icon,
    this.iconPosition = IconPosition.right,
    this.state,
    this.onPressed,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  late ButtonState state;
  late Color backgroundColor;
  late Color foregroundColor;

  @override
  initState() {
    super.initState();
    state = widget.state ?? ButtonState.normal;
  }

  @override
  void didUpdateWidget(covariant Button oldWidget) {
    if (widget.state != oldWidget.state) {
      setState(() {
        state = widget.state ?? ButtonState.normal;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  void handleTapDown(TapDownDetails _) {
    if (widget.state == null) {
      setState(() {
        state = ButtonState.pressed;
      });
    }
  }

  void handlePointerEnter([PointerEnterEvent? _]) {
    if (widget.state == null) {
      setState(() {
        state = ButtonState.hover;
      });
    }
  }

  void handlePointerExit([PointerExitEvent? _]) {
    if (widget.state == null) {
      setState(() {
        state = ButtonState.normal;
      });
    }
  }

  void handleTapUp([TapUpDetails? _]) {
    if (widget.state == null) {
      setState(() {
        state = ButtonState.normal;
      });
    }
  }

  void handleFocus(bool hasFocus) {
    if (widget.state == null) {
      setState(() {
        state = hasFocus ? ButtonState.focus : ButtonState.normal;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);

    return Ambiance(
      builder: (context, ambiance) {
        backgroundColor = getBackgroundColor(context);
        foregroundColor = getForegroundColor(context);

        return Focus(
          onFocusChange: handleFocus,
          child: Wrap(
            children: [
              MouseRegion(
                onEnter: handlePointerEnter,
                onExit: handlePointerExit,
                child: GestureDetector(
                  onTapDown: handleTapDown,
                  onTapUp: handleTapUp,
                  onTapCancel: handleTapUp,
                  onTap:
                      state == ButtonState.disabled ? null : widget.onPressed,
                  child: AnimatedContainer(
                    width: widget.size == ButtonSize.expand
                        ? double.infinity
                        : null,
                    duration: theme.motion.short,
                    constraints: BoxConstraints(
                      minWidth: widget.size == ButtonSize.large
                          ? 160
                          : widget.size == ButtonSize.expand
                              ? double.infinity
                              : 0.0,
                      maxWidth: double.infinity,
                    ),
                    decoration: getBoxDecoration(theme),
                    child: DefaultTextStyle(
                      style: theme.typography.button
                          .copyWith(color: foregroundColor),
                      child: Padding(
                        padding: getPadding(context),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            if (widget.iconPosition == IconPosition.right) ...[
                              Flexible(
                                child: widget.child,
                              ),
                              if (getIcon() != null) getIcon()!,
                            ] else ...[
                              if (getIcon() != null) getIcon()!,
                              Flexible(
                                child: widget.child,
                              ),
                            ],
                          ].spaced(theme.spacing.xs),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget? getIcon() {
    if (widget.icon == null && state != ButtonState.loading) {
      return null;
    }

    return Theme(
      data: ThemeData(
        iconTheme: IconThemeData(
          color: foregroundColor,
          size: 16.0,
        ),
      ),
      child:
          state == ButtonState.loading ? getProgressIndicator() : widget.icon!,
    );
  }

  SizedBox getProgressIndicator() {
    return SizedBox(
      width: 16.0,
      height: 16.0,
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
        color: foregroundColor,
      ),
    );
  }

  BoxDecoration getBoxDecoration(FlumeTheme theme) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(theme.shapes.sm),
      boxShadow: [
        if (state == ButtonState.focus) ...{
          theme.shadows.focus,
        }
      ],
      border: state == ButtonState.focus
          ? Border.all(
              color: theme.colors.buttonFocus,
              width: 1.0,
            )
          : null,
    );
  }

  EdgeInsets getPadding(BuildContext context) {
    final theme = Flume.of(context);

    switch (widget.size) {
      case ButtonSize.medium:
        return EdgeInsets.symmetric(
          vertical: theme.spacing.sm,
          horizontal: theme.spacing.lg,
        );
      case ButtonSize.large:
      case ButtonSize.expand:
        return EdgeInsets.all(theme.spacing.md);
    }
  }

  Color getBackgroundColor(BuildContext context) {
    final theme = Flume.of(context);
    final ambiance = Ambiance.of(context);

    Color base;

    switch (widget.variant) {
      case ButtonVariant.primary:
        base = theme.colors.primary;
        break;
      case ButtonVariant.tonal:
        base = ambiance.color;

        if (state != ButtonState.hover) {
          return base;
        }

        break;
      case ButtonVariant.signal:
        base = theme.colors.signal;
        break;
      case ButtonVariant.light:
        base = ambiance.palette.light;
        break;
    }

    switch (state) {
      case ButtonState.normal:
        break;
      case ButtonState.hover:
        base = base.withOpacity(0.8);

        if (widget.variant == ButtonVariant.tonal) {
          base = ambiance.lighter();
        }
        break;
      case ButtonState.pressed:
        base = base.withOpacity(0.6);
        break;
      case ButtonState.focus:
        base = base.withOpacity(0.8);
        break;
      case ButtonState.disabled:
        base = base.withOpacity(0.4);
        break;
      case ButtonState.loading:
        base = base.withOpacity(0.6);
        break;
    }

    return base;
  }

  Color getForegroundColor(BuildContext context) {
    final theme = Flume.of(context);
    final ambiance = Ambiance.of(context);

    Color base;

    switch (widget.variant) {
      case ButtonVariant.primary:
        base = theme.colors.onPrimary;
        break;
      case ButtonVariant.tonal:
        base = theme.colors.body;
        break;
      case ButtonVariant.signal:
        base = theme.colors.onSignal;
        break;
      case ButtonVariant.light:
        base = ambiance.palette.dark;
        break;
    }

    switch (state) {
      case ButtonState.normal:
        break;
      case ButtonState.hover:
        if (widget.variant == ButtonVariant.tonal) {
          base = theme.colors.header;
        }
        break;
      case ButtonState.pressed:
        base = base.withOpacity(0.7);
        break;
      case ButtonState.focus:
        break;
      case ButtonState.disabled:
        base = base.withOpacity(0.4);
        break;
      case ButtonState.loading:
        base = base.withOpacity(0.6);
        break;
    }

    return base;
  }
}
