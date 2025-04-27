import 'dart:math';

import 'package:flutter/material.dart';

enum ColorThemeEnum {
  blueJeans('Blue Jeans'),
  green('Green'),
  red('Red'),
  defaultTheme('Default');

  final String valueKey;

  const ColorThemeEnum(this.valueKey);
}

enum ThemeModeEnum {
  light,
  dark,
  system;

  String toShortString() {
    return toString().split('.').last;
  }

  static ThemeModeEnum fromString(String? value) {
    if (value == null) return ThemeModeEnum.system;

    return ThemeModeEnum.values.firstWhere(
      (element) => element.toShortString() == value,
      orElse: () => ThemeModeEnum.system,
    );
  }
}

double _luminance(Color color) {
  double r = color.red / 255.0;
  double g = color.green / 255.0;
  double b = color.blue / 255.0;

  r = r <= 0.03928 ? r / 12.92 : pow((r + 0.055) / 1.055, 2.4).toDouble();
  g = g <= 0.03928 ? g / 12.92 : pow((g + 0.055) / 1.055, 2.4).toDouble();
  b = b <= 0.03928 ? b / 12.92 : pow((b + 0.055) / 1.055, 2.4).toDouble();

  return 0.2126 * r + 0.7152 * g + 0.0722 * b;
}

int generateRandomPrice() {
  final random = Random();
  return random.nextInt(100);
}

double contrastRatio(Color color1, Color color2) {
  double lum1 = _luminance(color1) + 0.05;
  double lum2 = _luminance(color2) + 0.05;
  return lum1 > lum2 ? lum1 / lum2 : lum2 / lum1;
}

Color getTextColor(Color backgroundColor) {
  // Warna hitam
  Color black = Colors.black;
  // Warna putih
  Color white = Colors.white;

  // Hitung rasio kontras antara warna latar belakang dengan hitam dan putih
  double contrastWithBlack = contrastRatio(backgroundColor, black);
  double contrastWithWhite = contrastRatio(backgroundColor, white);

  // Pilih warna teks berdasarkan rasio kontras yang lebih tinggi
  return contrastWithBlack > contrastWithWhite ? black : white;
}
