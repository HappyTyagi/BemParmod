//Import packages and classes
import 'package:bem/src/components/appbar/appbar.dart';
import 'package:bem/src/components/header/header.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/view/all_parcels/all_parcels_tab.dart';
import 'package:bem/src/features/row/view/drawer/drawer_menu.dart';
import 'package:flutter/material.dart';

// StatefulWidget representing the AllParcels screen or page
class AllParcels extends StatefulWidget {
  const AllParcels({super.key});

  @override
  State<AllParcels> createState() => _AllParcelsState();
}

class _AllParcelsState extends State<AllParcels> {
  // Creating a GlobalKey to manage the state of the Scaffold.
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Setting the container's width to the device's width.
      height: MediaQuery.of(context).size.height, // Setting the container's height to the device's height.
      decoration: backgroundImageDecoration(), // Applying a decoration to the container (background image or styling).
      // Creating a Scaffold widget as the main structure for the screen.
      child: Scaffold(
        // Scaffold properties and widgets will be added here.
        key: scaffoldKey,
        backgroundColor: transparent,
        appBar: getAppBar(context, scaffoldKey, title: ""),
        drawer: const DrawerMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// add vertical space
            addVerticalSpace(40),

            /// Add the header information
            headerView(context, allParcels, parcelDescription),

            //Add Parcel Tab
            const Expanded(child: AllParcelsTab(showParcelCount: false))
          ],
        ),
      ),
    );
  }
}
