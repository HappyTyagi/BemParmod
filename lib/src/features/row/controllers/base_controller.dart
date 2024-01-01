import 'package:bem/src/components/alerts/connection_error_alert.dart';
import 'package:bem/src/components/alerts/session_expire_alert.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/controllers/loader_controller.dart';
import 'package:bem/src/services/exceptions/app_exceptions.dart';
import 'package:bem/src/services/logger/logging_service.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

// Base Controller class to handle exceptions
class BaseController extends GetxController {
  final LoaderController loaderController = Get.find();

  void handleException(dynamic e) {
    LoggingService.remoteLog('BaseController:Handle Exception:$e');
    if (e is GenericExceptions) {
      LoggingService.remoteLog('BaseController:Generic Exception:${e.statusCode}');
      switch (e.statusCode) {
        case 404:
          // Handle 404 error
          LoggingService.remoteLog('BaseController:Handle Exception:404');

          // Show an error message or perform specific actions for 404
          showConnectionErrorDialog();
          break;
        case 400:
          // Handle 404 error
          LoggingService.remoteLog('BaseController:Handle Exception:400');

          // Show an error message or perform specific actions for 404
          showToast(invalidLogin, gravity: ToastGravity.TOP);
          break;

        case 401:
          LoggingService.remoteLog('BaseController:Handle Exception:401');
          // Handle 401 error
          LoggingService.remoteLog('BaseController:Handle Exception:401: Token Expired');

          // Show an error message or perform specific actions for 401
          showSessionExpiredDialog();
          break;

        // Add more cases for other status codes if needed
        default:
          // Handle other status codes or exceptions
          LoggingService.remoteLog('Unhandled status code: ${e.statusCode} - ${e.message}');
          // Show a generic error message or perform default actions
          break;
      }
    } else {
      // Handle other types of exceptions or errors
      LoggingService.remoteLog('Unhandled exception: $e');
      // Show a generic error message or perform default actions
    }
  }
}
