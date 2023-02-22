import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flutter/services.dart';

/// {@category Components}
/// {@subCategory Input}
/// A state for an [InputField].
enum InputState {
  empty,
  active,
  error,
}

/// {@category Components}
/// {@subCategory Input}
/// An input field from the Flume design system.
class InputField extends StatefulWidget {
  /// If the surrounding borders should be hidden.
  final bool hideBorders;

  /// The max amount of lines available.
  final int? maxLines;

  /// The max length of the input string.
  final int? maxLength;

  /// If this field should accept multiple lines of input.
  final bool multiline;

  /// If the system's autocorrect should be enabled for this field.
  final bool autocorrect;

  /// If this field should be read-only.
  final bool readOnly;

  /// If this field can expand.
  final bool expands;

  /// If this field should display a character counter.
  final bool counter;

  /// If the input text should be obscured.
  final bool? obscureText;

  /// If this field should receive focus automatically.
  final bool autofocus;

  /// If the system keyboard should enable suggestions for this field.
  final bool enableSuggestions;

  /// The text to display on validation errors.
  final String? errorText;

  /// {@template flume.components.input.hintText}
  /// The hint text to display before the field is modified. Disappears once
  /// text is entered in the field.
  /// {@endtemplate}
  final String? hintText;

  /// The label to display above the field. Will not go away once user starts
  /// to type.
  final String? label;

  /// The suffix text to display after the input.
  final String? suffixText;

  /// The [TextStyle] applied to [suffixText]
  final TextStyle? suffixStyle;

  /// The suffix text to prefix the input with.
  final String? prefixText;

  /// The [TextStyle] applied to [prefixText]
  final TextStyle? prefixStyle;

  /// The optional [TextStyle] applied to [label].
  final TextStyle? labelStyle;

  /// {@template flume.gestures.onEditingComplete}
  /// The callback function that is called when the field has been edited.
  /// {@endtemplate}
  final VoidCallback? onEditingComplete;

  /// {@template flume.gestures.onTap}
  /// Callback function invoked when the widget has received a tap gesture.
  /// {@endtemplate}
  final VoidCallback? onTap;

  /// {@template flume.components.input.controller}
  /// The [TextEditingController] used control and modify this field.
  /// {@endtemplate}
  final TextEditingController? controller;

  /// The type of keyboard to display when this field is tapped.
  final TextInputType? keyboardType;

  /// The type of action to display on the system keyboard.
  final TextInputAction? textInputAction;

  /// The validator function that is called on form validation. Should return
  /// the error text to display.
  final String? Function(String?)? validator;

  /// {@template flume.gestures.onChanged}
  /// Callback function that is called when the [controller] text changes. Passes the
  /// updated value as a parameter.
  /// {@endtemplate}
  final Function(String)? onChanged;

  /// {@template flume.gestures.onFieldSubmitted}
  /// The callback function that is called when the field has been submitted by
  /// the user pressing the keyboard's action button.
  /// {@endtemplate}
  final Function(String)? onFieldSubmitted;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// Validators for formatting as-you-type.
  final List<TextInputFormatter>? inputFormatters;

  /// Optional [TextStyle] for custom typography.
  final TextStyle? style;

  /// Optional [Alignment] for the counter label.
  /// Defaults to [Alignment.bottomRight]
  final Alignment counterAlignment;

  /// A widget to suffix the input.
  final Widget? suffix;

  /// A widget to suffix the input.
  final Widget? suffixIcon;

  /// A widget to prefix the input.
  final Widget? prefix;

  /// A widget to prefix the input.
  final Widget? prefixIcon;

  /// Whether or not this input is enabled.
  final bool enabled;

  /// The callback function that is called when the user taps outside of the input.
  final void Function(PointerDownEvent)? onTapOutside;

  /// The minimum number of lines to display when [expands] is true.
  final int? minLines;

  const InputField({
    Key? key,
    this.controller,
    this.maxLines,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.errorText,
    this.keyboardType,
    this.autocorrect = true,
    this.readOnly = false,
    this.multiline = false,
    this.expands = false,
    this.counter = true,
    this.autofocus = false,
    this.hintText,
    this.label,
    this.obscureText,
    this.focusNode,
    this.enableSuggestions = true,
    this.onTap,
    this.textInputAction,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.hideBorders = true,
    this.style,
    this.labelStyle,
    this.counterAlignment = Alignment.bottomRight,
    this.suffixText,
    this.suffixStyle,
    this.prefixStyle,
    this.prefixText,
    this.prefix,
    this.suffix,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled = true,
    this.onTapOutside,
    this.minLines,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late TextEditingController _controller;
  late GlobalKey<FormFieldState> _fieldKey;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _fieldKey = GlobalKey<FormFieldState>();
    _obscureText = widget.obscureText ?? false;
    widget.controller?.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _fieldKey.currentState?.dispose();

    // Dispose of the controller if it was created by this widget.
    if (widget.controller == null) {
      _controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);
    final style = widget.style ?? theme.typography.body1;

    return Ambiance(
      builder: (context, ambiance) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (widget.label != null) ...[
              Text(
                widget.label!,
                style: widget.labelStyle ?? theme.typography.header4,
              ),
              SizedBox(height: theme.spacing.xs),
            ],
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(theme.shapes.sm),
                child: AnimatedOpacity(
                  opacity: widget.enabled ? 1 : 0.6,
                  duration: context.theme.motion.short,
                  child: TextFormField(
                    enabled: widget.enabled,
                    key: _fieldKey,
                    onEditingComplete: widget.onEditingComplete,
                    cursorColor: ambiance.palette.light,
                    controller: _controller,
                    validator: widget.validator,
                    maxLength: widget.maxLength,
                    maxLines: widget.maxLines ?? (widget.expands ? null : 1),
                    minLines: widget.minLines,
                    onChanged: widget.onChanged,
                    expands: widget.expands,
                    autocorrect: widget.autocorrect,
                    readOnly: widget.readOnly,
                    autofocus: widget.autofocus,
                    style: style,
                    obscureText: _obscureText,
                    keyboardType: widget.keyboardType ?? defaultKeyboard,
                    buildCounter: _buildCounter,
                    focusNode: widget.focusNode,
                    enableSuggestions: widget.enableSuggestions,
                    onTap: widget.onTap,
                    onTapOutside: widget.onTapOutside,
                    textInputAction: widget.textInputAction,
                    onFieldSubmitted: widget.onFieldSubmitted,
                    inputFormatters: widget.inputFormatters,
                    textAlignVertical: widget.expands
                        ? TextAlignVertical.top
                        : TextAlignVertical.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      hintStyle: style.copyWith(color: theme.colors.inactive),
                      prefixText: widget.prefixText,
                      prefixStyle: widget.prefixStyle,
                      suffixText: widget.suffixText,
                      suffixStyle: widget.suffixStyle,
                      errorText: widget.errorText,
                      errorStyle: theme.typography.label1
                          .copyWith(color: theme.colors.error),
                      suffix: widget.suffix,
                      prefix: widget.prefix,
                      suffixIcon: Theme(
                        data: ThemeData(
                          iconTheme: IconThemeData(
                            color: theme.colors.inactive,
                            size: 20,
                          ),
                        ),
                        child: _buildSuffixIcon(theme),
                      ),
                      prefixIcon: _buildPrefixIcon(theme),
                      fillColor: ambiance.color,
                      filled: true,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget? _buildPrefixIcon(FlumeTheme theme) {
    if (widget.prefixIcon != null) {
      return Theme(
        data: ThemeData(
          iconTheme: IconThemeData(
            color: theme.colors.inactive,
            size: 20,
          ),
        ),
        child: widget.prefixIcon!,
      );
    }

    return null;
  }

  Widget _buildSuffixIcon(FlumeTheme theme) {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon!;
    }

    if (widget.obscureText != null && _controller.text.isNotEmpty) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: Icon(
          _obscureText ? FlumeIcons.eye : FlumeIcons.eye_closed,
          color: theme.colors.icon,
          size: 20.0,
        ),
      );
    }

    if (_controller.text.isNotEmpty) {
      return GestureDetector(
        onTap: widget.controller?.clear,
        child: Icon(
          showIcon ? FlumeIcons.times : null,
          color: theme.colors.inactive,
          size: 16.0,
        ),
      );
    }

    return const SizedBox.shrink();
  }

  bool get hasError => _fieldKey.currentState?.hasError ?? false;

  bool get hasText => widget.controller?.text.isNotEmpty ?? false;

  bool get showIcon => hasText && !widget.multiline;

  bool get multiline => widget.multiline;

  Widget? _buildCounter(
    BuildContext context, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  }) {
    final theme = Flume.of(context);

    if (maxLength != null && widget.counter) {
      return Align(
        alignment: widget.counterAlignment,
        child: Text(
          '$currentLength/$maxLength',
          style: theme.typography.label3
            ..copyWith(
              color: theme.colors.inactive,
            ),
        ),
      );
    }
    return null;
  }

  TextInputType get defaultKeyboard {
    if (multiline) {
      return TextInputType.multiline;
    } else {
      return TextInputType.text;
    }
  }
}
