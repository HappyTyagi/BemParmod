import 'dart:convert';

import 'package:bem/src/features/row/controller_service/last_parcel_service.dart';
import 'package:bem/src/features/row/controller_service/menu_service.dart';
import 'package:bem/src/features/row/controllers/base_controller.dart';
import 'package:bem/src/features/row/controllers/network_controller.dart';
import 'package:bem/src/features/row/models/responseModels/menu.dart';
import 'package:bem/src/features/row/models/responseModels/parcel_response_model.dart';
import 'package:bem/src/services/logger/logging_service.dart';
import 'package:bem/src/utils/shared_preference_helper.dart';
import 'package:get/get.dart';

// Controller class for dashboard business logic
class DashboardController extends BaseController {
  final _menuService = MenuService();
  // RxBool showLastParcelnUI = false.obs;
  RxList<ParcelResponseModel> parcelList = <ParcelResponseModel>[].obs;

  @override
  void onReady() {
    super.onReady();
    // Fetch menu text from shared preferences and update the values here
    fetchData();
  }

  Future<void> fetchData() async {
    //Check network connectivity
    var isConnected = await NetworkController().isConnectionAvailable();
    if (isConnected) {
      // Show loader before API call
      loaderController.showLoader();

      // Add all API calls here
      await getMenuDetails();

      await getDashboardDetails();

      // Hide loader after all API calls are done
      loaderController.hideLoader();
    }
  }

  Future<void> getMenuDetails() async {
    LoggingService.remoteLog('Dashboard Controller:GetMenuDetails');
    try {
      // Menu service api call
      var menuResponse = await _menuService.fetchMenuDetails();
      if (menuResponse != null) {
        // Decode the JSON response
        List<dynamic> mapData = json.decode(menuResponse!.toString());

        // Convert the decoded data into a list of MenuRM objects
        List<MenuRM?> menuList = mapData.map((data) => MenuRM.fromJson(data)).toList();

        for (var element in menuList) {
          LoggingService.logDebug('Dashboard menu $element');
          if (element != null) {
            LoggingService.logDebug('Dashboard menu name ${element.menuCode!}');
            switch (element.menuCode!.toLowerCase()) {
              case 'dashboard':
                LoggingService.logDebug('Save menu Dashboard : ${element.menuCode!}');
                saveMenuNameDashboardInPreference(element.menuName!);
                break;
              case 'project':
                LoggingService.logDebug('Save menu project : ${element.menuCode!}');
                saveMenuNameProjectInPreference(element.menuName!);
                break;
              case 'parcel':
                LoggingService.logDebug('Save menu parcel : ${element.menuCode!}');
                saveMenuNameParcelInPreference(element.menuName!);
                break;
              default:
            }
          }
        }
      }
    } catch (e) {
      LoggingService.logDebug(e);
      LoggingService.remoteLog('Dashboard Controller:GetMenuDetails:Exception $e');
    }
  }

  Future<void> getDashboardDetails() async {
    final lastParcelService = LastParcelService();
    try {
      var lastParcelDetails = await lastParcelService.fetchLastParcelDetails();
      if (lastParcelDetails != null) {
        // showLastParcelnUI.value = true;

        List<dynamic> mapData = json.decode(lastParcelDetails!.toString());
        LoggingService.logDebug('Map Data = $mapData');

        // Convert the decoded data into a list of MenuRM objects
        List<ParcelResponseModel> list = mapData.map((data) => ParcelResponseModel.fromJson(data)).toList();

        parcelList.value = list;
        LoggingService.logDebug('Map Data = $list');
      }
    } catch (e) {
      LoggingService.logDebug('Dashboard Controller:getDashboardDetails:Exception caught');
      handleException(e);
      print(e);
    }
  }
}
