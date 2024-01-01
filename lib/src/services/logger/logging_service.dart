import 'package:flutter/material.dart';

// LoggingService class to handle remote and console logs.
class LoggingService {
  // Function to log a message remotely and in the console.
  static void remoteLog(Object? message, {int lineNumber = 0, String? callerClassName = ''}) {
    // Print logs remotely.
    _printRemoteLogs(message, lineNumber, callerClassName);
    // Print logs in the console.
    _printConsoleLogs(message, lineNumber, callerClassName);
  }

  // Function to log a debug message in the console.
  static void logDebug(Object? message, {int lineNumber = 0, String? callerClassName = ''}) {
    // Print debug logs in the console.
    _printConsoleLogs(message, lineNumber, callerClassName);
  }

  // Private function to print logs remotely.
  static _printRemoteLogs(Object? message, int lineNumber, String? callerClassName) {
    // Placeholder function for printing logs remotely.
  }

  // Private function to print logs in the console.
  static _printConsoleLogs(Object? message, int lineNumber, String? callerClassName) {
    // debugPrint('Log Message  ------------------ START ------------------ $callerClassName');
    debugPrint('Log Message : $message');
    // debugPrint('Log Message  ------------------- END -------------------');
  }
}
