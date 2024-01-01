import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// Function to generate an AppBar widget functioning as a back button.
AppBar getBackButton(BuildContext context, {String title = ''}) {
  return AppBar(
    // Sets a transparent background for the AppBar.
    backgroundColor: Colors.transparent,
    // Sets the elevation when scrolled under.
    scrolledUnderElevation: 0,
    // IconButton functioning as a back button using GetX's Get.back() function.
    leading: IconButton(
      onPressed: () {
        Get.back(); // Navigates back to the previous screen.
      },
      icon: Image.asset(
        'assets/images/back_button.png', // Back button icon asset.
        fit: BoxFit.cover,
      ),
    ),
    title: Text(title), // Displays the provided title as text in the AppBar.
  );
}
