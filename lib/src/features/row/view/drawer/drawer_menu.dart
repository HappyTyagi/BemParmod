import 'package:bem/src/components/alerts/alerts.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/controllers/drawer_menu_controller.dart';
import 'package:bem/src/features/row/view/all_parcels/all_parcels.dart';
import 'package:bem/src/features/row/view/dashboard/dashboard.dart';
import 'package:bem/src/features/row/view/projects/projects.dart';
import 'package:bem/src/features/row/view/support/support_webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Creates and returns the drawer menu.
class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  DrawerMenuController controller = Get.put(DrawerMenuController());

  /// Called when the state is initialized. This is the first thing that needs to be done to get the DOT
  @override
  void initState() {
    super.initState();
  }

  /// Builds the dashboard widget. This is called by the framework and should not be called directly by the user.dart.
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1.5,
      backgroundColor: colorWhite,
      child: Column(
        children: [
          /// Show BEM Logo
          Container(
            padding: const EdgeInsets.fromLTRB(12, 40, 12, 40),
            color: colorWhite,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Image.asset(
                  'assets/images/bemlogo.png',
                  height: 40,
                ),
              ],
            ),
          ),

          /// Show Dashboard menu
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                /// Dashboard Menu
                ListTile(
                  title: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Image(
                            image: AssetImage('assets/images/dashboard_menu.png'),
                            height: 40,
                            width: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            controller.dashboardText.value,
                            style: Menu.dashboard.index == controller.selectedMenuIndex.value
                                ? Theme.of(context).textTheme.bodySmall?.copyWith(color: color494A54)
                                : Theme.of(context).textTheme.titleLarge?.copyWith(color: colorABABAB),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    controller.saveMenuSelection(Menu.dashboard.index);
                    Get.back();
                    Get.to(() => const Dashboard());
                  },
                  tileColor: Menu.dashboard.index == controller.selectedMenuIndex.value ? colorWhite : transparent,
                ),

                /// Project Menu
                ListTile(
                  title: Obx(
                    () => Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Image(
                            image: AssetImage('assets/images/project_menu.png'),
                            height: 40,
                            width: 40,
                          ),
                        ),
                        Text(controller.yourProjectText.value,
                            style: Menu.project.index == controller.selectedMenuIndex.value
                                ? Theme.of(context).textTheme.bodySmall?.copyWith(color: color494A54)
                                : Theme.of(context).textTheme.titleLarge?.copyWith(color: colorABABAB)),
                      ],
                    ),
                  ),
                  onTap: () {
                    controller.saveMenuSelection(Menu.project.index);
                    Get.back();
                    Get.to(() => const Projects());
                  },
                  tileColor: Menu.project.index == controller.selectedMenuIndex.value ? colorWhite : transparent,
                ),

                /// All Parcels Menu
                ListTile(
                  title: Obx(
                    () => Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Image(
                            image: AssetImage('assets/images/parcel_menu.png'),
                            height: 40,
                            width: 40,
                          ),
                        ),
                        Text(controller.parcelText.value,
                            style: Menu.parcels.index == controller.selectedMenuIndex.value
                                ? Theme.of(context).textTheme.bodySmall?.copyWith(color: color494A54)
                                : Theme.of(context).textTheme.titleLarge?.copyWith(color: colorABABAB)),
                      ],
                    ),
                  ),
                  onTap: () {
                    controller.saveMenuSelection(Menu.parcels.index);
                    Get.back();
                    Get.to(() => const AllParcels());
                  },
                  tileColor: Menu.parcels.index == controller.selectedMenuIndex.value ? colorWhite : transparent,
                ),
              ],
            ),
          ),

          /// Logout Menu
          ListTile(
            title: Container(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              decoration: textBorder(radius: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/images/menu_logout.png'),
                    height: 32,
                    width: 32,
                  ),
                  addHorizontalSpace(8),
                  Text(
                    menuLogout,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: color3A71FF,
                          fontSize: fontSize16,
                        ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Get.back();
              showLogoutAlert(context);
            },
          ),

          /// Support Menu
          ListTile(
            title: RichText(
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
            onTap: () {
              Get.to(() => const WebView());
            },
          ),
          addVerticalSpace(30)
        ],
      ),
    );
  }
}
