// Import necessary packages and classes
import 'package:bem/src/components/alerts/connection_error_alert.dart';
import 'package:bem/src/components/alerts/no_internet_alert.dart';
import 'package:bem/src/features/row/controllers/base_controller.dart';
import 'package:bem/src/features/row/controllers/network_controller.dart';
import 'package:bem/src/features/row/models/responseModels/all_customers_response_model.dart';
import 'package:bem/src/features/row/controller_service/login_service.dart';
import 'package:bem/src/features/row/models/responseModels/user.dart';
import 'package:bem/src/features/row/view/dashboard/dashboard.dart';
import 'package:bem/src/services/logger/logging_service.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:bem/src/utils/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bem/src/constants/text_strings.dart';

// Class managing login-related functionality
class LoginController extends BaseController {
  // Observables managing UI states related to login and application details
  RxBool passwordVisible = false.obs;
  RxBool rememberUser = false.obs;
  RxBool showLoginUI = false.obs;
  RxBool showDOTSelectionUI = false.obs;
  RxBool showVersionDialog = false.obs;
  RxBool checkIsForceUpdateApplication = false.obs;
  RxList<String> dotList = <String>[].obs;
  RxString setDoTSelction = ''.obs;

  // Text editing controllers for username and password fields
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Instance of LoginService for handling login-related tasks
  final _loginService = LoginService();

  // Global Form key for form validation
  var dropdownformKey = GlobalKey<FormState>();

  late List<CustomersRM> dOTCustomers;
  CustomersRM? selectedCustomer;

  // Initialization method triggered when the controller is ready
  @override
  void onInit() {
    super.onInit();

    // Retrieve application details and customer details
    getApplicationDetails();
  }

  // Function to retrieve application details
  void getApplicationDetails() async {
    /// Capture remote logs
    LoggingService.remoteLog('Login:LoginController:GetApplicationDetails');
    var selectedDOT = await getCustomerProductIdFromPreference();

    /// Capture remote logs
    LoggingService.remoteLog('Login:LoginController:GetApplicationDetails:DoT accessed from Shared Preference');

    // Logic to retrieve application details and handle DOT selection
    if (selectedDOT == null) {
      /// Capture remote logs
      LoggingService.remoteLog('Login:LoginController:GetApplicationDetails: No Preference set for DOT');
      getCustomerList();
    } else {
      checkLoginStatus();
    }

    checkApplicationUpdate();
  }

  // Function to retrieve list of customers
  void getCustomerList() async {
    /// Capture remote logs
    LoggingService.remoteLog('Login:LoginController:getCustomerList');

    //Check internet connectivity
    var isConnected = await NetworkController().isConnectionAvailable();
    if (isConnected) {
      /// Capture remote logs
      LoggingService.remoteLog('Login:LoginController:getCustomerList:API call');

      try {
        loaderController.showLoader();
        var customerList = await _loginService.fetchCustomers();
        if (customerList != null) {
          dOTCustomers = customerList;

          List<String?> shortNames = customerList.map((customer) => customer.shortName).toList();
          // Filtering out null values and converting to non-nullable strings
          List<String> customers = shortNames.where((name) => name != null).map((name) => name!).toList();

          customers.sort();
          dotList.value = customers;

          // preLoading.value = false;
          showDOTSelectionUI.value = true;

          ///Hide the loader
          LoggingService.logDebug('Hide loader');
          loaderController.hideLoader();

          /// Capture remote logs
          LoggingService.remoteLog('Login:LoginController:getAuthenticationToken:Received Customer Response Successfully');
        }
      } catch (e) {
        /// Capture remote logs
        LoggingService.remoteLog('Login:LoginController:getAuthenticationToken:Exception occurred: $e');

        // hide loader
        loaderController.hideLoader();

        // Handle request timeout exception.
        handleException(e);
      }
    } else {
      showNoInternetAlert();

      /// Capture remote logs
      LoggingService.remoteLog('Login:LoginController:getCustomerList:No Internet Customer call');
    }
  }

  // Function to check the login status
  checkLoginStatus() async {
    /// Capture remote logs
    LoggingService.remoteLog('Login:LoginController:checkLoginStatus');
    // preLoading.value = false;
    var loginToken = await getLoginTokenFromPreference();

    /// Capture remote logs
    LoggingService.remoteLog('Login:LoginController:checkLoginStatus: Status = $loginToken');
    // Show the login UI if the login status is empty.
    if (loginToken.isEmpty) {
      showLoginUI.value = true;
    } else {
      var rememberMe = await getRememberMeFromPreference();

      /// Capture remote logs
      LoggingService.remoteLog('Login:LoginController:rememberMe: $rememberMe');

      if (rememberMe) {
        // Show the version dialog if showVersionDialog. value is true.
        if (!showVersionDialog.value) {
          Get.offAll(const Dashboard());
        }
      } else {
        showLoginUI.value = true;
      }
    }
  }

  /// Check for application update and update if needed This is called from UI thread so don't call it
  void checkApplicationUpdate() {
    showVersionDialog.value = false;

    //TODO: Version check from API call
    // showVersionDialog = true; //This will be checked from API
    // showVersionDialog = false;
    //   isForceUpdateApplication = false; // check for force upgrade
  }

  // Function to handle DOT selection change
  onDOTChange(String? selectedDOT) {
    /// Capture remote logs
    LoggingService.remoteLog('Login:LoginController:onDOTChange');

    // Set the value of the selectedDOT property.
    if (selectedDOT != null) {
      setDoTSelction.value = selectedDOT;

      // Filtering AllCustomersRM objects where shortName is selectedDOT

      for (var cust in dOTCustomers) {
        if (cust.shortName == selectedDOT) {
          selectedCustomer = cust;
          break; // Stop looping once found
        }
      }

      print('Selected DOT = $selectedCustomer');
    }
  }

  // Function to save DOT selection
  saveDoTSelection() async {
    LoggingService.logDebug('Login:LoginController:saveDoTSelection');

    // Check if the current state of the dropdownFormKey is valid.
    if (dropdownformKey.currentState!.validate()) {
      /// Capture remote logs
      LoggingService.remoteLog('Login:LoginController:saveDoTSelection:Valid');

      var isConnected = await NetworkController().isConnectionAvailable();
      if (isConnected) {
        try {
          loaderController.showLoader();

          var customerId = selectedCustomer?.id!;
          var customerDetails = await _loginService.getCustomerDetails(customerId!);

          if (customerDetails != null) {
            // Hide loader
            loaderController.hideLoader();

            LoggingService.logDebug('Customer info $customerDetails');

            if (customerDetails.customerProductId != null) {
              // Save Customer Product Id in preference
              saveCustomerProductIdInPreference(customerDetails.customerProductId!);

              // Capture remote log
              LoggingService.remoteLog('Login:LoginController:saveDoTSelection:Saving in Preference');

              showDOTSelectionUI.value = false;
              showLoginUI.value = true;

              checkLoginStatus();
            } else {
              showConnectionErrorDialog(title: saveDOTErrorTitle, message: saveDOTErrorMessage);
            }
          }
        } catch (e) {
          loaderController.hideLoader();

          LoggingService.remoteLog('Login:LoginController:saveDoTSelection:Exception $e');
        }
      } else {
        showNoInternetAlert();

        loaderController.hideLoader();

        /// Capture remote logs
        LoggingService.remoteLog('Login:LoginController:getCustomerDetails Call:No Internet');
      }
    }
  }

  // Function to perform login
  void performLogin() async {
    /// Capture remote logs
    LoggingService.remoteLog('Login:LoginController:performLogin');

    var isConnected = await NetworkController().isConnectionAvailable();

    // This method is called when the user.dart is connected to the server.
    if (isConnected) {
      try {
        loaderController.showLoader();

        UserResponseModel userResponsebeModel = await _loginService.performLogin(usernameController.value.text, passwordController.value.text);

        //Hide loader
        loaderController.hideLoader();

        /// Capture remote logs
        LoggingService.remoteLog('Login:LoginController:performLogin:Login Success');
        if (rememberUser.value) {
          saveRememberMeInPreference(rememberUser.value);

          /// Capture remote logs
          LoggingService.remoteLog('Login:LoginController:performLogin:Remember Me saved in Pref');
        }

        /// Capture remote logs
        LoggingService.remoteLog('Login:LoginController:performLogin:Saved login token in Pref');

        if (userResponsebeModel.token != null) {
          ///Save Token in Preference
          saveLoginTokenInPreference(userResponsebeModel.token!);
        }

        if (userResponsebeModel.userId != null) {
          ///Save UserId in Preference
          saveUserIdInPreference(userResponsebeModel.userId!);
        }

        /// Go to Dashboard UI
        Get.to(() => const Dashboard());
      } catch (e) {
        //Hide loader
        loaderController.hideLoader();

        // handle exception
        handleException(e);

        /// Capture remote logs
        LoggingService.remoteLog('Login:LoginController:performLogin:Exception $e');
      }
    } else {
      showNoInternetAlert();

      /// Capture remote logs
      LoggingService.remoteLog('Login:LoginController:performLogin:No Internet');
    }
  }

  // Function to remind user later for the application update
  void remindMeLater() {
    showVersionDialog.value = false;
    Get.back();
    checkLoginStatus();
  }

  // Function to validate email
  String? validateEmail(String emailId) {}
}
