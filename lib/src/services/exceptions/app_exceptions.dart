// Base exception class to handle generic exceptions
class GenericExceptions implements Exception {
  final statusCode; // Status code for the exception
  final message;

  // Constructor for the generic exception
  GenericExceptions({required this.statusCode, this.message});

  // Overrides the toString method to customize exception messages
  @override
  String toString() {
    return '$statusCode';
  }
}
