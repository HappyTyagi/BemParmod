// Import necessary packages and files
import 'package:bem/src/constants/app_constants.dart'; // Importing necessary constants
import 'package:bem/src/utils/device_helper.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importing SharedPreferences package

// Retrieve login token from SharedPreferences
Future<String> getLoginTokenFromPreference() async {
  var data = await getSharedPreferenceData(SharedPreferenceConstants.keyLoginToken);
  return data ?? ''; // Return the login token or an empty string if null
}

// Save login token to SharedPreferences
void saveLoginTokenInPreference(String token) async {
  await savePreferenceData(SharedPreferenceConstants.keyLoginToken, token); // Save the login token
}

// Remove login token from SharedPreferences
void removeLoginTokenFromPreference() async {
  removePreference(SharedPreferenceConstants.keyLoginToken); // Remove the login token
}

// Retrieve Customer Product Id  from SharedPreferences
Future<String?> getCustomerProductIdFromPreference() async {
  return await getSharedPreferenceData(SharedPreferenceConstants.keyCustomerProductId); // Get CustomerProductId
}

// Save CustomerProductId to SharedPreferences
void saveCustomerProductIdInPreference(String customerProductId) async {
  // Save CustomerProductId
  await savePreferenceData(SharedPreferenceConstants.keyCustomerProductId, customerProductId);
}

// Retrieve UserId  from SharedPreferences
Future<String?> getUserIdIdFromPreference() async {
  return await getSharedPreferenceData(SharedPreferenceConstants.keyUserId); // Get UserId
}

// Save UserId to SharedPreferences
void saveUserIdInPreference(String userId) async {
  await savePreferenceData(SharedPreferenceConstants.keyUserId, userId); // Save UserId
}

// Retrieve base endpoint from SharedPreferences with a fallback default endpoint
Future<String> getBaseEndPointFromPreference(String defaultEndPoint) async {
  var environment = await getSharedPreferenceData(SharedPreferenceConstants.keyEnvironment); // Get the base endpoint
  return environment ?? defaultEndPoint; // Return the base endpoint or the default endpoint if null
}

// Save base endpoint to SharedPreferences
Future<void> saveBaseEndPointInPreference(String endPoint) async {
  await savePreferenceData(SharedPreferenceConstants.keyEnvironment, endPoint); // Save the base endpoint
}

// Save API access token to SharedPreferences
void removeRememberMeInPreference() async {
  removePreference(SharedPreferenceConstants.keyRememberMe); // Remove the Remember Me check
}

// Save menu text to SharedPreferences
void saveMenuNameDashboardInPreference(String menuText) async {
  await savePreferenceData(SharedPreferenceConstants.keyMenuDashboard, menuText); // Save the menu text for dashboard
}

// Retrieve dashboard menu name  from SharedPreferences
Future<String?> getDashboardMenuNameFromPreference() async {
  return await getSharedPreferenceData(SharedPreferenceConstants.keyMenuDashboard); // Get Menu name
}

// Save menu text to SharedPreferences
void saveMenuNameProjectInPreference(String menuText) async {
  await savePreferenceData(SharedPreferenceConstants.keyMenuProject, menuText); // Save the menu text for project
}

// Retrieve project menu name  from SharedPreferences
Future<String?> getProjectdMenuNameFromPreference() async {
  return await getSharedPreferenceData(SharedPreferenceConstants.keyMenuProject); // Get Menu name
}

// Save menu text to SharedPreferences
void saveMenuNameParcelInPreference(String menuText) async {
  await savePreferenceData(SharedPreferenceConstants.keyMenuParcel, menuText); // Save the menu text for parcel
}

// Retrieve parcel menu name  from SharedPreferences
Future<String?> getParceldMenuNameFromPreference() async {
  return await getSharedPreferenceData(SharedPreferenceConstants.keyMenuParcel); // Get Menu name
}

//---------- Boolean values saving ---------//

// Retrieve API access token from SharedPreferences
Future<bool> getRememberMeFromPreference() async {
  var prefs = await SharedPreferences.getInstance(); // Retrieve an instance of SharedPreferences
  var isRememberMe = prefs.getBool(SharedPreferenceConstants.keyRememberMe); // Get the remember me
  return isRememberMe ?? false; // Return the API access token or null
}

// Save API access token to SharedPreferences
void saveRememberMeInPreference(bool isChekeck) async {
  var prefs = await SharedPreferences.getInstance(); // Retrieve an instance of SharedPreferences
  prefs.setBool(SharedPreferenceConstants.keyRememberMe, isChekeck); // Save the remember me check
}

//------------- Common Methods ----------- //

//Common method for decription
Future<String?> getSharedPreferenceData(String preferenceKey) async {
  var prefs = await SharedPreferences.getInstance(); // Retrieve an instance of SharedPreferences
  var encryptedString = prefs.getString(preferenceKey); // Get the login token
  var status = getDecryptedData(encryptedString);
  return status;
}

//Common method for encription
Future<void> savePreferenceData(String preferenceKey, String data) async {
  var prefs = await SharedPreferences.getInstance(); // Retrieve an instance of SharedPreferences
  var encodedString = getEncryptedData(data);
  if (encodedString != null) {
    prefs.setString(preferenceKey, encodedString); // Save the encoded data
  }
}

// Remove SharedPreferences data
void removePreference(String preferenceKey) async {
  var prefs = await SharedPreferences.getInstance(); // Retrieve an instance of SharedPreferences
  prefs.remove(preferenceKey); // Remove the preference
}

// Clear all preferences from SharedPreferences
void clearAllPreference() async {
  var prefs = await SharedPreferences.getInstance(); // Retrieve an instance of SharedPreferences
  prefs.clear(); // Clear all preferences
}
