import 'dart:async';

import 'package:bem/src/components/alerts/alerts.dart';
import 'package:bem/src/services/logger/logging_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) async {
    LoggingService.logDebug('Connection status = $connectivityResult');
    if (connectivityResult == ConnectivityResult.none) {
      showOfflineSnackBar();
    } else {
      // showOnlineSnackBar();
    }
  }

  Future<bool> isConnectionAvailable() async {
    late ConnectivityResult result;
    var isDeviceConnected = false;
    try {
      result = await Connectivity().checkConnectivity();
      if (result != ConnectivityResult.none) {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
      }
    } on PlatformException catch (e) {
      LoggingService.logDebug('Couldn\'t check connectivity status');
      return Future<bool>.value(false);
    }

    return Future<bool>.value(isDeviceConnected);
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
