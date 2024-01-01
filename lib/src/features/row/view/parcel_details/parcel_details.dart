// Import necessary custom components and constants
import 'package:bem/src/components/appbar/back_button.dart';
import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/text/common_text.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/view/drawer/drawer_menu.dart';
import 'package:bem/src/features/row/view/edit_parcel/edit_parcel.dart';
import 'package:bem/src/features/row/view/parcel_details/contact_tab.dart';
import 'package:bem/src/features/row/view/parcel_details/correspondence_tab.dart';
import 'package:bem/src/features/row/view/parcel_details/documents_tab.dart';
import 'package:bem/src/features/row/view/parcel_details/main_information_tab.dart';
import 'package:bem/src/features/row/view/parcel_details/parcel_details_tabBar.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// Widget for displaying parcel details
class ParcelDetails extends StatefulWidget {
  const ParcelDetails({super.key});

  @override
  State<ParcelDetails> createState() => _ParcelDetailsState();
}

// State class for ParcelDetails widget
class _ParcelDetailsState extends State<ParcelDetails> with SingleTickerProviderStateMixin {
  // Key for the Scaffold widget
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize TabController with 4 tabs for the details sections
    _tabController = TabController(length: 4, vsync: this);
    // Listen to tab changes
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold containing the ParcelDetails screen layout
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      // Background decoration with an image
      decoration: backgroundImageDecoration(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: transparent,
        appBar: getBackButton(context, title: ''), // Custom app bar with a back button
        drawer: const DrawerMenu(), // Drawer menu
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(40), // Custom vertical space
            // RichText to display project information
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: RichText(
                text: TextSpan(
                  text: "\u2022  ", // Bullet point
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: colorFF7D00,
                        fontWeight: FontWeight.w900,
                      ),
                  children: [
                    TextSpan(
                      text: "Project  #218039", // Project information
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: fontSize18,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            // Row containing parcel information and edit button
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    "Parcel #218039", // Parcel information
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  addHorizontalSpace(12), // Custom horizontal space
                  statusContainer(context, status), // Status container based on status
                  if (_selectedIndex == 0) const Spacer(), // Conditional spacer
                  if (_selectedIndex == 0)
                    ElevatedButton.icon(
                      onPressed: () {
                        Get.to(const EditParcel()); // Navigate to EditParcel screen
                      },
                      icon: const Image(
                        image: AssetImage('assets/images/edit.png'), // Edit icon
                        height: 32,
                        width: 32,
                        color: colorWhite,
                      ),
                      label: Text(
                        editParcel, // Edit Parcel label
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    )
                ],
              ),
            ),
            parcelDetailsTabBar(_tabController, _selectedIndex), // Tab bar for parcel details
            addVerticalSpace(8), // Custom vertical space
            addHorizontalDivider(), // Horizontal divider
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  ParcelMainInformation(), // Parcel main information tab
                  DocumentTab(), // Document tab
                  ContactTab(), // Contact tab
                  CorrespondenceTab(), // Correspondence tab
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
