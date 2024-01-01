import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/text/common_text.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/view/project_details/project_details.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// A custom card widget for displaying project details
class ProjectCard extends StatelessWidget {
  final bool showDownload;
  const ProjectCard({super.key, required String name, this.showDownload = false});

  @override
  Widget build(BuildContext context) {
    // Container for the overall card layout
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: whiteContainer(), // Custom decoration for the container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row for status display and download/delete option
          Row(
            children: <Widget>[
              statusContainer(context, status), // Custom widget for displaying status
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
                          decoration: documentBorder(radius: 12), // Custom border decoration
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                          child: const Image(
                            image: AssetImage('assets/images/delete.png'), // Image for deletion
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ],
                    )
                  : Container(
                      decoration: documentBorder(radius: 12), // Custom border decoration
                      padding: const EdgeInsets.all(8),
                      child: const Image(
                        image: AssetImage('assets/images/downloaded_active.png'), // Image for download
                        height: 20,
                        width: 20,
                        color: color3A71FF, // Custom color for the downloaded image
                      ),
                    ),
            ],
          ),
          locationText(context, "California, USA"), // Custom widget for displaying location text
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
            child: Row(
              children: <Widget>[
                Text(
                  "Name Project", // Project name text
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: color374151, // Custom text color
                      ),
                ),
                const Spacer(), // Spacer widget to push elements to the right edge
                Text(
                  "#218039", // Project number text
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500, // Custom font weight
                        color: color374151, // Custom text color
                      ),
                ),
              ],
            ),
          ),
          addHorizontalDivider(), // Custom horizontal divider widget
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Row(
              children: <Widget>[
                Text(
                  "20 Parcels", // Parcel count text
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color374151, fontSize: fontSize18),
                ),
                const Spacer(), // Spacer widget to push elements to the right edge
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const ProjectDetails()); // Navigate to project details screen
                  },
                  child: Text(
                    seeDetails, // Text for the button
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: colorWhite), // Custom text style
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
