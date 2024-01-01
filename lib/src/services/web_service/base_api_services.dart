// Abstract class defining the base structure for API services.
abstract class BaseApiServices {
  // Function to perform a GET request.
  Future<dynamic> getApi(String url);

  // Function to perform a POST request.
  Future<dynamic> postApi(dynamic data, String url);

  // Function to perform a GET request with body.
  Future<dynamic> getApiData(dynamic data, String url, {bool isTokenRequired = true});
}
