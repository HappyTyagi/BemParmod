// Import necessary packages and classes
import 'package:bem/src/components/checkbox/checkboxField.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/components/dropdown/dropdown.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/controllers/login_controller.dart';
import 'package:bem/src/features/row/view/support/support_webview.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Login UI creation class for presentation layer.
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

/// State class for login state management
class _LoginState extends State<Login> {
  // Controller for business logic
  LoginController controller = Get.put(LoginController());

  // Constraints for adjusting UI based on device type
  double flexConstraint = 0;
  double contentPadding = 0;
  // Determine the type of device (e.g., mobile, tablet)
  var isTabletView = isTablet();

  // A GlobalKey that is used to identify the Scaffold widget
  var formKey = GlobalKey<FormState>();

  /// Initialize state. Called on layout start and on layout re - layout if we need to
  @override
  void initState() {
    super.initState();
    flexConstraint = isTabletView ? 1.5 : 1;
    contentPadding = isTabletView ? 16 : 0;

    /// Check for virsion upgrade dialog
    Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        if (controller.showVersionDialog.value) {
          showAlert(context, controller);
        }
      },
    );
  }

  Future<void> onLoginClick() async {
    // Perform login if form key is valid.
    if (formKey.currentState!.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());
      controller.performLogin();
    }
  }

  void onSupportTap() {
    Get.to(const WebView());
  }

  // Build method for the screen
  @override
  Widget build(BuildContext context) {
    return Container(
      // Container dimensions and decoration
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/background.png"), fit: BoxFit.cover),
      ),
      // Scaffold for the screen
      child: Scaffold(
        backgroundColor: transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              // Container decoration and constraints
              decoration: isTabletView ? backgroundWhiteDecoration() : backgroundImageDecoration(),
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: isTabletView ? Get.height / 1.65 : Get.height / 1.25,
              ),
              // Column for the content
              child: Column(
                children: [
                  /// Vertical Space added
                  addVerticalSpace(80),

                  /// Welcome Text
                  Text(welcomeTitle, style: Theme.of(context).textTheme.displayMedium),

                  /// Add vertical Space
                  addVerticalSpace(20),

                  /// Preloading progress show
                  // Obx(
                  //   () => Visibility(
                  //     visible: controller.preLoading.value,
                  //     child: Column(
                  //       children: [
                  //         addVerticalSpace(80),
                  //         const CircularProgressIndicator(
                  //           color: color3A71FF,
                  //         ),
                  //         addVerticalSpace(40),
                  //         Text(
                  //           pleaseWait,
                  //           style: Theme.of(context).textTheme.displaySmall,
                  //           textAlign: TextAlign.center,
                  //           overflow: TextOverflow.visible,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  /// Check for DOT selection dropdown
                  Obx(
                    () => Visibility(
                      visible: controller.showDOTSelectionUI.value,
                      child: SizedBox(
                        width: isTabletView ? Get.width / 2 : Get.width / 1.25,
                        child: Column(
                          children: [
                            ///Customer dropdown
                            DropDownList.valodate(
                              hint: selectDot,
                              mList: controller.dotList.value,
                              title: dot,
                              onChanged: controller.onDOTChange,
                              formKey: controller.dropdownformKey,
                            ),

                            /// Add virtical space
                            addVerticalSpace(48),

                            /// Add save button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(60), // NEW
                              ),
                              onPressed: controller.saveDoTSelection,
                              child: Text(
                                save,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// Show login fields
                  Obx(
                    () => Visibility(
                      visible: controller.showLoginUI.value,
                      child: Column(
                        children: [
                          /// Description text
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / flexConstraint,
                              height: 50,
                              child: Text(
                                loginDescription,
                                style: Theme.of(context).textTheme.displaySmall,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ),

                          ///Container for login fields
                          Container(
                            width: MediaQuery.of(context).size.width / flexConstraint,
                            margin: isTabletView ? null : const EdgeInsets.all(16),
                            padding: EdgeInsets.only(left: contentPadding, right: contentPadding),
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  // Username Text
                                  addVerticalSpace(16),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 16, right: 16),
                                        child: Image(
                                          image: AssetImage('assets/images/user.png'),
                                          height: 20,
                                          width: 20,
                                        ),
                                      ),
                                      Text(
                                        username,
                                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: fontSize14),
                                      ),
                                    ],
                                  ),
                                  addVerticalSpace(4),

                                  // Username  TextField
                                  TextFormField(
                                    controller: controller.usernameController,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    maxLines: 1,
                                    maxLength: 50,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Username is required.';
                                      }

                                      if (value.length < 6) {
                                        return 'Username is too small.';
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    decoration: textInputDecoration(usernameHint, padding: 18, radius: 12),
                                    scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                  ),

                                  addVerticalSpace(24),
                                  //Password Text
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                                        child: Image(
                                          image: AssetImage('assets/images/lock.png'),
                                          height: 20,
                                          width: 20,
                                        ),
                                      ),
                                      Text(
                                        password,
                                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: fontSize14),
                                      ),
                                    ],
                                  ),
                                  addVerticalSpace(4),

                                  //Password Field
                                  Obx(
                                    () => TextFormField(
                                      controller: controller.passwordController,
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      maxLines: 1,
                                      maxLength: 15,
                                      enableInteractiveSelection: false,
                                      obscureText: !controller.passwordVisible.value,
                                      decoration: InputDecoration(
                                        counterText: '',
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              controller.passwordVisible.value = !controller.passwordVisible.value;
                                            },
                                            icon: controller.passwordVisible.value
                                                ? const Image(
                                                    image: AssetImage('assets/images/eye_open.png'),
                                                    height: 20,
                                                    width: 20,
                                                    color: color3A71FF,
                                                  )
                                                : const Image(
                                                    image: AssetImage('assets/images/eye_closed.png'),
                                                    height: 20,
                                                    width: 20,
                                                    color: color3A71FF,
                                                  )),
                                        hintText: passwordHint,
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: colorDCDCDC,
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(12))),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: colorDCDCDC,
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(12))),
                                        errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(12))),
                                        focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.all(Radius.circular(12))),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Password is required.';
                                        }
                                        if (value.length < 6) {
                                          return 'Password is too small.';
                                        }
                                        return null;
                                      },
                                      textInputAction: TextInputAction.go,
                                      onFieldSubmitted: (_) => {FocusScope.of(context).unfocus(), onLoginClick()},
                                    ),
                                  ),

                                  // Checkbox
                                  addVerticalSpace(16),

                                  Obx(() => CheckBoxField(
                                      title: rememberMe,
                                      onChanged: (value) {
                                        controller.rememberUser.value = value!;
                                      },
                                      value: controller.rememberUser.value)),

                                  addVerticalSpace(24),
                                  // Login Button
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size.fromHeight(60), // NEW
                                    ),
                                    onPressed: onLoginClick,
                                    child: Text(
                                      login,
                                      style: Theme.of(context).textTheme.labelLarge,
                                    ),
                                  ),

                                  //  Support
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
                                    child: GestureDetector(
                                      onTap: onSupportTap,
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text: needHelp,
                                          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w500),
                                          children: [
                                            TextSpan(
                                              text: support,
                                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    decoration: TextDecoration.underline,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  //  Copy Right
                                  Text(
                                    copyRightText,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  addVerticalSpace(20)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to display an alert dialog for update
void showAlert(BuildContext context, LoginController controller) {
  AlertDialog alert = AlertDialog(
    // Alert dialog title
    title: Text(updateTitle, style: Theme.of(context).textTheme.headlineSmall),
    // Alert dialog content
    content: Text(updateMessage, style: Theme.of(context).textTheme.titleLarge),
    actions: [
      if (!controller.checkIsForceUpdateApplication.value)
        TextButton(
            onPressed: controller.remindMeLater,
            child: Text(
              remindMe,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(color: colorBlack),
            )),
      // Update now button
      TextButton(
        child: Text(
          updateNow,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: color3A71FF),
        ),
        onPressed: () {
          openStore();
          Get.back();
        },
      ),
    ],
  );

  // show the dialog
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
