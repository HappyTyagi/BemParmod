import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:flutter/material.dart';

// Theme class defining TextTheme for different text styles.
class BEMTextTheme {
  // Private constructor to prevent instantiation of this class.
  BEMTextTheme._();

  // TextTheme for light theme.
  static TextTheme lightTextTheme = const TextTheme(
    // Text style for medium-sized display text in light theme.
    displayMedium: TextStyle(
      fontSize: fontSize32,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      color: color2E2E2E,
    ),

    // Text style for small-sized display text in light theme.
    displaySmall: TextStyle(
      fontSize: fontSize18,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      color: color6F6E81,
    ),

    // Text style for medium-sized headlines in light theme.
    headlineMedium: TextStyle(
      fontSize: fontSize16,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      color: colorABABAB,
    ),

    // Text style for small-sized headlines in light theme.
    headlineSmall: TextStyle(
      fontSize: fontSize18,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      color: color2E2E2E,
    ),

    // Text style for large-sized display text in light theme.
    displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w300, color: Colors.black),

    // Text style for large-sized titles in light theme.
    titleLarge: TextStyle(
      fontSize: fontSize16,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      color: color2E2E2E,
    ),

    // Text style for large-sized labels in light theme.
    labelLarge: TextStyle(fontSize: fontSize16, fontWeight: FontWeight.w800, color: colorWhite),

    // Text style for large-sized body text in light theme.
    bodyLarge: TextStyle(fontSize: fontSize16, fontWeight: FontWeight.w400, color: color2E2E2E),
    bodyMedium: TextStyle(fontSize: fontSize24, fontWeight: FontWeight.w600, color: color2E2E2E),

    // Text style for small-sized body text in light theme.
    bodySmall: TextStyle(fontSize: fontSize16, fontWeight: FontWeight.w600, color: colorBlack),

    // Text style for medium-sized titles in light theme.
    titleMedium: TextStyle(fontSize: fontSize16, fontWeight: FontWeight.w400, color: color2E2E2E),
  );

  // TextTheme for dark theme (empty in this case).
  static TextTheme darkTextTheme = TextTheme();
}
