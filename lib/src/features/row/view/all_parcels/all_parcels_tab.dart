import 'package:bem/src/components/buttons/view_map_button.dart';
import 'package:bem/src/components/card/parcel_card.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/controllers/all_parcels_controller.dart';
import 'package:bem/src/features/row/models/responseModels/parcel_response_model.dart';
import 'package:bem/src/features/row/view/map/map.dart';
import 'package:bem/src/features/row/view/search/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/device_helper.dart';

// StatefulWidget representing a tab for displaying all parcels.
class AllParcelsTab extends StatefulWidget {
  final showParcelCount;
  // Constructor for the AllParcelsTab widget.
  const AllParcelsTab({Key? key, this.showParcelCount = true}) : super(key: key);

  @override
  State<AllParcelsTab> createState() => _AllParcelState();
}

// State class for the AllParcelsTab widget.
class _AllParcelState extends State<AllParcelsTab> {
  // Initialize the AllParcelsController using Get.put.
  final AllParcelsController _controller = Get.put(AllParcelsController());

  // Determine the device type.
  DeviceType deviceType = getDeviceType();

  // Sample list of items.
  List<String> items = ["ABC", "DEF", "GHI", "JKH", "KKK", "HAGS", "HSF", "JSHS", "USGR", "JJSHS", "LL", "IGS"];

  @override
  Widget build(BuildContext context) {
    // Build method for the stateful widget.
    // Scaffold widget containing a Container with a background decoration.
    return Scaffold(
        body: Container(
      // Container covering the entire screen with padding and a background gradient decoration.
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: gradiantBackground(), // Applying a gradient background to the container.
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.showParcelCount)
            // Text widget displaying the number of parcels.
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Text("Parcels: 134", style: Theme.of(context).textTheme.bodyMedium),
            ),

          // Text widget displaying the description of the last project.
          Text(
            allParcelsDescription,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: color6F6E81, // Customizing text color.
                ),
          ),

          //Add Layout to show Gridview or ListView
          Flex(
            direction: deviceType == DeviceType.Phone ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,

            //Adding children to show search box and map toggle button
            children: [
              //Add search view
              searchWidget(context),

              //add Space for tablet
              if (deviceType == DeviceType.Tablet) const Spacer(),

              //add Toggle Button for Map
              ViewMapButton(
                onClick: () {
                  _controller.onMapClick();
                },
              ),
            ],
          ),

          addVerticalSpace(16), // Add a vertical space with a height of 40

          //Add Gridview to show parcels
          Obx(
            () => Visibility(
              visible: !_controller.showMap.value,
              child: Flexible(
                child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: deviceType == DeviceType.Phone ? 1 : 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 360,
                  ),
                  itemBuilder: (context, index) {
                    return ParcelCard(
                      parcelModel: ParcelResponseModel(),
                    );
                  },
                ),
              ),
            ),
          ),

          // Adding vertical space using a custom function or widget (not defined in this snippet).
          addVerticalSpace(16),

          // Obx widget that reacts to changes in the '_controller.showMap' boolean value.
          Obx(
            () => Visibility(
              // Making the child (MapScreen) visible based on the '_controller.showMap' value.
              visible: _controller.showMap.value,
              // Using Expanded widget to fill the remaining space with the MapScreen.
              child: const Expanded(child: MapScreen()),
            ),
          ),
        ],
      ),
    ));
  }
}
