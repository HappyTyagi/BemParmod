import 'package:bem/src/components/alerts/delete_alert.dart';
import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/text/common_text.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/models/responseModels/parcel_response_model.dart';
import 'package:bem/src/features/row/view/parcel_details/parcel_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Creates and returns a ParcelCard widget. If showDownload is true the user.dart will be asked to download the file if they click on the button.
class ParcelCard extends StatelessWidget {
  final bool showDownload;
  final ParcelResponseModel parcelModel;

  // Constructor for ParcelCard widget
  const ParcelCard({super.key, required this.parcelModel, this.showDownload = false});

  @override
  Widget build(BuildContext context) {
    String statusName = parcelModel.parcelStatus ?? status;
    String location = '${parcelModel.parcelAddress}, USA' ?? "California, USA";
    String parcelNumberText = parcelModel.parcelNo != null ? "#${parcelModel.parcelNo}" : "#218093";
    String ownerNameText = parcelModel.propertyOwnerName ?? "Owner Name";
    String projectNumberText = parcelModel.projectNoPin != null ? " Project #${parcelModel.projectNoPin!}" : " Project #213154";

    // Container for the entire card layout
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: whiteContainer(), // Custom decoration for the container
      child: Column(
        children: [
          // Container for displaying an image (map) with status and download/delete option
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(image: AssetImage("assets/images/map.png"), fit: BoxFit.cover),
            ),
            child: Row(
              children: <Widget>[
                statusContainer(context, statusName), // Custom widget for displaying status
                const Spacer(), // Spacer widget to push elements to the right edge
                showDownload
                    ? Row(
                        children: [
                          Container(
                            decoration: documentBorder(radius: 12), // Custom border decoration
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                            child: const Image(
                              image: AssetImage('assets/images/sync_complete.png'), // Image for deletion
                              height: 24,
                              width: 24,
                            ),
                          ),
                          addHorizontalSpace(8),
                          Container(
                            decoration: whiteContainer(radius: 12), // Custom border decoration
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                            child: GestureDetector(
                              onTap: () {
                                showDeleteParcelAlert(context); // Function to show delete alert
                              },
                              child: const Image(
                                image: AssetImage('assets/images/delete.png'), // Image for deletion
                                height: 24,
                                width: 24,
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(
                        decoration: whiteContainer(radius: 12), // Custom border decoration
                        padding: const EdgeInsets.all(8),
                        child: const Image(
                          image: AssetImage('assets/images/download.png'), // Image for download
                          height: 20,
                          width: 20,
                        ),
                      ),
              ],
            ),
          ),
          addVerticalSpace(8), // Custom widget to add vertical space
          locationText(context, location), // Custom widget for displaying location text
          addVerticalSpace(20), // Custom widget to add vertical space
          Row(
            children: <Widget>[
              Text(
                parcelNumberText, // Parcel number text
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: color374151, // Custom text color
                    ),
              ),
              const Spacer(), // Spacer widget to push elements to the right edge
              RichText(
                text: TextSpan(
                  text: "\u2022", // Bullet symbol
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: colorFF7D00, // Custom bullet color
                        fontWeight: FontWeight.w900, // Custom font weight
                      ),
                  children: [
                    TextSpan(
                      text: projectNumberText, // Project text
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: color6C6C6C, // Custom text color
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          addVerticalSpace(8), // Custom widget to add vertical space
          addHorizontalDivider(), // Custom horizontal divider widget
          addVerticalSpace(16), // Custom widget to add vertical space
          Row(
            children: <Widget>[
              Text(
                ownerNameText, // Owner name text
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color374151, fontSize: fontSize18),
                overflow: TextOverflow.ellipsis, // Custom text style
              ),
              const Spacer(), // Spacer widget to push elements to the right edge
              arrowButton(() {
                Get.to(() => const ParcelDetails()); // Navigate to ParcelDetails screen
              })
            ],
          ),
        ],
      ),
    );
  }
}
