// All package and class imports
import 'dart:convert';
import 'dart:math';

import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/services/web_service/app_url.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:encrypt/encrypt.dart' as encrypt;

// Enum representing different device types - Phone or Tablet.
enum DeviceType { Phone, Tablet }

// Function to determine the device type based on the screen size.
DeviceType getDeviceType() {
  final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
  return data.size.shortestSide < 550 ? DeviceType.Phone : DeviceType.Tablet;
}

// Function to check if the device is a tablet based on screen size.
bool isTablet() {
  final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
  return data.size.shortestSide > 550;
}

// Function to convert file size to a human-readable format.
String getFileSize(int size) {
  String s = "";
  double kb = size / 1000;
  double mb = kb / 1000;
  if (size < 1000) {
    s = "$size Bytes";
  } else if (size >= 1000 && size < (1000 * 1000)) {
    s = "${kb.toStringAsFixed(2)} KB";
  } else if (size >= (1000 * 1000) && size < (1000 * 1000 * 1000)) {
    s = "${mb.toStringAsFixed(2)} MB";
  }
  return s;
}

// Function to get the current date in the format 'dd.MM.yyyy'.
String getCurrentDate() {
  var now = DateTime.now();
  var formatter = DateFormat('dd.MM.yyyy');
  return formatter.format(now);
}

// Function to display a toast message at the bottom of the screen.
void showToast(String msg, {ToastGravity gravity = ToastGravity.BOTTOM}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: gravity,
    backgroundColor: color3A71FF,
    textColor: colorWhite,
    fontSize: 18.0,
  );
}

// Function to display an error toast message at the bottom of the screen.
void showErrorToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.red,
    textColor: colorWhite,
    fontSize: 18.0,
  );
}

// Function to format a TimeOfDay object to a string representing time.
String formatTimeOfDay(TimeOfDay tod) {
  final now = DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
  final format = DateFormat.jm();
  return format.format(dt);
}

// Function to format a DateTime object to a string in 'MM.dd.yyyy' format.
String formatedDate(DateTime now) {
  return DateFormat('MM.dd.yyyy').format(now);
}

// Function to validate an email address.
bool isValidEmail(String email) {
  return false;
}

// Function to launch an email client with pre-filled email details.
void launchEmail(String emailId) async {
  String email = Uri.encodeComponent(emailId);
  String subject = Uri.encodeComponent("Subject");
  String body = Uri.encodeComponent("Message");
  Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
  await launchUrl(mail);
}

// Function to launch a phone call.
void launchCall(String contactNumber) async {
  final call = Uri.parse('tel:$contactNumber');
  if (await canLaunchUrl(call)) {
    launchUrl(call);
  }
}

// Function to open the app store based on the platform (Android/iOS).
void openStore() {
  if (Platform.isAndroid || Platform.isIOS) {
    final appId = Platform.isAndroid ? 'YOUR_ANDROID_PACKAGE_ID' : 'YOUR_IOS_APP_ID';
    final url = Uri.parse(
      Platform.isAndroid ? "market://details?id=$appId" : "https://apps.apple.com/app/id$appId",
    );
    launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }
}

// Encrypts the provided data using AES encryption
String? getEncryptedData(String? data) {
  String? encryptedString;

  if (data != null) {
    // Encryption key and IV
    // Creating encryption key from a base64 encoded string
    final key = encrypt.Key.fromBase64(SecurityConfiguration.encriptionKey);

    // Creating IV (Initialization Vector) from a hexadecimal string
    final iv = encrypt.IV.fromBase16(SecurityConfiguration.iVKey);

    // Creating an AES encrypter with the given key and null padding
    final encrypter = encrypt.Encrypter(encrypt.AES(key, padding: null));

    // Encrypting the data using AES encryption and the provided IV
    final encrypted = encrypter.encrypt(data, iv: iv);

    // Returning null if the provided data is null
    return encrypted.base64;
  }

  return encryptedString;
}

// Decrypts the provided encrypted string using AES decryption
String? getDecryptedData(String? encryptedString) {
  if (encryptedString != null) {
    // Decryption key and IV
    final key = encrypt.Key.fromBase64(SecurityConfiguration.encriptionKey); // Creating decryption key from a base64 encoded string
    final iv = encrypt.IV.fromBase16(SecurityConfiguration.iVKey); // Creating IV (Initialization Vector) from a hexadecimal string
    final encrypter = encrypt.Encrypter(encrypt.AES(key, padding: null)); // Creating an AES encrypter with the given key and null padding

    // Decrypting the encrypted string using AES decryption and the provided IV
    final decrypted = encrypter.decrypt(encrypt.Encrypted.fromBase64(encryptedString), iv: iv);

    return decrypted; // Returning the decrypted data
  }

  return null; // Returning null if the provided encrypted string is null
}
