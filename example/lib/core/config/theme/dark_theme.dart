import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Define your dark theme colors
class DarkThemeColors {
  const DarkThemeColors._();
  // Primary Colors

  // Background Color

  // Surface Colors

  // Accent Colors

  // Text Colors

  // Validation Colors:

  // Icons Colors

  // border Colors

  // shadow

  // gradient
}

class LightTheme {
  static ThemeData getTheme() => ThemeData(
        //* Dark Theme
        useMaterial3: true,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
        //* Card Theme *//

        //* Color Scheme
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.blue,
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
          error: Colors.red,
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
          surfaceTint: Color(0xFF9C423A),
          outlineVariant: Color(0xFFD8C2BF),
          scrim: Color(0xFF000000),
        ),

        //* App Bar Theme

        //* Text Theme
        textTheme: TextTheme(
            // Display

            // Header

            // Title

            // Body Text

            // Subtitle
            ),

        //*  bottomNavigationBarTheme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(),

        //* Bottom Sheet Theme
        bottomSheetTheme: BottomSheetThemeData(),

        //* Tab Bar Theme
        tabBarTheme: TabBarTheme(),

        //* ElevatedButtonThemeData
        elevatedButtonTheme: ElevatedButtonThemeData(),

        //* TextButtonThemeData
        textButtonTheme: TextButtonThemeData(),

        //* dividerTheme
        dividerTheme: const DividerThemeData(),

        //* Input Decoration Theme
        inputDecorationTheme: InputDecorationTheme(),
      );
}
