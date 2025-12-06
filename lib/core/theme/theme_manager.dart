// ignore_for_file: deprecated_member_use
import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorManager.background,
    colorScheme: const ColorScheme.dark(
      primary: ColorManager.primary,
      secondary: ColorManager.secondary,
      background: ColorManager.background,
      surface: ColorManager.surface,
      error: ColorManager.error,
      onPrimary: ColorManager.background,
      onSecondary: ColorManager.background,
      onSurface: ColorManager.textPrimary,
      onBackground: ColorManager.textPrimary,
      onError: ColorManager.textPrimary,
    ),
    /// TEXT THEME (EXPANDED)
    textTheme: TextTheme(
      // Titles in Movies App (Movie Name, Headings)
      displayLarge: GoogleFonts.roboto(
        color: ColorManager.textPrimary,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: const TextStyle(
        color: ColorManager.textPrimary,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: GoogleFonts.roboto(
        color: ColorManager.textPrimary,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),

      // Section Titles (Popular Movies, Trending)
      headlineLarge: const TextStyle(
        color: ColorManager.textPrimary,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: const TextStyle(
        color: ColorManager.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: const TextStyle(
        color: ColorManager.textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),

      // Body Text (Descriptions, Movie summaries)
        bodyLarge: GoogleFonts.roboto(
        color: ColorManager.textPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      ),
      bodyMedium: const TextStyle(
        color: ColorManager.textSecondary,
        fontSize: 14,
      ),
      bodySmall: const TextStyle(
        color: ColorManager.textSecondary,
        fontSize: 12,
      ),

      // Button Text
      labelLarge: const TextStyle(
        color: ColorManager.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),

      // Small labels (genre badges, tab labels)
      labelMedium: const TextStyle(
        color: ColorManager.textSecondary,
        fontSize: 13,
      ),
      labelSmall: const TextStyle(
        color: ColorManager.textSecondary,
        fontSize: 11,
      ),
    ),
    /// APPBAR
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.background,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: ColorManager.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: ColorManager.textPrimary),
    ),
    /// BUTTON TYPES
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: ColorManager.secondary,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorManager.primary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        side: const BorderSide(color: ColorManager.primary, width: 1.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorManager.primary,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(ColorManager.textPrimary),
        iconSize: WidgetStatePropertyAll(24),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorManager.primary,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
    ),
    ///text form decoration
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: ColorManager.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: ColorManager.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: ColorManager.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: ColorManager.error),
      ),
      hintStyle: const TextStyle(color: ColorManager.textSecondary),
      labelStyle: const TextStyle(color: ColorManager.textSecondary),
    ),
  ///card
    cardTheme: CardThemeData(
      color: ColorManager.surface,
      margin: const EdgeInsets.all(12),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: ColorManager.border),
      ),
    ),
    ///botttom Navigation
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.surface,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.textSecondary,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 10,
    ),
  );
}
