import 'package:flutter/painting.dart';

/// Baseline typography data.
class TypographyData {
  const TypographyData({
    required double fontSize,
    required FontWeight fontWeight,
    required double lineHeight,
    required String fontFamily,
  });
}

/// {@category Foundation}
/// {@subCategory Typography}
/// Typography defined by Flume.
class Typography {
  const Typography({
    required TypographyData header1,
    required TypographyData header2,
    required TypographyData header3,
    required TypographyData header4,
    required TypographyData header5,
    required TypographyData body1,
    required TypographyData body2,
    required TypographyData body3,
    required TypographyData button,
    required TypographyData link,
    required TypographyData label1,
    required TypographyData label2,
    required TypographyData label3,
  });

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Default typography defined by Flume.
  factory Typography.fallback() => const Typography(
        header1: TypographyData(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          lineHeight: 1.2,
          fontFamily: 'Montserrat',
        ),
        header2: TypographyData(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          lineHeight: 1.2,
          fontFamily: 'Montserrat',
        ),
        header3: TypographyData(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          lineHeight: 1.2,
          fontFamily: 'Montserrat',
        ),
        header4: TypographyData(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          lineHeight: 1.2,
          fontFamily: 'Montserrat',
        ),
        header5: TypographyData(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          lineHeight: 1.2,
          fontFamily: 'Montserrat',
        ),
        body1: TypographyData(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          lineHeight: 1.3,
          fontFamily: 'Mulish',
        ),
        body2: TypographyData(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          lineHeight: 1.3,
          fontFamily: 'Mulish',
        ),
        body3: TypographyData(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          lineHeight: 1.3,
          fontFamily: 'Mulish',
        ),
        button: TypographyData(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          lineHeight: 1.2,
          fontFamily: 'Montserrat',
        ),
        link: TypographyData(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          lineHeight: 1.2,
          fontFamily: 'Montserrat',
        ),
        label1: TypographyData(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          lineHeight: 1.1,
          fontFamily: 'Montserrat',
        ),
        label2: TypographyData(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          lineHeight: 1.1,
          fontFamily: 'Montserrat',
        ),
        label3: TypographyData(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          lineHeight: 1.1,
          fontFamily: 'Montserrat',
        ),
      );
}
