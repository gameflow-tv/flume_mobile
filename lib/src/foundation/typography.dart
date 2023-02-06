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

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Returns a [TextStyle] instance created from the current [FlumeTypographyData].
  TextStyle toTextStyle() => TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        height: lineHeight,
        package: 'flume',
      );
}

/// {@category Foundation}
/// {@subCategory Typography}
/// Typography defined by Flume.
class FlumeTypography {
  const FlumeTypography({
    required FlumeTypographyData header1,
    required FlumeTypographyData header2,
    required FlumeTypographyData header3,
    required FlumeTypographyData header4,
    required FlumeTypographyData header5,
    required FlumeTypographyData body1,
    required FlumeTypographyData body2,
    required FlumeTypographyData body3,
    required FlumeTypographyData button,
    required FlumeTypographyData link,
    required FlumeTypographyData label1,
    required FlumeTypographyData label2,
    required FlumeTypographyData label3,
  })  : _header1 = header1,
        _header2 = header2,
        _header3 = header3,
        _header4 = header4,
        _header5 = header5,
        _body1 = body1,
        _body2 = body2,
        _body3 = body3,
        _button = button,
        _link = link,
        _label1 = label1,
        _label2 = label2,
        _label3 = label3;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Header 1 text style.
  TextStyle get header1 => _header1.toTextStyle();

  final FlumeTypographyData _header1;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Header 2 text style.
  TextStyle get header2 => _header2.toTextStyle();

  final FlumeTypographyData _header2;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Header 3 text style.
  TextStyle get header3 => _header3.toTextStyle();

  final FlumeTypographyData _header3;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Header 4 text style.
  TextStyle get header4 => _header4.toTextStyle();

  final FlumeTypographyData _header4;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Header 5 text style.
  TextStyle get header5 => _header5.toTextStyle();

  final FlumeTypographyData _header5;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Body 1 text style.
  TextStyle get body1 => _body1.toTextStyle();

  final FlumeTypographyData _body1;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Body 2 text style.
  TextStyle get body2 => _body2.toTextStyle();

  final FlumeTypographyData _body2;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Body 3 text style.
  TextStyle get body3 => _body3.toTextStyle();

  final FlumeTypographyData _body3;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Button text style.
  TextStyle get button => _button.toTextStyle();

  final FlumeTypographyData _button;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Link text style.
  TextStyle get link => _link.toTextStyle();

  final FlumeTypographyData _link;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Label 1 text style.
  TextStyle get label1 => _label1.toTextStyle();

  final FlumeTypographyData _label1;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Label 2 text style.
  TextStyle get label2 => _label2.toTextStyle();

  final FlumeTypographyData _label2;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Label 3 text style.
  TextStyle get label3 => _label3.toTextStyle();

  final FlumeTypographyData _label3;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Returns the raw [FlumeRawTypography] data.
  FlumeRawTypography get raw => FlumeRawTypography(
        header1: _header1,
        header2: _header2,
        header3: _header3,
        header4: _header4,
        header5: _header5,
        body1: _body1,
        body2: _body2,
        body3: _body3,
        button: _button,
        link: _link,
        label1: _label1,
        label2: _label2,
        label3: _label3,
      );

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
          fontWeight: FontWeight.w700,
          lineHeight: 1.142,
          fontFamily: 'Montserrat',
        ),
        link: FlumeTypographyData(
          fontSize: 14,
          fontWeight: FontWeight.w600,
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

class FlumeRawTypography {
  const FlumeRawTypography({
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
}
