import 'package:flume/src/ambiance.dart';
import 'package:flutter/widgets.dart';

/// {@category Ambiance}
/// {@subCategory Extensions}
extension AmbianceExtension on BuildContext {
  AmbianceState get ambiance => Ambiance.of(this);
}
