import 'package:flutter/material.dart';

import '../../resources/resources.dart';
import '../extensions/all_extensions.dart';
import 'theme_manager.dart';

// Define your light theme colors
class LightThemeColors {
  const LightThemeColors._();
  // Primary Colors
  static const Color primary = Color(0xFF00516A);

  static const _primaryValue = 0xFF00141A;
  static MaterialColor primaryShade = const MaterialColor(
    _primaryValue,
    <int, Color>{
      10: Color(0xFFE5F9FF),
      20: Color(0xFFB8D6E3),
      30: Color(0xFF8AB5C5),
      40: Color(0xFF5C94A7),
      50: Color(0xFF2E7389),
      60: Color(0xFF00445A),
      70: Color(0xFF00384A),
      80: Color(0xFF002C3A),
      90: Color(0xFF00202A),
      100: Color(_primaryValue),
    },
  );

  // Secondary Colors
  static const Color secondary = Color(0xFFBF8040);

  static const _secondaryValue = 0xFFCB9762;
  static MaterialColor secondaryShades = const MaterialColor(
    _secondaryValue,
    <int, Color>{
      10: Color(0xFFF9F2EC),
      20: Color(0xFFEFDCC8),
      30: Color(0xFFDFC8B6),
      40: Color(0xFFCFB099),
      50: Color(_secondaryValue),
    },
  );

  // grey shades
  static const int _greyValue = 0xFF080808;
  static MaterialColor greyShade = const MaterialColor(
    _greyValue,
    <int, Color>{
      10: Color(0xFFF2F2F2),
      12: Color(0xFFE7E7E7),
      20: Color(0xFFDEDEDE),
      26: Color(0xFFC3C3C3),
      30: Color(0xFFB3B3B3),
      38: Color(0xFF9F9F9F),
      40: Color(0xFF8E8E8E),
      45: Color(0xFF7E7E7E),
      50: Color(0xFF727272),
      60: Color(0xFF666666),
      70: Color(0xFF393939),
      80: Color(0xFF202020),
      90: Color(0xFF101010),
      100: Color(_greyValue),
    },
  );

  // On Primary
  static const Color onPrimary = Colors.white;

  // Validation Colors:
  static const Color error = Color(0xFFFF0000);
  static const Color warning = Color(0xFFE7D215);
  static const Color success = Color(0xFF31A638);

  static const Color errorContainer = Color(0xFFFFE0E0);
  static const Color warningContainer = Color(0xFFFFF7D6);
  static const Color successContainer = Color(0xFFEDF7EE);

  // Background Color
  static const Color background = Colors.white;
  static const Color scaffoldBackground = Colors.white;
  static const Color bottomSheetBackground = Colors.white;
  static const Color dialogBackground = Colors.white;

  // Surface Colors
  static Color primaryContainer = primaryShade[20]!;
  static Color secondaryContainer = secondaryShades[20]!;
  static Color tertiaryContainer = primaryShade[40]!;
  static Color disabledContainer = greyShade[20]!;
  static Color disabledButton = greyShade[38]!;
  // validation Surface Colors

  // Text Colors
  static const Color tertiaryText = Color(0xFF2D2D2D);
  static Color hintText = greyShade[50]!;
  static Color unActive = greyShade[40]!;
  static Color tabBarText = greyShade[45]!;

  // Icons Colors
  static Color unselectedIcon = greyShade[50]!;
  static Color selectedIcon = primary;
  static Color onBackgroundIcon = greyShade[100]!;
  static Color primaryIcon = primary;

  // border Colors
  static const Color dividerColor = Color(0xFFDADADA);
  static Color border = greyShade[45]!;
  static Color disabledBorder = greyShade[50]!;
  static Color borderVariant = greyShade[26]!;
  static Color inputFieldBorder = greyShade[20]!;

  // shadow
  static Color shadowBottomSheet = Colors.black.withOpacity(0.1);
  static Color shadow = Colors.black.withOpacity(0.18);
  // gradient
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
      fontFamily: TextStylesManager.font.fontFamily,
      cardColor: LightThemeColors.disabledContainer,
      //* Card Theme *//

      //* Color Scheme
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: LightThemeColors.primary,
        onPrimary: LightThemeColors.onPrimary,
        primaryContainer: LightThemeColors.primaryContainer,
        onPrimaryContainer: const Color(0xFF001F2A),
        secondary: LightThemeColors.secondary,
        onSecondary: const Color(0xFFFFFFFF),
        secondaryContainer: LightThemeColors.secondaryContainer,
        onSecondaryContainer: const Color(0xFF2D1600),
        tertiary: const Color(0xFF006780),
        onTertiary: const Color(0xFFFFFFFF),
        tertiaryContainer: LightThemeColors.tertiaryContainer,
        onTertiaryContainer:  LightThemeColors.primaryShade[10],
        error: LightThemeColors.error,
        errorContainer: LightThemeColors.errorContainer,
        onError: const Color(0xFFFFFFFF),
        onErrorContainer: const Color(0xFF410002),
        background: const Color(0xFFF8FDFF),
        onBackground: const Color(0xFF001F25),
        surface: const Color(0xFFF8FDFF),
        onSurface: const Color(0xFF001F25),
        surfaceVariant: const Color(0xFFDCE4E9),
        onSurfaceVariant: const Color(0xFF40484C),
        outline: const Color(0xFF70787D),
        onInverseSurface: const Color(0xFFD6F6FF),
        inverseSurface: const Color(0xFF00363F),
        inversePrimary: const Color(0xFF6BD2FF),
        shadow: const Color(0xFF000000),
        // app bar on scroll color
        surfaceTint: const Color(0xFFFFFFFF),
        outlineVariant: const Color(0xFFC0C8CD),
        scrim: const Color(0xFF000000),
      ),

      //* App Bar Theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: 0,
        backgroundColor: LightThemeColors.background,
        titleTextStyle: TextStylesManager.font.copyWith(fontSize: FontSize.s20),
        iconTheme: IconThemeData(color: LightThemeColors.onBackgroundIcon),
      ),

      //* Text Theme
      textTheme: TextTheme(
        // Display
        displayLarge: TextStylesManager.font.copyWith(color: LightThemeColors.primary),
        displayMedium: TextStylesManager.font.copyWith(color: LightThemeColors.primaryShade[80]),
        displaySmall: TextStylesManager.font.copyWith(color: LightThemeColors.tertiaryText),

        // Header
        headlineLarge: TextStylesManager.font.copyWith(color: LightThemeColors.error),
        headlineMedium: TextStylesManager.font.copyWith(color: LightThemeColors.success),
        headlineSmall: TextStylesManager.font.copyWith(color: LightThemeColors.warning),

        // Title
        titleLarge: TextStylesManager.font.copyWith(color: LightThemeColors.secondary),
        titleMedium: TextStylesManager.font.copyWith(color: LightThemeColors.greyShade),
        titleSmall: TextStylesManager.font.copyWith(color: LightThemeColors.onPrimary),

        // Body
        bodyLarge: TextStylesManager.font.copyWith(color: LightThemeColors.greyShade[50]),
        bodyMedium: TextStylesManager.font.copyWith(color: LightThemeColors.greyShade[45]),
        bodySmall: TextStylesManager.font.copyWith(color: LightThemeColors.greyShade[40]),

        // label
        labelLarge: TextStylesManager.font.copyWith(color: LightThemeColors.greyShade[38]),
        labelMedium: TextStylesManager.font.copyWith(color: LightThemeColors.greyShade[30]),
        labelSmall: TextStylesManager.font.copyWith(color: LightThemeColors.greyShade[26]),
      ),

      // Icon Theme
      iconTheme: IconThemeData(color: LightThemeColors.onBackgroundIcon),

      //*  bottomNavigationBarTheme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStylesManager.font.regular.s10.setColor(LightThemeColors.selectedIcon),
        unselectedLabelStyle: TextStylesManager.font.regular.s10.setColor(LightThemeColors.unselectedIcon),
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
          borderRadius: BorderRadius.circular(100),
        ),
        indicatorColor: Colors.transparent,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        // splashFactory: InkRipple.splashFactory,
        dividerColor: Colors.transparent,
        labelColor: LightThemeColors.onPrimary,
        unselectedLabelColor: LightThemeColors.tabBarText,
        labelStyle: TextStylesManager.font.s14.medium,
        unselectedLabelStyle: TextStylesManager.font.s14.medium.setColor(LightThemeColors.tabBarText),
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
      dividerTheme: const DividerThemeData(thickness: 1, color: LightThemeColors.dividerColor),

      expansionTileTheme: ExpansionTileThemeData(
        iconColor: LightThemeColors.onBackgroundIcon,
        textColor: LightThemeColors.greyShade,
      ),

      //* Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s16),
        hintStyle: TextStylesManager.font.regular.s14.ellipsis.setColor(LightThemeColors.hintText),
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
