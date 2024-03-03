import 'package:al_sadeem_app/core/config/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resources/resources.dart';

class AppThemeManager {
  const AppThemeManager._();

  static ValueNotifier<bool> darkModeEnabled = ValueNotifier(false);
  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarIconBrightness: themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
  }

  static ButtonStyle elevatedButtonStyleTheme({
    required Color buttonColor,
    required Color textColor,
    Color? buttonColorPressed,
    Color? textColorPressed,
  }) {
    return ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(TextStylesManager.cairoMedium.copyWith(fontSize: FontSize.s16)),
      shape: MaterialStateProperty.all<StadiumBorder>(const StadiumBorder()),
      minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, AppSize.buttonHeight)),
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return buttonColorPressed ?? LightThemeColors.primary.withOpacity(.8);
          }
          return buttonColor;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return textColorPressed ?? textColor;
          }
          return textColor;
        },
      ),
    );
  }
}
