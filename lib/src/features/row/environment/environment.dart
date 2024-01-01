// Enum to define the different environments
import 'package:bem/src/services/web_service/app_url.dart';
import 'package:bem/src/utils/shared_preference_helper.dart';

enum Environment { uat, prod }

// Helper class to manage environment-related settings
class EnvironmentConfig {
  // Function to set the current environment
  static void setEnvironment(Environment environment) async {
    switch (environment) {
      case Environment.uat:
        await saveBaseEndPointInPreference(BaseURL.uatApi);
        break;
      case Environment.prod:
        await saveBaseEndPointInPreference(BaseURL.prodApi);
        break;
      default:
        // Default to PROD environment if no valid environment is provided
        await saveBaseEndPointInPreference(BaseURL.prodApi);
        break;
    }
  }
}
