import 'package:bem/src/services/web_service/app_url.dart';
import 'package:bem/src/services/web_service/network_api_services.dart';
import 'package:bem/src/utils/shared_preference_helper.dart';

///Service class for menu api call
class MenuService {
  // Instace defined
  final _apiService = NetworkApiServices();
  final _urlBuilder = URLBuilder();

  // Fetches menu details from the API
  Future<dynamic>? fetchMenuDetails() async {
    // Get the URL for fetching menu details
    String url = await _urlBuilder.getMenuUrl();

    // Get customer product ID from preferences
    var customerProductId = await getCustomerProductIdFromPreference();

    // Get user ID from preferences
    var userId = await getUserIdIdFromPreference();

    // Prepare data for the API request
    Map<String, String> data = {
      SessionParams.loginUserId: userId!.trim(),
      SessionParams.customerProductId: customerProductId!.trim(),
    };

    // Make API call to get menu details
    dynamic response = await _apiService.getApiData(data, url, isTokenRequired: true);

    return response; // Return the list of MenuRM objects
  }
}
