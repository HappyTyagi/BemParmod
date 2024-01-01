import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// Function to show a dialog for connection error
Future<void> showSyncDialog(double syncPercentage, String message) async {
  // Using GetX defaultDialog to display the dialog
  return Get.defaultDialog(
      title: '', // Empty title in this case
      content: Container(
        padding: const EdgeInsets.fromLTRB(80, 24, 80, 24), // Padding for the content
        child: Column(
          children: <Widget>[
            const Image(
              image: AssetImage('assets/images/no_internet.png'), // Image for no internet connection
              height: 48,
              width: 48,
            ),
            addVerticalSpace(32), // Custom widget to add vertical space
            Text(
              message, // Title for the dialog
              style: const TextStyle(
                color: color374151,
                fontSize: fontSize18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            addVerticalSpace(16), // Custom widget to add vertical space
            SizedBox(
              width: 300,
              child: Text(
                message, // Message for the dialog
                style: const TextStyle(fontSize: fontSize16, fontWeight: FontWeight.w400, color: color2E2E2E),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            addVerticalSpace(32), // Custom widget to add vertical space
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100), // Constraint for button width
              child: borderButton(ok, () {
                Get.back(); // Dismisses the dialog when the button is pressed
              }),
            ),
          ],
        ),
      ),
      radius: 12.0); // Setting border radius for the dialog
}
