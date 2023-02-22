import 'dart:io';

import 'package:flume/flume.dart';
import 'package:flutter/cupertino.dart';
import 'package:flume/material.dart';

/// {@category Components}
/// {@subCategory Input}
/// A widget that displays a switch that adapts to the current platform, and
/// uses the current [Ambiance] to determine its colors.
class TonalSwitch extends StatelessWidget {
  const TonalSwitch({super.key, required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    if (Platform.isMacOS || Platform.isIOS) {
      return _CupertinoSwitch(key: key, value: value, onChanged: onChanged);
    } else {
      return _MaterialSwitch(key: key, value: value, onChanged: onChanged);
    }
  }
}

class _CupertinoSwitch extends StatelessWidget {
  const _CupertinoSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: context.ambiance.palette.light,
      trackColor: context.ambiance.palette.mediumDark,
      thumbColor: value
          ? context.ambiance.palette.dark
          : context.ambiance.palette.light,
    );
  }
}

class _MaterialSwitch extends StatelessWidget {
  const _MaterialSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: context.ambiance.palette.dark,
      activeTrackColor: context.ambiance.palette.light,
      inactiveThumbColor: context.ambiance.palette.light,
      inactiveTrackColor: context.ambiance.palette.mediumDark,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
