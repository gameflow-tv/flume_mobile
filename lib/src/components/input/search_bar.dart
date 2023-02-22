import 'package:flume/flume.dart';
import 'package:flume/material.dart';

/// {@category Components}
/// {@subCategory Input}
/// A widget that displays a search bar.
class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
    this.controller,
    this.focusNode,
    required this.cancelText,
    this.hintText,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String cancelText;
  final String? hintText;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();

    _controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    // Dispose of the controller if it was created by this widget.
    if (widget.controller == null) {
      _controller.dispose();
    }

    // Dispose of the focus node if it was created by this widget.
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  bool get _showCancelButton => context.cupertino && _focusNode.hasFocus;

  @override
  Widget build(BuildContext context) {
    final size = calculateSize(
      widget.cancelText,
      context.theme.typography.button,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        return TweenAnimationBuilder(
          duration: context.theme.motion.long,
          curve: Curves.ease,
          tween: Tween<double>(
            begin: 0.0,
            end: _showCancelButton ? size.width : 0.0,
          ),
          builder: (context, animation, _) {
            return TweenAnimationBuilder(
              duration: context.theme.motion.long,
              curve: Curves.ease,
              tween: Tween<double>(
                begin: 0.0,
                end: _showCancelButton ? context.theme.spacing.sm : 0.0,
              ),
              builder: (context, gapAnimation, _) {
                return Row(
                  children: [
                    Expanded(
                      flex: constraints.maxWidth.toInt(),
                      child: InputField(
                        controller: _controller,
                        suffixIcon: _suffix,
                        prefixIcon: _prefix,
                        focusNode: _focusNode,
                        hintText: widget.hintText,
                      ),
                    ),
                    Expanded(
                      flex: (animation +
                              (_showCancelButton
                                  ? context.theme.spacing.sm
                                  : 0))
                          .floor(),
                      child: AnimatedSwitcher(
                        duration: context.theme.motion.short,
                        reverseDuration: context.theme.motion.short,
                        transitionBuilder: (child, animation) => FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                        child: _showCancelButton
                            ? cancelButton
                            : const SizedBox.shrink(),
                      ),
                    ),
                  ].spaced(gapAnimation),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget get _prefix {
    return Icon(
      FlumeIcons.search,
      color: context.ambiance.palette.light,
      size: 16,
    );
  }

  Widget? get _suffix {
    if (_controller.text.isNotEmpty) {
      return GestureDetector(
        child: Icon(
          FlumeIcons.times,
          color: context.theme.colors.inactive,
          size: 18,
        ),
        onTap: () {
          _controller.clear();
        },
      );
    }
    return null;
  }

  Widget get cancelButton {
    return GestureDetector(
      child: Text(
        widget.cancelText,
        style: context.theme.typography.link.copyWith(
          color: context.theme.colors.body,
        ),
        overflow: TextOverflow.visible,
        maxLines: 1,
      ),
      onTap: () {
        _focusNode.unfocus();
        _controller.clear();
        setState(() {});
      },
    );
  }
}

/// {@category Components}
/// Calculates and returns the [Size] of the given [text] and its [style].
Size calculateSize(String text, TextStyle style) {
  final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr)
    ..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}
