import 'package:bem/src/features/row/controllers/network_controller.dart';
import 'package:get/instance_manager.dart';

class NetworkInjection {
  // Initialization method for injecting NetworkController into GetX dependency management
  static void init() {
    // Putting NetworkController instance into GetX with permanent set to true for long-term availability
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
