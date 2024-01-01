import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Future<void> showDeleteParcelAlert(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user.dart must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        actionsAlignment: MainAxisAlignment.spaceAround,
        title: Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Image(
              image: AssetImage('assets/images/close.png'),
              height: 24,
              width: 24,
            ),
          ),
        ),
        content: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(80, 24, 80, 24),
            // margin: EdgeInsets.only(left: 80, right: 80),
            child: ListBody(
              children: <Widget>[
                const Image(
                  image: AssetImage('assets/images/delete_orange.png'),
                  height: 48,
                  width: 48,
                ),
                addVerticalSpace(16),
                Text(
                  deleteTitle,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: color374151),
                  textAlign: TextAlign.center,
                ),
                addVerticalSpace(16),
                SizedBox(
                  width: 300,
                  child: Text(
                    deleteMessage,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                addVerticalSpace(24)
              ],
            ),
          ),
        ),
        actions: <Widget>[
          borderButton(deleteCancelButton, () {
            Get.back();
          }),
          ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                deleteYesButton,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: colorWhite),
              ),
            ),
            onPressed: () {},
          ),
        ],
      );
    },
  );
}
