import 'package:bem/src/services/logger/logging_service.dart';
import 'package:bem/src/services/web_service/app_url.dart';
import 'package:bem/src/services/web_service/network_api_services.dart';
import 'package:bem/src/utils/shared_preference_helper.dart';

///Service class for last parcel api call
class LastParcelService {
  // Instace defined
  final _apiService = NetworkApiServices();
  final _urlBuilder = URLBuilder();

  // Fetches last parcel details from the API
  Future<dynamic>? fetchLastParcelDetails() async {
    // Get the URL for fetching menu details
    String url = await _urlBuilder.getDashboardUrl();

    // Get user ID from preferences
    var userId = await getUserIdIdFromPreference();

    // Prepare data for the API request
    Map<String, String> data = {
      SessionParams.loginUserId: userId!.trim(),
    };

    // Make API call to get dashboard details
    dynamic response = await _apiService.getApiData(data, url, isTokenRequired: true);

    LoggingService.logDebug('Last Parcel Service: $response');

    return response; // Return the list of MenuRM objects
  }
}
