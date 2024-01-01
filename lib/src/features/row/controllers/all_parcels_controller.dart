import 'package:get/get.dart';

class AllParcelsController extends GetxController {
  // Observable boolean variable to track the visibility of the map
  RxBool showMap = false.obs;

  // Function triggered when the map is clicked to toggle its visibility
  onMapClick() {
    showMap.value = !showMap.value; // Toggles the value of showMap (true/false)
  }
}
