import 'package:flume/flume.dart';
import 'package:flume/material.dart';

class Layout extends StatelessWidget {
  const Layout({
    super.key,
    this.child,
    this.builder,
  }) : assert(
          child != null || builder != null,
          'Either child or builder must be provided.',
        );

  final Widget? child;
  final Widget Function(BuildContext, AmbianceState)? builder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.ambiance.color,
      body: SafeArea(
        child: Ambiance(
          builder: builder,
          child: child,
        ),
      ),
    );
  }
}
