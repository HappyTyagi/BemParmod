// Import necessary packages and classes
import 'package:bem/src/features/row/controllers/loader_controller.dart';
import 'package:bem/src/features/row/dependency/network_dependency_injection.dart';
import 'package:bem/src/features/row/environment/environment.dart';
import 'package:bem/src/features/row/routes/navigation_routes.dart';
import 'package:bem/src/features/row/view/login/login.dart';
import 'package:bem/src/utils/theme/theme.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/// Main method to start the application
void main() async {
  ///Set device orientation portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  //Firebase initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // Set environment to UAT
  EnvironmentConfig.setEnvironment(Environment.uat);

  runApp(const MyApp());

  //Network Provider injection to listen connectivity change
  NetworkInjection.init();
}

/// Entry point for the application to start.
class MyApp extends StatefulWidget {
  /// Creates a MyApp instance. You can use this to get access to the state of your app without having to worry about it being in a static context.
  ///
  ///
  /// @return a state that can be used to interact with the
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// Builds the widget. This is called by the build method and can be overridden to customize the widget.
  ///
  /// @param context - the context in which the widget is built.
  ///
  /// @return the widget to be displayed in the context's
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const Scaffold(body: Login()),
      getPages: AppRoutes.appRoutes(),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => LoaderController());
      }),
    );
  }
}
