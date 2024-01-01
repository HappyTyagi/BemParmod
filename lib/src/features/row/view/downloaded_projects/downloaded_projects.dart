// Importing the ProjectCard component for displaying project details.
import 'package:bem/src/components/card/project_card.dart';

// Importing decoration utilities for UI styling.
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/components/spaces/widget_space.dart';

// Importing color constants used in the app.
import 'package:bem/src/constants/app_color.dart';

// Importing text constants for displaying text.
import 'package:bem/src/constants/text_strings.dart';

// Importing the search bar component.
import 'package:bem/src/features/row/view/search/search_bar.dart';

// Importing utility for fetching device information.
import 'package:bem/src/utils/device_helper.dart';

// Importing Flutter material package.
import 'package:flutter/material.dart';

// Stateful widget representing the downloaded projects view.
class DownloadedProjects extends StatefulWidget {
  const DownloadedProjects({super.key});

  @override
  State<DownloadedProjects> createState() => _DownloadedProjectsState();
}

// State class for the DownloadedProjects widget.
class _DownloadedProjectsState extends State<DownloadedProjects> {
  // Variable to hold the type of device (Phone/Tablet).
  var isTabletDevice = isTablet();

  // List containing project names or identifiers.
  List<String> items = ["ABC", "DEF", "GHI", "JKH", "KKK", "HAGS", "HSF", "JSHS", "USGR", "JJSHS", "LL", "IGS"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Decorating the container with a gradient background.
        decoration: gradiantBackground(),
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Displaying the 'Downloaded' text.
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Text(downloaded, style: Theme.of(context).textTheme.bodyMedium),
            ),
            Text(
              lastProjectDescription,
              // Styling the description text color.
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: color6F6E81),
            ),

            // Displaying the search widget for filtering projects.
            Flex(
              direction: isTabletDevice ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                searchWidget(context),
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
                        synchronizeData,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: colorWhite),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Flexible(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // Setting the number of columns based on the device type.
                  crossAxisCount: isTabletDevice ? 2 : 1,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  // Setting the height of each grid item.
                  mainAxisExtent: 240,
                ),
                itemBuilder: (context, index) {
                  return ProjectCard(
                    // Passing project details to the ProjectCard component.
                    name: items[index],
                    // Displaying the download option in the card.
                    showDownload: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
