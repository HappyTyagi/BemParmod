import 'package:bem/src/features/row/models/responseModels/all_customers_response_model.dart';
import 'package:bem/src/services/web_service/app_url.dart';
import 'package:bem/src/services/exceptions/app_exceptions.dart';
import 'package:bem/src/services/web_service/network_api_services.dart';
import 'package:bem/src/utils/shared_preference_helper.dart';
import 'dart:convert';

import '../models/responseModels/user.dart';

class LoginService {
  final _apiService = NetworkApiServices();
  final _urlBuilder = URLBuilder();

  Future<UserResponseModel> performLogin(String emailId, String password) async {
    String url = await _urlBuilder.getLoginUrl();

    var customerProductId = await getCustomerProductIdFromPreference();

    Map data = {SessionParams.email: emailId.trim(), SessionParams.password: password.trim(), SessionParams.customerProductId: customerProductId};

    dynamic response = await _apiService.postApi(data, url);

    // Create a UserRM object from the JSON data using the fromJson constructor
    UserResponseModel user = UserResponseModel.fromJson(response);

    return user;
  }

  Future<List<CustomersRM>?> fetchCustomers() async {
    // Fetch customer data
    String url = await _urlBuilder.getAllCustomersUrl();
    List<dynamic> response = await _apiService.getApi(url, isTokenRequired: false);

    // Map each item in the responseData list to an AllCustomersRM object using fromJson
    List<CustomersRM> customersList = response.map((json) => CustomersRM.fromJson(json)).toList();
    return customersList;
  }

  /// Fetches customer details based on the provided [customerId].
  /// Returns a Future of CustomersRM or null if the data retrieval fails.
  Future<CustomersRM?> getCustomerDetails(String customerId) async {
    // Prepare data for the API request (e.g., customer ID, product ID)
    Map<String, String> data = {SessionParams.customerId: customerId, SessionParams.productId: ClientInformation.productId};

    // Get the URL for customer details from the URL builder
    String url = await _urlBuilder.getCustomerUrl();

    // Make an API GET request using the prepared data and obtained URL
    dynamic response = await _apiService.getApiData(data, url, isTokenRequired: false);

    // Decode the JSON response to a Map<String, dynamic>
    Map<String, dynamic> mapData = json.decode(response);

    // Convert the decoded map to a CustomersRM object using its fromJson constructor
    final CustomersRM customer = CustomersRM.fromJson(mapData);

    // Return the retrieved customer details or null if the conversion fails
    return customer;
  }
}
