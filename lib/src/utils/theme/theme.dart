import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/utils/theme/button_theme.dart';
import 'package:bem/src/utils/theme/text_field_theme.dart';
import 'package:bem/src/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';

// Class defining different themes for the application.
class AppTheme {
  // Private constructor to prevent instantiation of this class.
  AppTheme._();

  // Light theme settings.
  static ThemeData lightTheme = ThemeData(
    // Enables Material 3 design.
    useMaterial3: true,
    fontFamily: 'Montserrat',
    brightness: Brightness.light, // Light theme brightness.
    // Other theme configurations...
    tabBarTheme: TabBarTheme(
      // Configuration for the tab bar.
      dividerColor: transparent,
      indicatorColor: transparent,
      overlayColor: const MaterialStatePropertyAll(transparent),
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color3A71FF,
      ),
      labelColor: colorWhite,
      unselectedLabelColor: color494A54,
      labelStyle: const TextStyle(
        fontSize: fontSize16,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: fontSize16,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
    ),
    textTheme: BEMTextTheme.lightTextTheme, // Text theme for light mode.
    inputDecorationTheme: TextFieldTheme.lightInputDecorationTheme, // Input decoration theme for light mode.
    scaffoldBackgroundColor: colorWhite, // Scaffold background color for light mode.
    elevatedButtonTheme: BEMElevatedButtonTheme.lightElevatedButtonThemeData, // Elevated button theme for light mode.
    checkboxTheme: CheckboxThemeData(
      // Checkbox theme for light mode.
      checkColor: MaterialStateProperty.all(colorWhite),
      fillColor: MaterialStateProperty.all(colorWhite),
      side: const BorderSide(color: color6C6C6C),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
    ),
  );

  // Dark theme settings (empty in this case).
  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
