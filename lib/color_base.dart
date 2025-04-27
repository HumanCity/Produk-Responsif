
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:slicing_design/utils.dart';

class BasePalleteThemeColors {
  final ColorThemeEnum colorTheme;
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;

  BasePalleteThemeColors({
    required this.colorTheme,
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
  });
  factory BasePalleteThemeColors.setTemplate({
    required ColorThemeEnum colorTheme,
    Brightness brightness = Brightness.light,
  }) {
    ColorThemeTemplate colorPalette = switch (colorTheme) {
      ColorThemeEnum.blueJeans =>
        brightness == Brightness.light ? ColorThemeBlue() : ColorThemeBlue(),
      ColorThemeEnum.green =>
        brightness == Brightness.light ? ColorThemeGreen() : ColorThemeGreen(),
      ColorThemeEnum.red =>
        brightness == Brightness.light ? ColorThemeRed() : ColorThemeRed(),
      ColorThemeEnum.defaultTheme => brightness == Brightness.light
          ? ColorThemeBaseFusion()
          : ColorThemeBaseFusion(),
    };
    return BasePalleteThemeColors(
      colorTheme: colorTheme,
      primaryColor: colorPalette.primaryColor,
      secondaryColor: colorPalette.secondaryColor,
      tertiaryColor: colorPalette.tertiaryColor,
    );
  }
  ColorScheme toColorScheme({Brightness? brightness}) {
    return ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: brightness ?? Brightness.light,
      dynamicSchemeVariant: DynamicSchemeVariant.content,
      primary: primaryColor,
      tertiary: tertiaryColor,
      secondary: secondaryColor,
    );
  }
}

abstract class ColorThemeTemplate {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;

  ColorThemeTemplate({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
  });
}

class ColorThemeBaseFusion extends ColorThemeTemplate {
  ColorThemeBaseFusion({
    super.primaryColor = const Color(0xff0D5EBA),
    super.secondaryColor = const Color(0xffFF6F00),
    super.tertiaryColor = const Color(0xff16A085),
  });
}

class ColorThemeBlue extends ColorThemeTemplate {
  ColorThemeBlue({
    super.primaryColor = const Color(0xff4F86E3),
    super.secondaryColor = const Color(0xffFF6F00),
    super.tertiaryColor = const Color(0xff16A085),
  });
}

class ColorThemeGreen extends ColorThemeTemplate {
  ColorThemeGreen({
    super.primaryColor = const Color(0xff4FAF68),
    super.secondaryColor = const Color(0xffE34F4F),
    super.tertiaryColor = const Color(0xff4F86E3),
  });
}

class ColorThemeRed extends ColorThemeTemplate {
  ColorThemeRed({
    super.primaryColor = const Color(0xffE34F4F),
    super.secondaryColor = const Color(0xff4F86E3),
    super.tertiaryColor = const Color(0xff4FAD72),
  });
}
