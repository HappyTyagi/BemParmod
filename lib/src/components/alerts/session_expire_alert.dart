import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/controllers/login_controller.dart';
import 'package:bem/src/features/row/view/login/login.dart';
import 'package:bem/src/utils/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Function to show a dialog for session timeout
Future<void> showSessionExpiredDialog({String title = sessionExpireTitle, String message = sessionExpireMessage}) async {
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
              title, // Title for the dialog
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
          ],
        ),
      ),
      actions: [
        borderButton(cancel, () {
          Get.back();
        }),
        ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              menuLogout,
              style: TextStyle(fontSize: fontSize16, fontWeight: FontWeight.w600, color: colorWhite),
            ),
          ),
          onPressed: () async {
            Get.back();
            removeLoginTokenFromPreference();
            Get.delete<LoginController>();
            Get.to(() => const Login());
          },
        ),
      ],
      radius: 12.0); // Setting border radius for the dialog
}
