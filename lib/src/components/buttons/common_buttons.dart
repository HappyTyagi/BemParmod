import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:flutter/material.dart';

/// Creates a new EditButton. #onClick ( View ) will be called when the button is clicked.
///
///
/// @return The newly created Button state object.
SizedBox editButton(final void Function()? onPressed) {
  return SizedBox(
      width: 44,
      height: 44,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color3A71FF,
          shadowColor: Colors.lightBlue,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: const Image(
          image: AssetImage('assets/images/edit.png'),
          height: 20,
          width: 20,
          color: colorWhite,
        ),
      ));
}

/// Creates a button with arrow. #onPress ( View ) will be called when the button is clicked.
///
///
/// @return The newly created Button state object.
SizedBox arrowButton(final void Function()? onPressed) {
  return SizedBox(
      width: 44,
      height: 44,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color3A71FF,
          shadowColor: Colors.lightBlue,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: const Icon(Icons.arrow_forward_ios, color: colorWhite),
      ));
}

/// Creates a button to upload document. #onPress ( View ) will be called when the button is clicked.
///
///
/// @return The newly created Button state object.
SizedBox uploadButton(final void Function()? onPressed) {
  return SizedBox(
      width: 44,
      height: 44,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color3A71FF,
          shadowColor: Colors.lightBlue,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: const Image(
          image: AssetImage('assets/images/upload.png'),
          height: 20,
          width: 20,
          color: colorWhite,
        ),
      ));
}

/// Creates a button with camera image. #onPress ( View ) will be called when the button is clicked.
///
///
/// @return The newly created Button state object.
SizedBox cameraButton(final void Function()? onPressed) {
  return SizedBox(
      width: 44,
      height: 44,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color3A71FF,
          shadowColor: Colors.lightBlue,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: const Image(
          image: AssetImage('assets/images/camera.png'),
          height: 20,
          width: 20,
          color: colorWhite,
        ),
      ));
}

/// Creates a button with audio image. #onPress ( View ) will be called when the button is clicked.
///
///
/// @return The newly created Button state object.
SizedBox audioButton(final void Function()? onPressed) {
  return SizedBox(
      width: 44,
      height: 44,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color3A71FF,
          shadowColor: Colors.lightBlue,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: const Image(
          image: AssetImage('assets/images/recording.png'),
          height: 20,
          width: 20,
          color: colorWhite,
        ),
      ));
}

/// Creates a button with document image. #onPress ( View ) will be called when the button is clicked.
///
///
/// @return The newly created Button state object.
SizedBox documentButton(final void Function()? onPressed) {
  return SizedBox(
      width: 44,
      height: 44,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color3A71FF,
          shadowColor: Colors.lightBlue,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: const Image(
          image: AssetImage('assets/images/document_solid.png'),
          height: 20,
          width: 20,
          color: colorWhite,
        ),
      ));
}

/// Creates a delete button. #onPress ( View ) will be called when the button is clicked.
///
///
/// @return The newly created Button state object.
SizedBox deleteButton(final void Function()? onPressed) {
  return SizedBox(
      width: 44,
      height: 44,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: colorF8F8F9,
          shadowColor: colorDCDCDC,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onPressed,
        child: const Image(
          image: AssetImage('assets/images/delete.png'),
          height: 24,
          width: 24,
        ),
      ));
}

/// Creates a common buttonto show text.
///
/// @param title - title to show in the button.
/// #onPress ( View ) will be called when the button is clicked.
///
/// @return The newly created Button state object.
ElevatedButton textButton(String title, final void Function()? onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      title,
      style: const TextStyle(
        fontSize: fontSize16,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        color: colorWhite,
      ),
    ),
  );
}

/// Creates a common buttonto show text.
///
/// @param title - title to show in the button.
/// #onPress ( View ) will be called when the button is clicked.
///
/// @return The newly created Button widget.
ElevatedButton iconButton(String title, final void Function()? onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      title,
      style: const TextStyle(
        fontSize: fontSize16,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        color: colorWhite,
      ),
    ),
  );
}

/// Creates a common buttonto with border.
///
/// @param title - title to show in the button.
/// #onPress ( View ) will be called when the button is clicked.
///
/// @return The newly created Button state object.
GestureDetector borderButton(String title, final void Function()? onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
      decoration: textBorder(radius: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: fontSize16,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          color: color3A71FF,
        ),
      ),
    ),
  );
}
