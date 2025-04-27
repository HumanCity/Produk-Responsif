import 'dart:math';

import 'package:flutter/material.dart';

class ColorVariant {
  final Color veryLight;
  final Color light;
  final Color soft;
  final Color base;
  final Color bold;
  final Color deep;

  ColorVariant({
    required this.veryLight,
    required this.light,
    required this.soft,
    required this.base,
    required this.bold,
    required this.deep,
  });

  factory ColorVariant.fromBase(Color baseColor,
      {Brightness brightness = Brightness.light}) {
    return ColorVariant(
      veryLight: brightness == Brightness.light
          ? _adjustLightness(baseColor, 0.99, 1.0)
          : _adjustLightness(baseColor, 0.1, 0.9),
      light: brightness == Brightness.light
          ? _adjustLightness(baseColor, 0.94, 0.55)
          : _adjustLightness(baseColor, 0.16, 0.88),
      soft: brightness == Brightness.light
          ? _adjustLightness(baseColor, 0.72, 0.55)
          : _adjustLightness(baseColor, 0.28, 0.87),
      base: brightness == Brightness.light
          ? baseColor
          : _adjustLightness(baseColor, 0.45, 0.80),
      bold: brightness == Brightness.light
          ? _adjustLightness(baseColor, 0.28, 0.87)
          : _adjustLightness(baseColor, 0.72, 0.55),
      deep: brightness == Brightness.light
          ? _adjustLightness(baseColor, 0.16, 0.88)
          : _adjustLightness(baseColor, 0.94, 0.55),
    );
  }

  factory ColorVariant.dark(Color baseColor) {
    return ColorVariant(
      veryLight: _adjustLightness(baseColor, 0.1, 0.9),
      light: _adjustLightness(baseColor, 0.16, 0.88),
      soft: _adjustLightness(baseColor, 0.28, 0.87),
      // base: _adjustLightness(baseColor, 0.15, 0.80),
      base: baseColor,
      bold: _adjustLightness(baseColor, 0.72, 0.55),
      deep: _adjustLightness(baseColor, 0.94, 0.55),
    );
  }

  static Color _adjustLightness(
      Color color, double targetLightness, double saturation) {
    HSLColor hsl = HSLColor.fromColor(color);
    return HSLColor.fromAHSL(
      hsl.alpha,
      hsl.hue,
      saturation,
      targetLightness,
    ).toColor();
  }

  static Map<int, Color> generateMaterialScale(Color baseColor) {
    return {
      100: _adjustLightness(baseColor, 0.95, 0.85),
      200: _adjustLightness(baseColor, 0.85, 0.85),
      300: _adjustLightness(baseColor, 0.70, 0.87),
      400: _adjustLightness(baseColor, 0.60, 0.88),
      500: baseColor,
      600: _adjustLightness(baseColor, 0.45, 0.89),
      700: _adjustLightness(baseColor, 0.35, 0.90),
      800: _adjustLightness(baseColor, 0.27, 0.90),
      900: _adjustLightness(baseColor, 0.20, 0.90),
    };
  }

  bool isColorReadable(Color backgroundColor, Color textColor) {
    return _calculateContrast(backgroundColor, textColor) >= 4.5;
  }

  static double _calculateContrast(Color color1, Color color2) {
    double luminance1 = color1.computeLuminance();
    double luminance2 = color2.computeLuminance();

    double lighter = max(luminance1, luminance2);
    double darker = min(luminance1, luminance2);

    return (lighter + 0.05) / (darker + 0.05);
  }
}

extension ColorSchemeExtension on ColorScheme {
  //PRIMARY COLOR SCHEME
  Color get primaryVeryLight =>
      ColorVariant.fromBase(primary, brightness: brightness).veryLight;
  Color get primaryLight =>
      ColorVariant.fromBase(primary, brightness: brightness).light;
  Color get primarySoft =>
      ColorVariant.fromBase(primary, brightness: brightness).soft;
  Color get primaryBase =>
      ColorVariant.fromBase(primary, brightness: brightness).base;
  Color get primaryBold =>
      ColorVariant.fromBase(primary, brightness: brightness).bold;
  Color get primaryDeep =>
      ColorVariant.fromBase(primary, brightness: brightness).deep;

  //SECONDARY COLOR SCHEME
  Color get secondaryVeryLight =>
      ColorVariant.fromBase(secondary, brightness: brightness).veryLight;
  Color get secondaryLight =>
      ColorVariant.fromBase(secondary, brightness: brightness).light;
  Color get secondarySoft =>
      ColorVariant.fromBase(secondary, brightness: brightness).soft;
  Color get secondaryBase =>
      ColorVariant.fromBase(secondary, brightness: brightness).base;
  Color get secondaryBold =>
      ColorVariant.fromBase(secondary, brightness: brightness).bold;
  Color get secondaryDeep =>
      ColorVariant.fromBase(secondary, brightness: brightness).deep;

  //TERTARY COLOR SCHEME
  Color get tertiaryVeryLight =>
      ColorVariant.fromBase(tertiary, brightness: brightness).veryLight;
  Color get tertiaryLight =>
      ColorVariant.fromBase(tertiary, brightness: brightness).light;
  Color get tertiarySoft =>
      ColorVariant.fromBase(tertiary, brightness: brightness).soft;
  Color get tertiaryBase =>
      ColorVariant.fromBase(tertiary, brightness: brightness).base;
  Color get tertiaryBold =>
      ColorVariant.fromBase(tertiary, brightness: brightness).bold;
  Color get tertiaryDeep =>
      ColorVariant.fromBase(tertiary, brightness: brightness).deep;

  //FONT COLOR SCHEME
  Color get fontColorPrimary => brightness == Brightness.light
      ? const Color(0xff050505)
      : const Color(0xffFFFFFF);
  Color get fontColorSecondary => brightness == Brightness.light
      ? const Color(0xff5B5D63)
      : const Color(0xffB7BABD);
  Color get fontColorPlaceholder => brightness == Brightness.light
      ? const Color(0xff7A7C81)
      : const Color(0xff989B9F);
  Color get fontColorDisabled => brightness == Brightness.light
      ? const Color(0xff989B9F)
      : const Color(0xff7A7C81);
  Color get fontColorOnAnccent => brightness == Brightness.light
      ? const Color(0xffFFFFFF)
      : const Color(0xff050505);

  //BACKGROUND COLOR SCHEME
  Color get backgroundColorPrimary => brightness == Brightness.light
      ? const Color(0xffFFFFFF)
      : const Color(0xff15171C);
  Color get backgroundColorSecondary => brightness == Brightness.light
      ? const Color(0xffF5F7FA)
      : const Color(0xff07070A);

  //BORDER COLOR SCHEME
  Color get borderColorPrimary => brightness == Brightness.light
      ? const Color(0xffE6E9F0)
      : const Color(0xff25272B);
  Color get borderColorSecondary => brightness == Brightness.light
      ? const Color(0xffB7BABD)
      : const Color(0xff5B5D63);

  //STATE SUCCESS COLOR SCHEME
  Color get successColorBase => const Color(0xff167C30);
  Color get successColorBaseLight => const Color(0xffE8F2EA);

  //STATE WARNING COLOR SCHEME
  Color get warningColorBase => const Color(0xffE89F05);
  Color get warningColorLight => const Color(0xffFFF7E6);

  //STATE ERROR COLOR SCHEME
  Color get errorColorBase => const Color(0xffD12727);
  Color get errorColorLight => const Color(0xffFAE9E9);

  //STATE INFO COLOR SCHEME
  Color get infoColorBase => const Color(0xff0177AD);
  Color get infoColorLight => const Color(0xffE6F1F7);
}
