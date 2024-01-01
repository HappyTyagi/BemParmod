import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/components/dropdown/dropdown.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/controllers/login_controller.dart';
import 'package:bem/src/features/row/view/login/login.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:bem/src/utils/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showDOTChangeDialog(BuildContext context, List<String> items, String selectedDoT) {
  // Creating an Dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
        backgroundColor: Colors.white,
        contentPadding: const EdgeInsets.all(28),
        // insetPadding: EdgeInsets.all(80),
        insetPadding: EdgeInsets.zero,
        actionsAlignment: MainAxisAlignment.spaceAround,
        surfaceTintColor: colorWhite,
        title: const Text(changeDot),
        content: SizedBox(
          width: 350,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropDownList.selected(
                  mList: const ['NJT', 'IDOT', 'ODOT'],
                  title: '',
                  hint: selectDot,
                  onChanged: (value) {
                    selectedDoT = value!;
                  },
                  selectedValue: selectedDoT),
            ],
          ),
        ),
        actions: [
          borderButton(cancel, () {
            Get.back();
          }),
          ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                menuLogout,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: colorWhite),
              ),
            ),
            onPressed: () async {
              var savedDOT = await getCustomerProductIdFromPreference();
              if (selectedDoT.isNotEmpty) {
                if (savedDOT != selectedDoT) {
                  Get.back();
                  saveCustomerProductIdInPreference(selectedDoT);
                  removeLoginTokenFromPreference();
                  Get.delete<LoginController>();
                  Get.to(() => const Login());
                } else {
                  showToast('You are selecting the current DOT.');
                }
              } else {
                showToast('Please select DOT.');
              }
            },
          ),
        ],
      );
    },
  );
}
