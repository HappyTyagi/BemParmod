import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Future<void> showNoInternetAlert({String title = internetNotAvailable, String message = internetMessage}) async {
  return Get.defaultDialog(
      title: '',
      content: Container(
        padding: const EdgeInsets.fromLTRB(80, 24, 80, 24),
        child: Column(
          children: <Widget>[
            const Image(
              image: AssetImage('assets/images/no_internet.png'),
              height: 48,
              width: 48,
            ),
            addVerticalSpace(32),
            Text(
              title,
              style: const TextStyle(
                color: color374151,
                fontSize: fontSize18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            addVerticalSpace(16),
            SizedBox(
              width: 300,
              child: Text(
                message,
                style: const TextStyle(fontSize: fontSize16, fontWeight: FontWeight.w400, color: color2E2E2E),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            addVerticalSpace(32),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: borderButton(ok, () {
                Get.back();
              }),
            ),
          ],
        ),
      ),
      radius: 12.0);
}
