import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bem/src/services/exceptions/app_exceptions.dart';
import 'package:bem/src/services/logger/logging_service.dart';
import 'package:bem/src/services/web_service/base_api_services.dart';
import 'package:bem/src/utils/shared_preference_helper.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  // Function to initialize default headers including Authorization token if required
  Future<Map<String, String>> initDefaultHeaders(bool isTokenRequired) async {
    String? token = '';

    // Get the token if required
    if (isTokenRequired) {
      token = await getLoginTokenFromPreference();
    }

    // Set default headers
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    // Add Authorization header if token is available and required
    if (isTokenRequired && token != null) {
      headers[HttpHeaders.authorizationHeader] = "Bearer $token";
    }

    return headers;
  }

  // Overrides the getApi method inherited from BaseApiServices.
  @override
  Future<dynamic> getApi(String url, {bool isTokenRequired = true}) async {
    // Logging the API call.
    LoggingService.remoteLog('NetworkApiServices:GetApi');
    LoggingService.logDebug('NetworkApiServices:GetApi: URL = $url');

    dynamic responseJson;

    // Initialize default headers for the request.
    var headers = await initDefaultHeaders(isTokenRequired);
    LoggingService.logDebug('NetworkApiServices:GetApi: headers = $headers');

    // Make the GET request and handle the response.
    final response = await http.get(Uri.parse(url), headers: headers).timeout(const Duration(seconds: 30));
    responseJson = validateResponseStatus(response);

    // Log the received response.
    LoggingService.remoteLog('NetworkApiServices:GetApi:Response Received');
    LoggingService.logDebug('Get Response = $responseJson');

    // Return the response.
    return responseJson;
  }

  // Overrides the getApi method inherited from BaseApiServices.
  @override
  Future<dynamic> getApiData(dynamic data, String url, {bool isTokenRequired = true}) async {
    // Logging the API call.
    LoggingService.remoteLog('NetworkApiServices:GetApi');
    LoggingService.logDebug('NetworkApiServices:GetApi: URL = $url');
    LoggingService.logDebug('NetworkApiServices:GetApi: data = $data');

    dynamic responseJson;
    try {
      // Initialize default headers for the request.
      var headers = await initDefaultHeaders(isTokenRequired);
      LoggingService.logDebug('NetworkApiServices:GetApi: headers = $headers');

      var request = http.Request('GET', Uri.parse(url));
      request.body = json.encode(data);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      LoggingService.logDebug('NetworkApiServices:GetApi: response = $response');

      LoggingService.remoteLog('NetworkApiServices:GetApiData:API call completed');

      if (response.statusCode == 200) {
        responseJson = await response.stream.bytesToString();
      } else {
        throw GenericExceptions(statusCode: response.statusCode);
      }
    } catch (e) {
      LoggingService.logDebug('NetworkApiServices:Exception: $e');
      LoggingService.logDebug('NetworkApiServices:Throw Generic Exception');
      throw GenericExceptions(statusCode: e);
    }
    // Log the received response.
    LoggingService.remoteLog('NetworkApiServices:GetApi:Response Received');
    LoggingService.logDebug('Get Response = $responseJson');

    // Return the response.
    return responseJson;
  }

// Overrides the postApi method inherited from BaseApiServices.
  @override
  Future<dynamic> postApi(dynamic data, String url, {bool isTokenRequired = true}) async {
    // Logging the POST request details.
    LoggingService.logDebug('Post url = $url');
    LoggingService.logDebug('Data = $data');

    dynamic responseJson;

    // Prepare headers for the POST request.
    var headers = await initDefaultHeaders(isTokenRequired);
    LoggingService.logDebug('Header = $headers');

    // Perform the POST request and handle the response.
    var response = await http.post(Uri.parse(url), body: jsonEncode(data), headers: headers).timeout(const Duration(seconds: 30));

    responseJson = validateResponseStatus(response);

    // Log the received response.
    LoggingService.remoteLog('NetworkApiServices:postApi:Response Received');
    LoggingService.logDebug('Post Response = $responseJson');

    // Return the response.
    return responseJson;
  }

  // Function to validate the response status and handle different status codes
  // Validates the HTTP response status and processes it accordingly.
  dynamic validateResponseStatus(http.Response response) {
    LoggingService.logDebug('validare response');

    // Extracting the response status code.
    var statusCode = response.statusCode;
    dynamic responseJson;

    // Logging the received status code.
    LoggingService.logDebug('Response Status Code = $statusCode');

    // Handling different status code scenarios.
    switch (response.statusCode) {
      case 200:
        // For successful responses (status code 200), decode the JSON response body.
        responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        // For other status codes, throw a generic ConnectionException.
        throw GenericExceptions(statusCode: response.statusCode);
    }
  }
}
