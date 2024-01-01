import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/controllers/login_controller.dart';
import 'package:bem/src/features/row/view/login/login.dart';
import 'package:bem/src/utils/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Show the logout alert.
/// @param context - build context
///
Future<void> showLogoutAlert(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user.dart must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
        backgroundColor: Colors.white,
        contentPadding: const EdgeInsets.all(28),
        actionsAlignment: MainAxisAlignment.spaceAround,
        title: Text(
          logoutTitle,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: color2E2E2E),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                logoutMessage,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color2E2E2E),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          borderButton(logoutCancel, () {
            Get.back();
          }),
          ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                logoutYes,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: colorWhite),
              ),
            ),
            onPressed: () {
              removeLoginTokenFromPreference();
              removeRememberMeInPreference();
              Get.delete<LoginController>();
              Get.to(() => const Login());
            },
          ),
        ],
      );
    },
  );
}

/// Show the offline toast message for network change.
void showOfflineSnackBar() {
  Get.rawSnackbar(
      messageText: const Text(
        offlineMessage,
        style: TextStyle(color: colorWhite, fontSize: 14),
      ),
      isDismissible: false,
      backgroundColor: color262D33,
      icon: const Icon(
        Icons.wifi_off,
        color: colorWhite,
      ),
      margin: EdgeInsets.zero,
      snackStyle: SnackStyle.GROUNDED);
}

/// Show the online toast message for network change.
void showOnlineSnackBar() {
  Get.rawSnackbar(
      messageText: const Text(
        onlineMessage,
        style: TextStyle(color: colorWhite, fontSize: 14),
      ),
      isDismissible: false,
      backgroundColor: Colors.green,
      icon: const Icon(
        Icons.wifi_off,
        color: colorWhite,
      ),
      margin: EdgeInsets.zero,
      snackStyle: SnackStyle.GROUNDED);
}
