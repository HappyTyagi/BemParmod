// Helper class defining UAT and production API endpoints
import 'package:bem/src/utils/shared_preference_helper.dart';

class BaseURL {
  // Defines the UAT API endpoint
  static String uatApi = "https://q-row-mobile.bemcorp.net";

  // Defines the production API endpoint
  static String prodApi = "";
}

// Defines the different URLs used in the application
class AppUrl {
  // Base API URL
  static const String api = '/api';

  // URL for Customer endpoint
  static const String customer = '/Customer';

  // URL to fetch all customers
  static const String allCustomerUrl = '/GetAllCustomer';

  // URL for getCustomer
  static const String getCustomer = '/GetCustomer';

  // URL for login
  static const String loginUrl = '/Login';

  // URL for menu
  static const String menuUrl = '/GetCustomerProductMenu';

  //PaeceTrack resource
  static const String paeceTrack = '/Pacetrak';

  // URL for dashboard
  static const String dashboardUrl = '/Dashboard';
}

// Defines session parameters used in the application
class SessionParams {
  // Key to pass the email
  static const String email = "email";

  // Key to pass the password
  static const String password = "password";

  // Key to pass the customer ID
  static const String customerId = "CustomerId";

  // Key to pass the customer product ID
  static const String customerProductId = "CustomerProductId";

  // Key to pass the ProductId
  static const String productId = "ProductId";

  // Key to pass the LoginUserId
  static const String loginUserId = "LoginUserId";
}

// Holds client information
class ClientInformation {
  // Product Id for the ROW
  static const String productId = "531a9157-5789-4e9a-9b7a-c0ab9c7cb37c";
}

//Holds all keys
class SecurityConfiguration {
  // Encription key for shared preference
  static const String encriptionKey = "ccnMd0HlyuKrc8lHwWZKUfCMEkXd1wwO";


  //IV key
  static const String iVKey = "090FB8D1322A5920";
}

// Helper class to build specific URLs
class URLBuilder {
  URLBuilder(); // Constructor for the URLBuilder class

  // Private method to fetch the endpoint from preferences
  Future<String> _getEndPoint() async {
    var endPoint = await getBaseEndPointFromPreference(BaseURL.prodApi);
    return endPoint;
  }

  // Method to construct the URL for fetching all customers
  Future<String> getAllCustomersUrl() async {
    var endPoint = await _getEndPoint(); // Fetching the endpoint
    return endPoint + AppUrl.api + AppUrl.customer + AppUrl.allCustomerUrl; // Constructing the URL
  }

  // Method to construct the customer URL
  Future<String> getCustomerUrl() async {
    var endPoint = await _getEndPoint(); // Fetching the endpoint
    return endPoint + AppUrl.api + AppUrl.customer + AppUrl.getCustomer; // Constructing the URL
  }

  // Method to construct the login URL
  Future<String> getLoginUrl() async {
    var endPoint = await _getEndPoint(); // Fetching the endpoint
    return endPoint + AppUrl.api + AppUrl.loginUrl; // Constructing the URL
  }

  // Method to construct the menu URL
  Future<String> getMenuUrl() async {
    var endPoint = await _getEndPoint(); // Fetching the endpoint
    return endPoint + AppUrl.api + AppUrl.customer + AppUrl.menuUrl; // Constructing the URL
  }

  // Method to construct the menu URL
  Future<String> getDashboardUrl() async {
    var endPoint = await _getEndPoint(); // Fetching the endpoint
    return endPoint + AppUrl.api + AppUrl.paeceTrack + AppUrl.dashboardUrl; // Constructing the URL
  }
}
