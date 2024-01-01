import 'package:bem/src/components/appbar/appbar.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/features/row/controllers/dashboard_controller.dart';
import 'package:bem/src/features/row/view/dashboard/dashboard_header.dart';
import 'package:bem/src/features/row/view/drawer/drawer_menu.dart';
import 'package:bem/src/features/row/view/last_parcel/last_parcel.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Presentation layer class for dashboard UI
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(); // A GlobalKey that is used to identify the Scaffold widget
  DeviceType deviceType = getDeviceType(); // Determine the type of device (e.g., mobile, tablet)
  // Controller for business logic
  DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: backgroundImageDecoration(), // Set the background image decoration for the screen
      child: Scaffold(
        key: scaffoldKey, // Set the GlobalKey to the Scaffold
        backgroundColor: transparent,
        appBar: getAppBar(context, scaffoldKey, title: ''), // Set the AppBar for the screen
        drawer: const DrawerMenu(), // Set the DrawerMenu for the screen

        body: Column(
          //axis alignment
          mainAxisAlignment: MainAxisAlignment.start, // Align the children vertically to the start
          crossAxisAlignment: CrossAxisAlignment.start, // Align the children horizontally to the start
          //child
          children: [
            // Add vertical space
            addVerticalSpace(40), // Add a vertical space with a height of 40

            // Add dashboard header view
            getDashboardHeader(context, deviceType), // Get the dashboard header view

            Obx(
              () => Expanded(
                child: LastParcel(
                  parcelList: controller.parcelList.value,
                ), // Add the LastParcel widget in an expanded container to take the remaining vertical space
              ),
            ),
          ],
        ),
      ),
    );
  }
}
