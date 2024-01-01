import 'package:bem/src/constants/app_color.dart';
import 'package:flutter/material.dart';

// Theme class to define ElevatedButton styles for the BEM application.
class BEMElevatedButtonTheme {
  // Private constructor to prevent instantiation of this class.
  BEMElevatedButtonTheme._();

  // ElevatedButtonThemeData for light theme.
  static ElevatedButtonThemeData lightElevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // Background color for elevated button in the light theme.
      backgroundColor: color3A71FF,

      // Shadow color for the elevated button in the light theme.
      shadowColor: Colors.lightBlue,

      // Elevation for the elevated button in the light theme.
      elevation: 4,

      // Shape of the elevated button in the light theme.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );

  // ElevatedButtonThemeData for dark theme.
  static ElevatedButtonThemeData darkElevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // Background color for elevated button in the dark theme.
      backgroundColor: color3A71FF,

      // Shadow color for the elevated button in the dark theme.
      shadowColor: Colors.lightBlue,

      // Elevation for the elevated button in the dark theme.
      elevation: 8,

      // Shape of the elevated button in the dark theme.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}
