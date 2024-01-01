import 'package:bem/src/features/row/routes/routes_name.dart';
import 'package:bem/src/features/row/view/all_parcels/all_parcels.dart';
import 'package:bem/src/features/row/view/contacts/add_contacts.dart';
import 'package:bem/src/features/row/view/contacts/edit_contact.dart';
import 'package:bem/src/features/row/view/correspondences/add_correspondence.dart';
import 'package:bem/src/features/row/view/dashboard/dashboard.dart';
import 'package:bem/src/features/row/view/document/add_document.dart';
import 'package:bem/src/features/row/view/edit_parcel/edit_parcel.dart';
import 'package:bem/src/features/row/view/login/login.dart';
import 'package:bem/src/features/row/view/notification/notifications.dart';
import 'package:bem/src/features/row/view/parcel_details/parcel_details.dart';
import 'package:bem/src/features/row/view/pdf/pdf_viewer.dart';
import 'package:bem/src/features/row/view/project_details/project_details.dart';
import 'package:bem/src/features/row/view/projects/projects.dart';
import 'package:bem/src/features/row/view/support/support_webview.dart';
import 'package:get/route_manager.dart';

// Manages and defines the application routes
class AppRoutes {
  // Static method that returns a list of defined application routes
  static appRoutes() => [
        // Login Screen Route
        GetPage(name: RouteName.loginScreen, page: () => const Login()),

        // Dashboard Screen Route
        GetPage(name: RouteName.dashboardScreen, page: () => const Dashboard()),

        // Notifications Screen Route
        GetPage(name: RouteName.notificationScreen, page: () => const Notifications()),

        // PDF Viewer Screen Route
        GetPage(name: RouteName.pdfviewerScreen, page: () => const PDFViewer()),

        // Parcel Details Screen Route
        GetPage(name: RouteName.parcelDetailsScreen, page: () => const ParcelDetails()),

        // Project Details Screen Route
        GetPage(name: RouteName.projectDetailsScreen, page: () => const ProjectDetails()),

        // Projects Screen Route
        GetPage(name: RouteName.projectsScreen, page: () => const Projects()),

        // Add Contact Screen Route
        GetPage(name: RouteName.addContactScreen, page: () => const AddContact()),

        // WebView Screen Route
        GetPage(name: RouteName.webviewScreen, page: () => const WebView()),

        // Edit Contact Screen Route
        GetPage(name: RouteName.editContactScreen, page: () => const EditContact()),

        // Add Correspondence Screen Route
        GetPage(name: RouteName.addCorrespondenceScreen, page: () => const AddCorrespondence()),

        // Add Document Screen Route
        GetPage(name: RouteName.addDocumentScreen, page: () => const AddDocument()),

        // Edit Parcel Screen Route
        GetPage(name: RouteName.editParcelScreen, page: () => const EditParcel()),

        // All Parcels Screen Route
        GetPage(name: RouteName.allParcelsScreen, page: () => const AllParcels()),
      ];
}
