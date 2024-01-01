import 'package:bem/src/components/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoaderController extends GetxController {
  var isLoading = false.obs;

  void showLoader() {
    isLoading.value = true;
    showDialog(
      barrierDismissible: false,
      builder: (BuildContext context) => const LoaderDialog(),
      context: Get.overlayContext!,
    );
  }

  void hideLoader() {
    isLoading.value = false;
    Get.back();
  }
}
