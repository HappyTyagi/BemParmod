// Importing the necessary network status package
import 'package:bem/src/services/web_service/network_status.dart';

// A generic class representing an API response
class ApiResponse<T> {
  // Variables to hold network status, data, and message
  NetworkStatus? status; // Network status (loading, completed, error)

  // The actual data from the API response
  T? data;

  // Any additional message related to the API call
  String? message;

  // Constructor to set status, data, and message
  ApiResponse(this.status, this.data, this.message);

  // Named constructor for a loading state
  ApiResponse.loading() : status = NetworkStatus.loading;

  // Named constructor for a completed state
  ApiResponse.completed() : status = NetworkStatus.completed;

  // Named constructor for an error state
  ApiResponse.error(this.message) : status = NetworkStatus.error;

  // Overriding the toString() method to display information about the response
  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
