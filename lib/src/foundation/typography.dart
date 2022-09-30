import 'package:flutter/painting.dart';

/// {@category Foundation}
/// {@subCategory Typography}
/// Baseline typography data.
class TypographyData {
  const TypographyData({
    required this.fontSize,
    required this.fontWeight,
    required this.lineHeight,
    required this.fontFamily,
  });

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Font size.
  final double fontSize;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Font weight.
  final FontWeight fontWeight;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Line height.
  final double lineHeight;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Font family.
  final String fontFamily;
}

/// {@category Foundation}
/// {@subCategory Typography}
/// Typography defined by Flume.
class Typography {
  const Typography({
    required this.header1,
    required this.header2,
    required this.header3,
    required this.header4,
    required this.header5,
    required this.body1,
    required this.body2,
    required this.body3,
    required this.button,
    required this.link,
    required this.label1,
    required this.label2,
    required this.label3,
  });

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Header 1 typography data.
  final TypographyData header1;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Header 2 typography data.
  final TypographyData header2;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Header 3 typography data.
  final TypographyData header3;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Header 4 typography data.
  final TypographyData header4;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Header 5 typography data.
  final TypographyData header5;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Body 1 typography data.
  final TypographyData body1;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Body 2 typography data.
  final TypographyData body2;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Body 3 typography data.
  final TypographyData body3;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Button typography data.
  final TypographyData button;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Link typography data.
  final TypographyData link;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Label 1 typography data.
  final TypographyData label1;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Label 2 typography data.
  final TypographyData label2;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Label 3 typography data.
  final TypographyData label3;

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
