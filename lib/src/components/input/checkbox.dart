import 'package:flume/flume.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Checkbox;

/// Checkbox state values
enum CheckboxState {
  /// Default state
  normal,

  /// Hover state
  hover,

  /// Pressed state
  pressed,

  /// Disabled state
  disabled,

  /// Error state
  error,

  /// Focus state
  focus,
}

/// {@category Components}
/// {@subCategory Input}
/// A checkbox that can be checked or unchecked.
class Checkbox extends StatefulWidget {
  const Checkbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.state,
  }) : super(key: key);

  /// Checked state of the checkbox.
  final bool value;

  /// Called when the checkbox is tapped.
  final ValueChanged<bool> onChanged;

  /// Override default initial state.
  final CheckboxState? state;

  @override
  State<Checkbox> createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkbox> {
  late CheckboxState state;

  @override
  void initState() {
    super.initState();
    state = widget.state ?? CheckboxState.normal;
  }

  @override
  void didUpdateWidget(covariant Checkbox oldWidget) {
    if (widget.state != oldWidget.state) {
      setState(() {
        state = widget.state ?? CheckboxState.normal;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  void handleTapDown(TapDownDetails _) {
    if (widget.state == null) {
      setState(() {
        state = CheckboxState.pressed;
      });
    }
  }

  void handlePointerEnter([PointerEnterEvent? _]) {
    if (widget.state == null) {
      setState(() {
        state = CheckboxState.hover;
      });
    }
  }

  void handlePointerExit([PointerExitEvent? _]) {
    if (widget.state == null) {
      setState(() {
        state = CheckboxState.normal;
      });
    }
  }

  void handleTapUp([TapUpDetails? _]) {
    if (widget.state == null) {
      setState(() {
        state = CheckboxState.normal;
      });
    }
  }

  void handleFocus(bool hasFocus) {
    if (widget.state == null) {
      setState(() {
        state = hasFocus ? CheckboxState.focus : CheckboxState.normal;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: handleFocus,
      child: MouseRegion(
        onEnter: handlePointerEnter,
        onExit: handlePointerExit,
        child: GestureDetector(
          onTapDown: handleTapDown,
          onTapUp: handleTapUp,
          onTapCancel: handleTapUp,
          onTap: () => widget.onChanged.call(!widget.value),
          child: AnimatedContainer(
            duration: context.theme.motion.short,
            width: 24,
            height: 24,
            padding: EdgeInsets.all(
              context.theme.spacing.xxxs,
            ),
            decoration: BoxDecoration(
              color: widget.value ? context.theme.colors.primary : null,
              borderRadius: BorderRadius.circular(
                context.theme.shapes.sm,
              ),
              border: Border.all(
                color: getBorderColor(),
                width: 1,
              ),
            ),
            child: widget.value
                ? Center(
                    child: Icon(
                      Icons.check,
                      size: 12,
                      color: context.theme.colors.onPrimary,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }

  Color getBorderColor() {
    if (widget.value) {
      switch (state) {
        case CheckboxState.normal:
          return context.theme.colors.overlay30;
        case CheckboxState.disabled:
          return context.theme.colors.inactive;
        case CheckboxState.error:
          return context.theme.colors.error;
        case CheckboxState.focus:
          return context.theme.colors.icon;
        case CheckboxState.pressed:
        case CheckboxState.hover:
          return context.theme.colors.overlay70;
      }
    } else {
      switch (state) {
        case CheckboxState.focus:
          return context.theme.colors.primary;
        case CheckboxState.normal:
          return context.theme.colors.icon;
        case CheckboxState.hover:
          return context.theme.colors.primary;
        case CheckboxState.pressed:
          return context.theme.colors.highlight10;
        case CheckboxState.disabled:
          return context.theme.colors.inactive;
        case CheckboxState.error:
          return context.theme.colors.error;
      }
    }
  }
}
