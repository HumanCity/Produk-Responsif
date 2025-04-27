import 'package:component_v1/extension/textstyle_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_design/color_base.dart';
import 'package:slicing_design/color_scheme.dart';
import 'package:slicing_design/utils.dart';

class ThemeConfig {
  ThemeData setTheme({
    required ColorThemeEnum colorTheme,
    Brightness brightness = Brightness.light,
    required String fontFamily,
  }) {
    return _getTheme(
      base: ThemeData(
        brightness: brightness,
        colorScheme: BasePalleteThemeColors.setTemplate(
                colorTheme: colorTheme, brightness: brightness)
            .toColorScheme(brightness: brightness),
        textTheme: GoogleFonts.getTextTheme(
          fontFamily,
          Typography.material2021()
              .englishLike
              .merge(Typography.material2021().white),
        ),
      ),
    );
  }
}

ThemeData _getTheme({
  required ThemeData base,
}) {
  return base.copyWith(
    textTheme: base.textTheme
        .copyWith(
            // titleLarge: base.textTheme.titleLarge?.copyWith(letterSpacing: 0),
            // titleMedium: base.textTheme.titleMedium?.copyWith(letterSpacing: 0),
            // titleSmall: base.textTheme.titleSmall?.copyWith(letterSpacing: 0),
            // bodyLarge: base.textTheme.bodyLarge?.copyWith(letterSpacing: 0),
            // bodyMedium: base.textTheme.bodyMedium?.copyWith(letterSpacing: 0),
            // bodySmall: base.textTheme.bodySmall?.copyWith(letterSpacing: 0),
            // labelLarge: base.textTheme.labelLarge?.copyWith(letterSpacing: 0),
            // labelMedium: base.textTheme.labelMedium?.copyWith(letterSpacing: 0),
            // labelSmall: base.textTheme.labelSmall?.copyWith(letterSpacing: 0),
            // displayLarge: base.textTheme.displayLarge?.copyWith(letterSpacing: 0),
            // displayMedium: base.textTheme.displayMedium?.copyWith(letterSpacing: 0),
            // displaySmall: base.textTheme.displaySmall?.copyWith(letterSpacing: 0),
            )
        .apply(
          bodyColor: base.colorScheme.fontColorPrimary,
          displayColor: base.colorScheme.fontColorPrimary,
        ),
    primaryColor: base.colorScheme.primary,
    colorScheme: base.colorScheme.copyWith(
      outline: base.colorScheme.borderColorPrimary,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return base.colorScheme.primary;
        } else if (states.contains(WidgetState.disabled)) {
          return null;
        } else {
          return base.colorScheme.outlineVariant;
        }
      }),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    ),
    cardTheme: CardTheme(
      color: base.colorScheme.backgroundColorPrimary,
      surfaceTintColor: base.colorScheme.backgroundColorPrimary,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: base.colorScheme.outline, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: base.colorScheme.backgroundColorPrimary,
      surfaceTintColor: base.colorScheme.backgroundColorPrimary,
      elevation: 8,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: base.colorScheme.backgroundColorPrimary,
      dragHandleSize: const Size(52, 6),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      dragHandleColor: base.colorScheme.borderColorPrimary,
    ),
    dialogTheme: DialogTheme(
      titleTextStyle: base.textTheme.titleMedium.boldStyle
          .copyWith(color: base.colorScheme.fontColorPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      side: BorderSide(
        color: base.colorScheme.borderColorPrimary,
        width: 1,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
    ),
    tooltipTheme: const TooltipThemeData(
      margin: EdgeInsets.symmetric(horizontal: 20),
      triggerMode: TooltipTriggerMode.longPress,
    ),
    appBarTheme: base.appBarTheme.copyWith(
      backgroundColor: base.colorScheme.backgroundColorPrimary,
      centerTitle: true,
      scrolledUnderElevation: 0,
      foregroundColor: base.colorScheme.fontColorPrimary,
      toolbarHeight: 60,
      titleTextStyle: base.textTheme.titleLarge?.boldStyle,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      padding: EdgeInsets.zero,
      shape: CircularNotchedRectangle(),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: base.colorScheme.backgroundColorPrimary,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      // selectedLabelStyle: base.textTheme.labelSmall,
      // unselectedLabelStyle: base.textTheme.bodyMedium,
      selectedItemColor: base.colorScheme.primaryBase,
      unselectedItemColor: base.colorScheme.fontColorPlaceholder,
      // elevation: 8,
    ),
    listTileTheme: ListTileThemeData(
      // tileColor: base.colorScheme.primary,
      iconColor: base.colorScheme.fontColorSecondary,
    ),
    scaffoldBackgroundColor: base.colorScheme.backgroundColorPrimary,
    iconTheme: IconThemeData(color: base.colorScheme.fontColorSecondary),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      hintStyle: base.textTheme.bodyMedium?.copyWith(
        color: base.colorScheme.fontColorPlaceholder,
      ),
      suffixIconColor: base.colorScheme.fontColorPlaceholder,
      prefixIconColor: base.colorScheme.fontColorPlaceholder,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      helperStyle: base.textTheme.bodyMedium?.copyWith(
        color: base.colorScheme.primary,
      ),
      labelStyle: base.textTheme.bodyMedium?.copyWith(
        color: base.colorScheme.fontColorPrimary,
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: base.colorScheme.borderColorPrimary)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: base.colorScheme.borderColorPrimary)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: base.colorScheme.borderColorPrimary)),
      fillColor: base.colorScheme.backgroundColorPrimary,
      filled: true,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return base.colorScheme.primary;
        } else if (states.contains(WidgetState.disabled)) {
          return null;
        } else {
          return base.colorScheme.outline;
        }
      }),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        // minimumSize: const Size(double.infinity, 50),
        side: BorderSide(color: base.colorScheme.borderColorPrimary),
        textStyle:
            base.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        iconColor: ColorScheme.fromSeed(
          seedColor: base.colorScheme.primary,
        ).fontColorPrimary,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: base.colorScheme.primary,
        foregroundColor: base.colorScheme.fontColorOnAnccent,
        textStyle:
            base.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        surfaceTintColor: base.colorScheme.primary,
        backgroundColor: base.colorScheme.primary,
        foregroundColor: base.colorScheme.fontColorOnAnccent,
        minimumSize: const Size(double.infinity, 50),
        textStyle:
            base.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        minimumSize: const Size(double.infinity, 50),
        textStyle:
            base.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: base.colorScheme.primary,
      foregroundColor: base.colorScheme.fontColorOnAnccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(
          color: base.colorScheme.fontColorPrimary,
          width: 3,
        ),
      ),
      labelColor: base.colorScheme.fontColorPrimary,
      dividerColor: Colors.transparent,
    ),
  );
}
