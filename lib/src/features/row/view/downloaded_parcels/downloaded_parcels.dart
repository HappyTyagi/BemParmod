// Importing necessary dependencies and custom components
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
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// StatefulWidget for displaying downloaded parcels
class DownloadedParcel extends StatefulWidget {
  const DownloadedParcel({super.key});

  @override
  State<DownloadedParcel> createState() => _DownloadedParcelState();
}

// State class for DownloadedParcel widget
class _DownloadedParcelState extends State<DownloadedParcel> {
  // Getting device type (phone, tablet, etc.)
  var isTabletDevice = isTablet();
  final AllParcelsController _controller = Get.put(AllParcelsController());

  // List of items representing parcel names
  List<String> items = ["ABC", "DEF", "GHI", "JKH", "KKK", "HAGS", "HSF", "JSHS", "USGR", "JJSHS", "LL", "IGS"];

  @override
  Widget build(BuildContext context) {
    // Scaffold displaying the downloaded parcels
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: gradiantBackground(), // Applying gradient background decoration
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text widget displaying the number of parcels.
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Text("Parcels: 134", style: Theme.of(context).textTheme.bodyMedium),
            ),

            Text(
              lastProjectDescription, // Text describing the last project
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: color6F6E81, // Custom text color
                  ),
            ),
            // Displaying the search widget for filtering projects.
            Flex(
              direction: isTabletDevice ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                searchWidget(context),
                //add Toggle Button for Map
                ViewMapButton(
                  onClick: () {
                    _controller.onMapClick();
                  },
                ),

                ///Button for Sync All
                ElevatedButton(
                  onPressed: () {},
                  child: Wrap(
                    children: [
                      const Image(
                        image: AssetImage('assets/images/sync.png'),
                        height: 20,
                        width: 20,
                        color: colorWhite,
                      ),
                      addHorizontalSpace(8),
                      Text(
                        synchronizeAll,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: colorWhite),
                      ),
                    ],
                  ),
                ),
              ],
            ), // Custom search widget for searching parcels
            //Add Gridview to show parcels
            Obx(
              () => Visibility(
                visible: !_controller.showMap.value,
                child: Flexible(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(), // Disabling scrolling within GridView
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    itemCount: items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isTabletDevice ? 2 : 1, // Setting cross axis count based on device type
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      mainAxisExtent: 360, // Setting main axis extent for GridView items
                    ),
                    itemBuilder: (context, index) {
                      return ParcelCard(
                        parcelModel: ParcelResponseModel(), // Passing parcel name to ParcelCard widget
                        showDownload: true, // Setting showDownload property to true
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
      ),
    );
  }
}
