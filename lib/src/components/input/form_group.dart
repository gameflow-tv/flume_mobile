import 'package:flume/flume.dart';
import 'package:flume/material.dart';

/// {@category Components}
/// {@subCategory Input}
/// A widget that groups a [label] and [child] together.
class FormGroup extends StatelessWidget {
  const FormGroup({
    super.key,
    required this.label,
    required this.child,
  });

  final Widget label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTextStyle(
          style: context.theme.typography.label2.copyWith(
            color: context.theme.colors.subtitle,
          ),
          child: label,
        ),
        child,
      ].spaced(context.theme.spacing.xs),
    );
  }
}
