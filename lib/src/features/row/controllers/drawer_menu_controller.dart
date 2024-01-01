import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/controllers/base_controller.dart';
import 'package:bem/src/services/logger/logging_service.dart';
import 'package:bem/src/utils/shared_preference_helper.dart';
import 'package:get/get.dart';

class DrawerMenuController extends BaseController {
  // Observable strings representing the text for each menu item
  RxString dashboardText = dashboard.obs; // Dashboard menu item text
  RxString yourProjectText = projects.obs; // Projects menu item text
  RxString parcelText = allParcels.obs; // All Parcels menu item text

  // Observable integer to track the selected menu index
  RxInt selectedMenuIndex = 0.obs;

  @override
  void onReady() {
    super.onReady();
    getMenuText();
  }

  Future<void> getMenuText() async {
    LoggingService.logDebug('call GetNemu Text');
    var dashboardLabel = await getDashboardMenuNameFromPreference();
    LoggingService.logDebug('call GetNemu Text $dashboardLabel');
    if (dashboardLabel != null && dashboardLabel.isNotEmpty) {
      dashboardText.value = dashboardLabel;
    }

    var projectLabel = await getProjectdMenuNameFromPreference();
    LoggingService.logDebug('call projectLabel Text $projectLabel');
    if (projectLabel != null && projectLabel.isNotEmpty) {
      yourProjectText.value = projectLabel;
    }

    var parcelLabel = await getParceldMenuNameFromPreference();
    LoggingService.logDebug('call parcelLabel Text $parcelLabel');
    if (parcelLabel != null && parcelLabel.isNotEmpty) {
      parcelText.value = parcelLabel;
    }
  }

  // Function to save the selected menu index and print it
  void saveMenuSelection(int index) {
    selectedMenuIndex.value = index; // Updates the selected menu index
  }
}

// Enum representing the different menu options
enum Menu { dashboard, project, parcels }
