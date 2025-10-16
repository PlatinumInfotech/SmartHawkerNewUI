// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color customBlue;
  late Color customGreen;
  late Color darkError;
  late Color darkWarning;
  late Color darkInfo;
  late Color lightSuccess;
  late Color lightError;
  late Color lightWarning;
  late Color lightInfo;
  late Color primaryText2;
  late Color primaryDarkMode;
  late Color secondaryDarkMode;
  late Color tertiaryDarkMode;
  late Color alternateDarkMode;
  late Color primaryTextDarkMode;
  late Color secondaryTextDarkMode;
  late Color secondaryBackgroundDarkMode;
  late Color accent1DarkMode;
  late Color accent2DarkMode;
  late Color accent3DarkMode;
  late Color accent4DarkMode;
  late Color successDarkMode;
  late Color errorDarkMode;
  late Color warningDarkMode;
  late Color infoDarkMode;
  late Color customColor2;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFE0F1FF);
  late Color secondary = const Color(0xFF5BC0DE);
  late Color tertiary = const Color(0xFF99CD99);
  late Color alternate = const Color(0xFFBBDEFB);
  late Color primaryText = const Color(0xFF212121);
  late Color secondaryText = const Color(0xFF757575);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xFFF5F5F5);
  late Color accent1 = const Color(0xFFFF5252);
  late Color accent2 = const Color(0xFFE8F5E8);
  late Color accent3 = const Color(0xFF5BC0DE);
  late Color accent4 = const Color(0xFFFF4081);
  late Color success = const Color(0xFF4CAF50);
  late Color warning = const Color(0xFFFFC107);
  late Color error = const Color(0xFFFF1744);
  late Color info = const Color(0xFF2196F3);

  late Color customBlue = const Color(0xFFEAF3FA);
  late Color customGreen = const Color(0xFFDDFADF);
  late Color darkError = const Color(0xFFFC7373);
  late Color darkWarning = const Color(0xFFFFA95A);
  late Color darkInfo = const Color(0xFF6540E7);
  late Color lightSuccess = const Color(0xFF45B184);
  late Color lightError = const Color(0xFFF95656);
  late Color lightWarning = const Color(0xFFEC9B50);
  late Color lightInfo = const Color(0xFFBDACF6);
  late Color primaryText2 = const Color(0xFF000000);
  late Color primaryDarkMode = const Color(0xFF5316F4);
  late Color secondaryDarkMode = const Color(0xFF000000);
  late Color tertiaryDarkMode = const Color(0xFF000000);
  late Color alternateDarkMode = const Color(0xFFFAB50C);
  late Color primaryTextDarkMode = const Color(0xFF5316F4);
  late Color secondaryTextDarkMode = const Color(0xFF000000);
  late Color secondaryBackgroundDarkMode = const Color(0xFF000000);
  late Color accent1DarkMode = const Color(0xFF5316F4);
  late Color accent2DarkMode = const Color(0xFFFAB50C);
  late Color accent3DarkMode = const Color(0xFF000000);
  late Color accent4DarkMode = const Color(0xFF5316F4);
  late Color successDarkMode = const Color(0xFF54D59F);
  late Color errorDarkMode = const Color(0xFFFC7373);
  late Color warningDarkMode = const Color(0xFFFFA95A);
  late Color infoDarkMode = const Color(0xFF9B81F6);
  late Color customColor2 = const Color(0xFF72782A);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Inter';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 57.0,
      );
  String get displayMediumFamily => 'Inter';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 45.0,
      );
  String get displaySmallFamily => 'Inter';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      );
  String get headlineLargeFamily => 'Inter';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Inter';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );
  String get headlineSmallFamily => 'Inter';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get titleLargeFamily => 'Readex Pro';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.readexPro(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Readex Pro';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.readexPro(
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get titleSmallFamily => 'Readex Pro';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.readexPro(
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelLargeFamily => 'Readex Pro';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.readexPro(
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Readex Pro';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.readexPro(
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Readex Pro';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.readexPro(
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Readex Pro';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.readexPro(
        color: theme.primaryText,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Readex Pro';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.readexPro(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Readex Pro';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.readexPro(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
