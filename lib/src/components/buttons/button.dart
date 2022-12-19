import 'package:flume/flume.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  /// The size of the button.
  final ButtonSize size;

  /// The variant of the button.
  final ButtonVariant variant;

  /// The main content of the button.
  final Widget child;

  /// Optional icon to display on the right side of the button.
  final Widget? icon;

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

  void handleTapDown(TapDownDetails _) {
    setState(() {
      state = ButtonState.pressed;
    });
  }

  void handlePointerEnter([PointerEnterEvent? _]) {
    setState(() {
      state = ButtonState.hover;
    });
  }

  void handlePointerExit([PointerExitEvent? _]) {
    setState(() {
      state = ButtonState.normal;
    });
  }

  void handleTapUp([TapUpDetails? _]) {
    setState(() {
      state = ButtonState.normal;
    });
  }

  void handleFocus(bool hasFocus) {
    setState(() {
      state = hasFocus ? ButtonState.focus : ButtonState.normal;
    });
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
                  onTap: widget.onPressed,
                  child: AnimatedContainer(
                    duration: theme.motion.short,
                    constraints: BoxConstraints(
                      minWidth: widget.size == ButtonSize.large ? 160 : 0.0,
                      maxWidth: double.infinity,
                    ),
                    decoration: getBoxDecoration(theme),
                    child: DefaultTextStyle(
                      style: theme.typography.button
                          .toTextStyle()
                          .copyWith(color: foregroundColor),
                      child: Padding(
                        padding: getPadding(context),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widget.child,
                            if (widget.icon != null) ...[
                              SizedBox(width: theme.spacing.xs),
                              Theme(
                                data: ThemeData(
                                  iconTheme: IconThemeData(
                                    color: foregroundColor,
                                    size: 16.0,
                                  ),
                                ),
                                child: state == ButtonState.loading
                                    ? getProgressIndicator()
                                    : widget.icon!,
                              ),
                            ],
                          ],
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
        base = ambiance?.color ?? theme.colors.secondary;
        break;
      case ButtonVariant.signal:
        base = theme.colors.signal;
        break;
    }

    switch (state) {
      case ButtonState.normal:
        break;
      case ButtonState.hover:
        base = base.withOpacity(0.8);
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
        base = base.withOpacity(0.4);
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
        base = ambiance?.at(5) ?? theme.colors.header;
        break;
      case ButtonVariant.signal:
        base = theme.colors.onSignal;
        break;
    }

    switch (state) {
      case ButtonState.normal:
        break;
      case ButtonState.hover:
        break;
      case ButtonState.pressed:
        break;
      case ButtonState.focus:
        break;
      case ButtonState.disabled:
        base = base.withOpacity(0.4);
        break;
      case ButtonState.loading:
        base = base.withOpacity(0.4);
        break;
    }

    return base;
  }
}
