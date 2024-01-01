import 'package:bem/src/constants/app_color.dart';
import 'package:flutter/material.dart';

BoxDecoration backgroundImageDecoration() {
  return const BoxDecoration(
    image: DecorationImage(image: AssetImage("assets/images/dashboard_background.png"), fit: BoxFit.fill),
  );
}

BoxDecoration backgroundWhiteDecoration() {
  return const BoxDecoration(color: colorWhite);
}

//------ Parcel Details Screen
BoxDecoration backgroundShadow({double radius = 12}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: colorDCDCDC, //New
        blurRadius: radius,
      )
    ],
  );
}

BoxDecoration gradiantBackground() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0XFFfefeff),
        Color(0XFFfefeff),
      ],
    ),
  );
}

//Document Screen
BoxDecoration documentBorder({double radius = 16}) {
  return BoxDecoration(borderRadius: BorderRadius.circular(radius), color: Colors.white, border: Border.all(width: 1, color: colorDCDCDC));
}

BoxDecoration lightBlueBorder() {
  return BoxDecoration(borderRadius: BorderRadius.circular(8), color: colorECF1FF);
}

InputDecorationTheme dropdownBorderTheme() {
  return const InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: colorEBEBEB, width: 1.0),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorEBEBEB, width: 1.0),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
  );
}

// -- parcel details file --
BoxDecoration greyBorderWithShadow({double radius = 16}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: Colors.white,
    border: Border.all(width: 1, color: colorDCDCDC),
    boxShadow: [
      BoxShadow(
        color: colorDCDCDC, //New
        blurRadius: radius,
      )
    ],
  );
}

BoxDecoration whiteContainer({double radius = 20}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: colorF4F4F4, // Shadow color
        blurRadius: radius, // Blur radius for the shadow effect (applied as elevation)
        offset: const Offset(0, 2), // Offset of the shadow
      ),
    ],
  );
}

OutlineInputBorder textOutLineBorder({double radius = 12}) {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(radius),
  );
}

BoxDecoration textBorder({double radius = 16}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(width: 1, color: colorDCDCDC),
  );
}

InputDecoration textInputDecoration(String hintText, {double padding = 8, double radius = 8}) {
  return InputDecoration(
    hintText: hintText,
    contentPadding: EdgeInsets.all(padding),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: colorDCDCDC,
        ),
        borderRadius: BorderRadius.all(Radius.circular(radius))),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: colorDCDCDC,
        ),
        borderRadius: BorderRadius.all(Radius.circular(radius))),
    errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12))),
    focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.all(Radius.circular(12))),
    counterText: '',
  );
}
