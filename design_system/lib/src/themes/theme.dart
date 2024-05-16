import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _defaultInputBorder = OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide.none);

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        errorStyle: TextStyle(
          color: Color(0xffEB5757),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        fillColor: Color(0xffF2F2F9),
        labelStyle: TextStyle(
          color: Color(0xff333333),
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        border: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        errorBorder: _defaultInputBorder),
    colorScheme: const ColorScheme.light(
      primary: Color(0xff129166),
      secondary: Color(0xfffcb900),
      tertiary: Color(0xff84cc6d),
      error: Color(0xffEB5757),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w700),
      displayMedium: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),
      displaySmall: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w400),
      headlineLarge: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700),
      headlineMedium: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
      headlineSmall: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w400),
      titleLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700),
      titleMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
      titleSmall: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
      bodyLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700),
      bodyMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
      bodySmall: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
      labelLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700),
      labelMedium: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600),
      labelSmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
    ),
    extensions: const [
      CoopartilharColors(
        primary: Color(0xff129166),
        secondary: Color(0xfffcb900),
        tertiary: Color(0xff84cc6d),
        error: Color(0xffEB5757),
        black: Color(0xff000000),
        black2: Color(0xff151515),
        textColor: Color(0xff333333),
        middleGrey: Color(0xffb6c5d1),
        grey: Color(0xffb6c5d1),
        lightGrey: Color(0xffF2F2F7),
        white: Color(0xffFFFFFF),
        success: Color(0xff00FF85),
        otherYellow: Color(0xffffc745),
        otherGreen: Color(0xff00b050),
      ),
    ],
  );
}

class CoopartilharColors extends ThemeExtension<CoopartilharColors> {
  const CoopartilharColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.error,
    required this.success,
    required this.otherYellow,
    required this.otherGreen,
    required this.black,
    required this.black2,
    required this.textColor,
    required this.middleGrey,
    required this.grey,
    required this.lightGrey,
    required this.white,
  });

  final Color primary;
  final Color secondary;
  final Color success;
  final Color tertiary;
  final Color error;
  final Color otherYellow;
  final Color otherGreen;
  final Color black;
  final Color black2;
  final Color textColor;
  final Color middleGrey;
  final Color grey;
  final Color lightGrey;
  final Color white;

  static CoopartilharColors of(BuildContext context) {
    return Theme.of(context).extension<CoopartilharColors>()!;
  }

  @override
  ThemeExtension<CoopartilharColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? error,
    Color? success,
    Color? otherYellow,
    Color? otherGreen,
    Color? black,
    Color? black2,
    Color? textColor,
    Color? middleGrey,
    Color? grey,
    Color? lightGrey,
    Color? white,
  }) {
    return CoopartilharColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      error: error ?? this.error,
      success: success ?? this.success,
      otherYellow: otherYellow ?? this.otherYellow,
      otherGreen: otherGreen ?? this.otherGreen,
      black: black ?? this.black,
      black2: black2 ?? this.black2,
      textColor: textColor ?? this.textColor,
      middleGrey: middleGrey ?? this.middleGrey,
      grey: grey ?? this.grey,
      lightGrey: lightGrey ?? this.lightGrey,
      white: white ?? this.white,
    );
  }

  @override
  ThemeExtension<CoopartilharColors> lerp(
    covariant ThemeExtension<CoopartilharColors>? other,
    double t,
  ) {
    if (other is! CoopartilharColors) {
      return this;
    }

    return CoopartilharColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
      otherYellow: Color.lerp(otherYellow, other.otherYellow, t)!,
      otherGreen: Color.lerp(otherGreen, other.otherGreen, t)!,
      black: Color.lerp(black, other.black, t)!,
      black2: Color.lerp(black2, other.black2, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      middleGrey: Color.lerp(middleGrey, other.middleGrey, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t)!,
      white: Color.lerp(white, other.white, t)!,
    );
  }
}
