import 'package:flume/flume.dart';
import 'package:flutter/widgets.dart';

extension ThemeExtension on BuildContext {
  FlumeTheme get theme => Flume.of(this);
}
