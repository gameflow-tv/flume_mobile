import 'package:flutter/painting.dart';

/// {@category Foundation}
/// {@subCategory Typography}
/// Baseline typography data.
class FlumeTypographyData {
  const FlumeTypographyData({
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
class FlumeTypography {
  const FlumeTypography({
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
  final FlumeTypographyData header1;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Header 2 typography data.
  final FlumeTypographyData header2;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Header 3 typography data.
  final FlumeTypographyData header3;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Header 4 typography data.
  final FlumeTypographyData header4;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Header 5 typography data.
  final FlumeTypographyData header5;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Body 1 typography data.
  final FlumeTypographyData body1;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Body 2 typography data.
  final FlumeTypographyData body2;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Body 3 typography data.
  final FlumeTypographyData body3;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Button typography data.
  final FlumeTypographyData button;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Link typography data.
  final FlumeTypographyData link;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Label 1 typography data.
  final FlumeTypographyData label1;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Label 2 typography data.
  final FlumeTypographyData label2;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Label 3 typography data.
  final FlumeTypographyData label3;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Default typography defined by Flume.
  factory FlumeTypography.fallback() => const FlumeTypography(
        header1: FlumeTypographyData(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          lineHeight: 1.2,
          fontFamily: 'Montserrat',
        ),
        header2: FlumeTypographyData(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          lineHeight: 1.2,
          fontFamily: 'Montserrat',
        ),
        header3: FlumeTypographyData(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          lineHeight: 1.2,
          fontFamily: 'Montserrat',
        ),
        header4: FlumeTypographyData(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          lineHeight: 1.2,
          fontFamily: 'Montserrat',
        ),
        header5: FlumeTypographyData(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          lineHeight: 1.2,
          fontFamily: 'Montserrat',
        ),
        body1: FlumeTypographyData(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          lineHeight: 1.3,
          fontFamily: 'Mulish',
        ),
        body2: FlumeTypographyData(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          lineHeight: 1.3,
          fontFamily: 'Mulish',
        ),
        body3: FlumeTypographyData(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          lineHeight: 1.3,
          fontFamily: 'Mulish',
        ),
        button: FlumeTypographyData(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          lineHeight: 1.2,
          fontFamily: 'Montserrat',
        ),
        link: FlumeTypographyData(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          lineHeight: 1.2,
          fontFamily: 'Montserrat',
        ),
        label1: FlumeTypographyData(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          lineHeight: 1.1,
          fontFamily: 'Montserrat',
        ),
        label2: FlumeTypographyData(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          lineHeight: 1.1,
          fontFamily: 'Montserrat',
        ),
        label3: FlumeTypographyData(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          lineHeight: 1.1,
          fontFamily: 'Montserrat',
        ),
      );
}
