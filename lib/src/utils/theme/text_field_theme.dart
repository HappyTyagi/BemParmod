import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:flutter/material.dart';

// Theme class defining InputDecorationTheme for TextFields.
class TextFieldTheme {
  // Private constructor to prevent instantiation of this class.
  TextFieldTheme._();

  // InputDecorationTheme for light theme.
  static InputDecorationTheme lightInputDecorationTheme = const InputDecorationTheme(
    // Border style for enabled state TextField in light theme.
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorDCDCDC, width: 0.0),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    // Border style for focused state TextField in light theme.
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorDCDCDC, width: 0.0),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    // TextStyle for hint in TextField for light theme.
    hintStyle: TextStyle(
      fontSize: fontSize16,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      color: colorABABAB,
    ),
  );
}
