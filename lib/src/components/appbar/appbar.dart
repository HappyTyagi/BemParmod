import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/view/notification/notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Function to generate an AppBar widget with custom configurations.
AppBar getAppBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey, {String title = dashboard, bool isNotificationActive = false}) {
  return AppBar(
    // Sets the elevation when scrolled under.
    scrolledUnderElevation: 0,
    // IconButton to open the drawer menu.
    leading: IconButton(
      onPressed: () {
        scaffoldKey.currentState?.openDrawer(); // Opens the drawer menu.
      },
      icon: Image.asset(
        'assets/images/menu.png', // Menu icon asset.
        fit: BoxFit.cover,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          // Handles the notification icon action.
          // If isNotificationActive is true, navigate to Notifications screen.
          // Else, close the current screen (Get.back()).
          isNotificationActive ? Get.back() : Get.to(() => const Notifications());
        },
        icon: isNotificationActive
            ? Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Image.asset(
                  'assets/images/notification_selected.png', // Active notification icon asset.
                  fit: BoxFit.cover,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Image.asset(
                  'assets/images/notification.png', // Inactive notification icon asset.
                  fit: BoxFit.cover,
                ),
              ),
      )
    ],
    centerTitle: true,
    backgroundColor: Colors.transparent, // Sets transparent background for AppBar.
    title: Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium, // Applies text style from theme.
    ),
  );
}
