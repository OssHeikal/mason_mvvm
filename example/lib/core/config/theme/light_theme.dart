import 'package:al_sadeem_app/core/config/extensions/all_extensions.dart';
import 'package:al_sadeem_app/core/config/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/resources.dart';

// Define your light theme colors
class LightThemeColors {
  const LightThemeColors._();
  // Primary Colors
  static const Color primary = Color(0xFF2F848B);

  // Background Color
  static const Color background = Colors.white;
  static const Color scaffoldBackground = Colors.white;
  static const Color bottomSheetBackground = Colors.white;
  static const Color dialogBackground = Colors.white;

  // Surface Colors
  static const Color primaryContainer = Color(0xFFF9F9F9);

  // Accent Colors

  // Text Colors
  static const _primaryValue = 0xFF000000;
  static MaterialColor primaryText = MaterialColor(
    _primaryValue,
    <int, Color>{
      10: const Color(_primaryValue).withOpacity(0.1),
      20: const Color(_primaryValue).withOpacity(0.2),
      30: const Color(_primaryValue).withOpacity(0.3),
      40: const Color(_primaryValue).withOpacity(0.4),
      50: const Color(_primaryValue).withOpacity(0.5),
      60: const Color(_primaryValue).withOpacity(0.6),
      70: const Color(_primaryValue).withOpacity(0.7),
      80: const Color(_primaryValue).withOpacity(0.8),
      90: const Color(_primaryValue).withOpacity(0.9),
      100: const Color(_primaryValue),
    },
  );

  static const secondaryText = Color(0xFF616161);

  static const onPrimaryValue = 0xFFFFFFFF;
  static MaterialColor onPrimary = MaterialColor(
    onPrimaryValue,
    <int, Color>{
      10: const Color(onPrimaryValue).withOpacity(0.1),
      20: const Color(onPrimaryValue).withOpacity(0.2),
      30: const Color(onPrimaryValue).withOpacity(0.3),
      40: const Color(onPrimaryValue).withOpacity(0.4),
      50: const Color(onPrimaryValue).withOpacity(0.5),
      60: const Color(onPrimaryValue).withOpacity(0.6),
      70: const Color(onPrimaryValue).withOpacity(0.7),
      80: const Color(onPrimaryValue).withOpacity(0.8),
      90: const Color(onPrimaryValue).withOpacity(0.9),
      100: const Color(onPrimaryValue),
    },
  );

  static Color hintText = primaryText[30]!;

  // Validation Colors:
  static const Color error = Color(0xFFD22F27);
  static const Color success = Color(0xFFAA7D49);

  // Icons Colors
  static Color unselectedIcon = primaryText[70]!;
  static Color selectedIcon = primary;

  // border Colors
  static Color border = primaryText[30]!;
  static Color inputFieldBorder = primaryText[20]!;
  static Color borderVariant = const Color(0xFFD4DDE0).withOpacity(0.6);

  // shadow
  static Color shadowBottomSheet = Colors.black.withOpacity(0.5);
  static Color shadow = Colors.black.withOpacity(0.2);

  // gradient
  static const List<Color> gradientPrimary = [Color(0xFF262A2E), Color(0xFF131313)];
}

class LightTheme {
  static ThemeData getTheme() {
    AppThemeManager.setStatusBarAndNavigationBarColors(ThemeMode.light);
    return ThemeData(
      //* Light Theme
      scaffoldBackgroundColor: LightThemeColors.scaffoldBackground,
      useMaterial3: true,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: GoogleFonts.cairo().fontFamily,
      cardColor: LightThemeColors.primaryContainer,
      //* Card Theme *//

      //* Color Scheme
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: LightThemeColors.primary,
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFFFDAD6),
        onPrimaryContainer: Color(0xFF410002),
        secondary: Color(0xFF00629E),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFCFE5FF),
        onSecondaryContainer: Color(0xFF001D34),
        tertiary: Color(0xFF9C423A),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFFFFDAD6),
        onTertiaryContainer: Color(0xFF410002),
        error: LightThemeColors.error,
        errorContainer: Color(0xFFFFDAD6),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410002),
        background: Color(0xFFF8FDFF),
        onBackground: Color(0xFF001F25),
        surface: Color(0xFFF8FDFF),
        onSurface: Color(0xFF001F25),
        surfaceVariant: Color(0xFFF5DDDA),
        onSurfaceVariant: Color(0xFF534341),
        outline: Color(0xFF857371),
        onInverseSurface: Color(0xFFD6F6FF),
        inverseSurface: Color(0xFF00363F),
        inversePrimary: Color(0xFFFFB4AB),
        shadow: Color(0xFF000000),
        // app bar color on scroll
        surfaceTint: Color(0xFFFFFFFF),
        outlineVariant: Color(0xFFD8C2BF),
        scrim: Color(0xFF000000),
      ),

      //* App Bar Theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: 0,
        backgroundColor: LightThemeColors.background,
        titleTextStyle: TextStylesManager.cairoSemiBold.copyWith(fontSize: FontSize.s20),
        iconTheme: IconThemeData(color: LightThemeColors.primaryText),
      ),

      //* Text Theme
      textTheme: TextTheme(
        // Display
        displayLarge: TextStylesManager.cairo.copyWith(color: LightThemeColors.primary),

        // Header
        headlineLarge: TextStylesManager.cairo.copyWith(color: LightThemeColors.onPrimary),
        headlineMedium: TextStylesManager.cairo.copyWith(color: LightThemeColors.onPrimary[70]),
        headlineSmall: TextStylesManager.cairo.copyWith(color: LightThemeColors.onPrimary[50]),

        // Title
        titleLarge: TextStylesManager.cairo.copyWith(color: LightThemeColors.primaryText),
        titleMedium: TextStylesManager.cairo.copyWith(color: LightThemeColors.primaryText[70]),
        titleSmall: TextStylesManager.cairo.copyWith(color: LightThemeColors.primaryText[50]),

        // Body Text
        bodyLarge: TextStylesManager.cairo.copyWith(color: LightThemeColors.primaryText[30]),
        bodyMedium: TextStylesManager.cairo.copyWith(color: LightThemeColors.primaryText[20]),
        bodySmall: TextStylesManager.cairo.copyWith(color: LightThemeColors.secondaryText),

        // label
        labelLarge: TextStylesManager.cairo.copyWith(color: LightThemeColors.success),
        labelMedium: TextStylesManager.cairo.copyWith(color: LightThemeColors.error),
      ),

      //*  bottomNavigationBarTheme        //*  bottomNavigationBarTheme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStylesManager.cairo.regular.s10.setColor(LightThemeColors.selectedIcon),
        unselectedLabelStyle: TextStylesManager.cairo.regular.s10.setColor(LightThemeColors.unselectedIcon),
        backgroundColor: LightThemeColors.background,
        selectedItemColor: LightThemeColors.selectedIcon,
        unselectedItemColor: LightThemeColors.unselectedIcon,
      ),

      //* Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: LightThemeColors.bottomSheetBackground,
        elevation: 0,
      ),

      //* Tab Bar Theme
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: LightThemeColors.primary,
          borderRadius: BorderRadius.circular(AppSize.mainRadius),
        ),
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        labelColor: LightThemeColors.onPrimary,
        unselectedLabelColor: LightThemeColors.primaryText,
        labelStyle: TextStylesManager.cairo.s16,
        unselectedLabelStyle: TextStylesManager.cairo.s16,
      ),

      //* ElevatedButtonThemeData
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppThemeManager.elevatedButtonStyleTheme(
          buttonColor: LightThemeColors.primary,
          textColor: LightThemeColors.onPrimary,
        ),
      ),

      //* TextButtonThemeData
      textButtonTheme: const TextButtonThemeData(),

      //* dividerTheme
      dividerTheme: DividerThemeData(
        thickness: 1,
        color: LightThemeColors.inputFieldBorder,
      ),

      expansionTileTheme: ExpansionTileThemeData(
        iconColor: LightThemeColors.primaryText,
        textColor: LightThemeColors.primaryText,
      ),

      //* Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s16),
        hintStyle: TextStylesManager.cairo.regular.s16.ellipsis.setColor(LightThemeColors.hintText),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
          borderSide: BorderSide(color: LightThemeColors.inputFieldBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: LightThemeColors.primaryContainer,
      ),
    );
  }
}
